/* Implementation of jac.h */

#include "jac.h"
#include "util.h"
#include "integration.h"

#include "fmiFunctions_fwd.h"

/* Sundials */
#include <cvode/cvode.h>
#include <sundials/sundials_math.h>
#include <nvector/nvector_serial.h>
#include <sundials/sundials_direct.h>
#include <sunmatrix/sunmatrix_dense.h>

#include <assert.h>
#include <time.h>

extern int QJacobianDefined_;
DYMOLA_STATIC void SetDymolaJacobianPointers(struct DYNInstanceData* did_, double* QJacobian_, double* QBJacobian_, double* QCJacobian_, double* QDJacobian_, int QJacobianN_,
	int QJacobianNU_, int QJacobianNY_, double* QJacobianSparse_, int* QJacobianSparseR_, int* QJacobianSparseC_, int QJacobianNZ_);

/* ----------------- local function declarations ----------------- */

/* common function for J and J * v computation */
static int compute_Jdata(realtype t, N_Vector y, N_Vector fy, N_Vector v,
				  SUNMatrix J, N_Vector Jv, 
				  realtype srur, realtype mindy, realtype* ewt_data,
				  N_Vector tmp, FMIComponent c, realtype hcur, realtype* ydot_data);

#if !defined(FMU_SOURCE_CODE_EXPORT) || defined(FMU_SOURCE_CODE_EXPORT_SPARSE)
/* computes sparse Jacobain data */
static int compute_JdataSparse(realtype t, N_Vector y, N_Vector fy, 
						 SUNMatrix J,  
						 realtype srur, realtype mindy, realtype* ewt_data,
						 N_Vector tmp, FMIComponent c, realtype hcur, realtype* ydot_data);
#endif

/* computation of parameters for numeric computation of J */
static int compute_Jconf(N_Vector y, N_Vector fy, realtype* srur, realtype* mindy,
				  FMIComponent c, realtype* hcur);

/* computation of y perturbation dy for numeric Jacobian */
static double compute_Jperturbation(const realtype srur, const realtype mindy, const realtype hcur,
									const realtype y, const realtype ydot, const realtype ewt);

/* ----------------- local variables ----------------- */

static size_t nGroups;
static FMIBoolean IDA;
static size_t cgOffset;
static size_t gcOffset;

/* ----------------- external variables ----------------- */

extern int QJacobianCG_[];
extern struct QJacobianTag_ QJacobianGC2_[];

/* ----------------- external function declarations ----------------- */

/* ----------------- function definitions ----------------- */

DYMOLA_STATIC void jac_setup(size_t ngroups, FMIBoolean ida, size_t cgoffset, size_t gcoffset){
	nGroups = ngroups;
	IDA = ida;
	cgOffset = cgoffset;
	gcOffset = gcoffset;
}

/* ------------------------------------------------------ */
/* computes function f(t,y) */
DYMOLA_STATIC int jac_f(double t, N_Vector y, N_Vector ydot, void *user_data)
{
	FMIComponent* c = (FMIComponent*) user_data;
	Component* comp = (Component*) c;
	int retval = 0;
	N_VectorContent_Serial ydot_cont = NV_CONTENT_S(ydot);

	/* temporarily change time, states and inputs */
	FMIReal time = comp->time;
	FMIReal* states = comp->states;

	integration_extrapolate_inputs(comp, t);

	comp->states = N_VGetArrayPointer(y);
	comp->time = t;
	comp->icall = iDemandStart;
	if (fmiGetDerivatives_(c, ydot_cont->data, ydot_cont->length) != FMIOK) {
		retval = 1;
	}
	/* restore time, states and inputs */
	integration_extrapolate_inputs(comp, time);
	comp->states = states;
	comp->time = time;
	return retval;
}

#ifdef INCLUDE_SUNDIALS_IDA
/* ------------------------------------------------------ */
/* computes residual f(t,y) - y' */
DYMOLA_STATIC int jac_res_IDA(realtype t, N_Vector y, N_Vector ydot, N_Vector res, void *user_data)
{
	FMIComponent* c = (FMIComponent*) user_data;
	Component* comp = (Component*) c;
	realtype* ydot_data = N_VGetArrayPointer(ydot);
	realtype* res_data = N_VGetArrayPointer(res);
	size_t nxOrig = (comp->DAEMode ? comp->nxOrig : comp->nStates);
	int retval = 0;
	size_t i;

	if (comp->DAEMode && comp->DAEDerivatives) {
		for (i = 0; i < comp->nStates; ++i)
			comp->DAEDerivatives[i] = (FMIReal) ydot_data[i]; /* Initialze DAEDerivatives for DAEmode */
	}

	for (i = 0; i < comp->nStates; ++i)
		res_data[i] = ydot_data[i]; /* Temporarily store ydot in res */

	/* Need to use ydot here as comp->derivatives is written to during the evaluation */
	retval = jac_f(t, y, ydot, user_data);

	for (i = 0; i < nxOrig; ++i) {
		const realtype f_val = ydot_data[i]; /* The f eval is computed in ydot */
		const realtype ydot_val = res_data[i]; /* The old ydot value was stored in res */
		ydot_data[i] = ydot_val; /* Restore the IDA ydot approximation */
		res_data[i] = f_val - ydot_val; /* Compute residual */
	}
	for (; i < comp->nStates; ++i) {
		const realtype f_val = ydot_data[i]; /* The f eval is computed in ydot */
		const realtype ydot_val = res_data[i]; /* The old ydot value was stored in res */
		ydot_data[i] = ydot_val; /* Restore the IDA ydot approximation */
		res_data[i] = f_val; /* Compute residual */
	}

	return retval;
}
#endif

/* ------------------------------------------------------ */
/* Jacobian routine, computes J(t,y) = df/dy numerically */
DYMOLA_STATIC int jac_Jacobian(realtype t,
							   N_Vector y, N_Vector fy, SUNMatrix J, void *user_data,
							   N_Vector tmp1, N_Vector tmp2, N_Vector tmp3)
{
	FMIComponent* c = (FMIComponent*) user_data;
	Component* comp = (Component*) c;
	int N = N_VGetLength(y);

	N_Vector ftmp = tmp1;

	realtype* ewt_data;
	realtype* iData_tmp3_data = NULL;
	realtype srur;
	realtype mindy;
	realtype hcur;

	int j;
	/* error here is recoverable */
	int retval = 1;

	realtype* tmp2_data = NULL;
	realtype* y_data = NULL;
	realtype* fy_data = NULL;
	realtype* ftmp_data = NULL;

	/* Only A-part is needed here */
	if ((QJacobianDefined_ & 1) == 1) {
		/* Analytic Jacobian is defined in model, try evaluating the analytic Jacobian */
		SetDymolaJacobianPointers(comp->did, (double*) SUNDenseMatrix_Data(J), 0, 0, 0, N, 0, 0, 0, 0, 0, 0);
		retval = jac_f(t, y, ftmp, user_data);
		SetDymolaJacobianPointers(comp->did, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		if (!retval)
			return retval; /* Analytic Jacobian succeeded */
		/* Analytic Jacobian failed, fall back to numeric Jacobian */
	}

	/* for later restoring */
	tmp2_data = N_VGetArrayPointer(tmp2);

	/* need raw pointers for some */
	y_data = N_VGetArrayPointer(y);
	fy_data = N_VGetArrayPointer(fy);
	ftmp_data = N_VGetArrayPointer(ftmp);

	if (compute_Jconf(y, fy, &srur, &mindy, c, &hcur)) {
		goto done;
	}
	ewt_data = N_VGetArrayPointer(comp->iData->ewt);
	if (IDA && comp->iData->tmp3)
		iData_tmp3_data = N_VGetArrayPointer(comp->iData->tmp3);

	comp->istruct->mInJacobian = 1;

	/* use grouping if possible */
	if (nGroups > 0) {
		/* use grouping */
		/* cannot use tmp2 here since it reuses the pointer provided in N_VMake_Serial,
		   hence interfering with comp->states */
		if (!compute_Jdata(t, y, fy, NULL, J, NULL, srur, mindy, ewt_data, tmp3, c, hcur, iData_tmp3_data)) {
			retval = 0;
			goto done;
		}
		/* failed with grouping - fall back */
	}

	{
		/* no or failed grouping, perturb one variable at the time */
		N_Vector jthCol = tmp2;
		
		for (j = 0; j < N; j++) {
			realtype yjsaved;
			realtype dy;
			realtype dy_inv;
			int k;

			/* generate the jth col of J(tn, y) */

			N_VSetArrayPointer(SUNDenseMatrix_Column(J, j), jthCol);

			yjsaved = y_data[j];
			/* perturb */
			dy = compute_Jperturbation(srur, mindy, hcur, yjsaved, iData_tmp3_data ? iData_tmp3_data[j] : 0.0, ewt_data[j]);

			/* retry a few times in case of failure */ 
			for (k = 0; k < 5; k++) {
				y_data[j] = yjsaved + dy;
				/* reduce rounding error at a low cost */
				dy = y_data[j] - yjsaved;

				/* compute new f */
				if (!jac_f(t, y, ftmp, user_data)) {
					break;
				}
				dy = -dy / 5; /* try smaller increment, and different sign */
				if (k>5) {
					/* failed */
					y_data[j] = yjsaved;
					goto done; 
				}
			}
			y_data[j] = yjsaved;
			dy_inv = RCONST(1.0) / dy;
			/* concisesness for the cost of duplicated multiplication */
			N_VLinearSum(dy_inv, ftmp, -dy_inv, fy, jthCol);
		}
	}

	retval = 0;

done:
	comp->istruct->mInJacobian = 0;
	/* restoring original array pointer appears to be necessary */
	N_VSetArrayPointer(tmp2_data, tmp2);
	return retval;
}

#if !defined(FMU_SOURCE_CODE_EXPORT) || defined(FMU_SOURCE_CODE_EXPORT_SPARSE)
/* sparse Jacobian routine, computes J(t,y) = df/dy numerically */
DYMOLA_STATIC int jac_JacobianSparse(realtype t,
							   N_Vector y, N_Vector fy, SUNMatrix J, void *user_data,
							   N_Vector tmp1, N_Vector tmp2, N_Vector tmp3)
{
	FMIComponent* c = (FMIComponent*) user_data;
	Component* comp = (Component*) c;

	N_Vector ftmp = tmp1;

	double* ewt_data;
	realtype* iData_tmp3_data = NULL;
	double srur;
	double mindy;
	realtype hcur;

	int retval = 1;

	double* tmp2_data = NULL;
	double* y_data = NULL;
	double* fy_data = NULL;
	double* ftmp_data = NULL;

	/* Only A-part is needed here */
	if (((QJacobianDefined_ & 1) == 1) && comp->iData->sparseAnalyticData && comp->iData->sparseAnalyticData->JacValues
			&& comp->iData->sparseAnalyticData->JacRows && comp->iData->sparseAnalyticData->JacCols
			&& comp->iData->sparseData.nnz > 0) {
		/* Analytic Jacobian is defined in model, try evaluating the analytic Jacobian */

		sunindextype* colptrs = (*comp->iData->sparseData.functions.sun_sparse_matrix_index_pointers)(J);
		sunindextype* rowvals = (*comp->iData->sparseData.functions.sun_sparse_matrix_index_values)(J);
		realtype* data = (*comp->iData->sparseData.functions.sun_sparse_matrix_data)(J);

		/* Evaluate Jacobian */
		SetDymolaJacobianPointers(comp->did, 0, 0, 0, 0, 0, 0, 0, comp->iData->sparseAnalyticData->JacValues, 
			comp->iData->sparseAnalyticData->JacRows, comp->iData->sparseAnalyticData->JacCols, comp->iData->sparseData.nnz);
		retval = jac_f(t, y, ftmp, user_data);
		SetDymolaJacobianPointers(comp->did, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

		if (!retval) {
			/* Convert between sparse formats */
			if (comp->iData->sparseAnalyticData->analyticJacobianStructureInitialized)
				(*comp->iData->sparseData.functions.ds_sparse_reset_analytic_jacobian_structure)(comp->iData->sparseAnalyticData->fixData, 
					(int*) rowvals, (int*) colptrs);
			else {
				(*comp->iData->sparseData.functions.ds_sparse_set_analytic_jacobian_structure)(comp->iData->sparseAnalyticData->fixData,
					comp->iData->sparseAnalyticData->JacRows, comp->iData->sparseAnalyticData->JacCols,
					(int*) rowvals, (int*) colptrs);
				comp->iData->sparseAnalyticData->analyticJacobianStructureInitialized = FMITrue;
			}
			(*comp->iData->sparseData.functions.ds_sparse_set_analytic_jacobian_values)(comp->iData->sparseAnalyticData->fixData, 
				comp->iData->sparseAnalyticData->JacValues, (double*) data);
			return retval; /* Analytic Jacobian succeeded */
		}
	}

	/* for later restoring */
	tmp2_data = N_VGetArrayPointer(tmp2);

	/* need raw pointers for some */
	y_data = N_VGetArrayPointer(y);
	fy_data = N_VGetArrayPointer(fy);
	ftmp_data = N_VGetArrayPointer(ftmp);

	if (compute_Jconf(y, fy, &srur, &mindy, c, &hcur)) {
		goto done;
	}
	retval = 1; /* Everything below is recoverable */
	ewt_data = N_VGetArrayPointer(comp->iData->ewt);
	if (IDA && comp->iData->tmp3)
		iData_tmp3_data = N_VGetArrayPointer(comp->iData->tmp3);

	comp->istruct->mInJacobian = 1;
	
	/* use grouping if possible */
	if (QJacobianCG_[cgOffset] > 0) {
		/* use grouping */
		/* cannot use tmp2 here since it reuses the pointer provided in N_VMake_Serial,
		   hence interfering with comp->states */
		if (!compute_JdataSparse(t, y, fy, J, srur, mindy, ewt_data, tmp3, c, hcur, iData_tmp3_data)) {
			goto okdone;
		}
	} else {
		goto done; // Failed - since no group
	}
okdone:
	retval = 0;

done:
	comp->istruct->mInJacobian = 0;
	/* restoring original array pointer appears to be necessary */
	N_VSetArrayPointer(tmp2_data, tmp2);

	return retval;
}
#endif

/* ----------------- local function definitions ----------------- */

static int compute_Jdata(realtype t, N_Vector y, N_Vector fy, N_Vector v,
						 SUNMatrix J, N_Vector Jv, 
						 realtype srur, realtype mindy, realtype* ewt_data,
						 N_Vector tmp, FMIComponent c, realtype hcur, realtype* ydot_data)
{
	Component* comp = (Component*) c;

	N_Vector ftmp = comp->iData->tmp1;

	realtype* y_data = N_VGetArrayPointer(y);
	realtype* fy_data = N_VGetArrayPointer(fy);
	realtype* v_data = NULL;
	realtype* Jv_data = NULL;
	realtype* ftmp_data = N_VGetArrayPointer(ftmp);

	realtype* ysaved_data = N_VGetArrayPointer(comp->iData->tmp2);
	realtype* dy_data = N_VGetArrayPointer(tmp);
	size_t group_nr;
	int group_ix = 1;
	int j;
	int N = (int)comp->nStates;

	/* compute exactly one of J or J * v */
	assert(J != NULL && Jv == NULL || J == NULL && Jv != NULL);

	/* initialize result */
	if (J != NULL) {
		for(j = 0; j < N; j++) {
			/* temporarily borrow tmp */
			N_VSetArrayPointer(SUNDenseMatrix_Column(J, j), tmp);
			N_VConst(0, tmp);
		}
	} else {
		v_data = N_VGetArrayPointer(v);
		Jv_data = N_VGetArrayPointer(Jv);
		N_VConst(0, Jv);
	}
	
	N_VSetArrayPointer(dy_data, tmp);

	/* iterate the groups */
	for (group_nr = 0; group_nr < nGroups; group_nr++) {
		const struct QJacobianTag_ pair = QJacobianGC2_[gcOffset+group_nr];
		const int * const b = pair.b;
		int nmembers = QJacobianCG_[cgOffset+group_ix];
		int member;
		int i;
		int gc_ix = (int)(N * group_nr);
		int jac_res;

		/* perturb each group member */
		for (member = 1; member <= nmembers; member++) {
			/* fetch column */
			int j = QJacobianCG_[cgOffset + group_ix + member] - 1;
			ysaved_data[j] = y_data[j];
			/* perturb the jth variable */
			dy_data[j] = compute_Jperturbation(srur, mindy, hcur, ysaved_data[j], ydot_data ? ydot_data[j] : 0.0, ewt_data[j]);
			y_data[j] += dy_data[j];
			/* reduce rounding error at a low cost */
			dy_data[j] = y_data[j] - ysaved_data[j];
		}

		/* compute new f */
		jac_res = jac_f(t, y, ftmp, c);
		
		/* restore y */
		for (member = 1; member <= nmembers; member++) {
			/* fetch column */
			j = QJacobianCG_[cgOffset + group_ix + member] - 1;
			y_data[j] = ysaved_data[j];
		}

		if (jac_res) {
			return 1;
		}

		/* store result */
		if (pair.a == 0) {
			for (i = 0; i < N; i++) {
				int j = b[i];
				if (j-- >= 1) {
					realtype val = (ftmp_data[i] - fy_data[i]) / dy_data[j];
					if (J != NULL) {
						SM_ELEMENT_D(J, i, j) = val;
					} else {
						val = SM_ELEMENT_D(comp->iData->J, i, j);
						Jv_data[i] += val * v_data[j];
					}
				}
			}
		} else if (pair.a == 1) {
			int i, j, ind = 1;
			for (i = 0; i < b[0]; ++i) {
				int col, num_rows;
				col = b[ind++] - 1;
				num_rows = b[ind++];
				for (j = 0; j < num_rows; ++j) {
					const int row = b[ind++] - 1;
					realtype val = (ftmp_data[row] - fy_data[row]) / dy_data[col];
					if (J != NULL) {
						SM_ELEMENT_D(J, row, col) = val;
					} else {
						val = SM_ELEMENT_D(comp->iData->J, row, col);
						Jv_data[row] += val * v_data[col];
					}
				}
			}
		} else return 1;
		group_ix += 1 + nmembers;
	}
	return 0;
}

/* ------------------------------------------------------ */
static int compute_Jconf(N_Vector y, N_Vector fy, realtype* srur, realtype* mindy,
						 FMIComponent c, realtype* hcur)
{
	/* the computation of minimal dy is borrowed from the default Jacobian
	cvDlsDenseDQJac in sundials */

	Component* comp = (Component*) c;

	realtype fnorm;
	realtype* y_data = N_VGetArrayPointer(y);
	int flag;

	*srur = SUNRsqrt(UNIT_ROUNDOFF);

#ifdef INCLUDE_SUNDIALS_IDA
	if (IDA) {
		flag = IDAGetErrWeights(comp->iData->cvode_mem, comp->iData->ewt);
		if (util_check_flag(&flag, "IDAGetErrWeights", 0, comp)) return 1;
		flag = IDAGetCurrentStep(comp->iData->cvode_mem, hcur);
		if (util_check_flag(&flag, "IDAGetCurrentStep", 0, comp)) return 1;
	} else 
#endif	
	{
		/* base on uround and norm of f */
		flag = CVodeGetErrWeights(comp->iData->cvode_mem, comp->iData->ewt);
		if (util_check_flag(&flag, "CVodeGetErrWeights", 0, comp)) return 1;
		flag = CVodeGetCurrentStep(comp->iData->cvode_mem, hcur);
		if (util_check_flag(&flag, "CVodeGetCurrentStep", 0, comp)) return 1;

		fnorm = N_VWrmsNorm(fy, comp->iData->ewt);
		*mindy = (fnorm != RCONST(0.0)) ?
			(RCONST(1000.0) * SUNRabs(*hcur) * UNIT_ROUNDOFF * comp->nStates * fnorm) : RCONST(1.0);
	}

	return 0;
}

static double compute_Jperturbation(const realtype srur, const realtype mindy, const realtype hcur,
									const realtype y, const realtype ydot, const realtype ewt)
{
	const realtype dy1 = srur * SUNRabs(y);
	realtype dy2;
	if (IDA) 
		dy2 = srur * SUNMAX(hcur * SUNRabs(ydot), 1.0 / ewt);  
	else
		dy2 = mindy / ewt;
	dy2 = SUNMAX(dy1, dy2);
	if (IDA)
		return (hcur*ydot >= 0.0 ? dy2 : -dy2);
	else
		return (y >= 0.0 ? dy2 : -dy2);
}

#if !defined(FMU_SOURCE_CODE_EXPORT) || defined(FMU_SOURCE_CODE_EXPORT_SPARSE)
/* computes sparse Jacobain data */
static int compute_JdataSparse(realtype t, N_Vector y, N_Vector fy, 
						 SUNMatrix J,  
						 realtype srur, realtype mindy, realtype* ewt_data,
						 N_Vector tmp, FMIComponent c, realtype hcur, realtype* ydot_data)
{
	Component* comp = (Component*) c;

	N_Vector ftmp = comp->iData->tmp1;

	realtype* y_data = N_VGetArrayPointer(y);
	realtype* fy_data = N_VGetArrayPointer(fy);
	realtype* ftmp_data = N_VGetArrayPointer(ftmp);

	realtype* ysaved_data = N_VGetArrayPointer(comp->iData->tmp2);
	realtype* dy_data = N_VGetArrayPointer(tmp);
	size_t group_nr;
	int group_ix = 1;
	int i, j;
	int N = (int)comp->nStates;
	size_t nGroups = QJacobianCG_[cgOffset];

	sunindextype* colptrs = (*comp->iData->sparseData.functions.sun_sparse_matrix_index_pointers)(J);
	sunindextype* rowvals = (*comp->iData->sparseData.functions.sun_sparse_matrix_index_values)(J);
	realtype* data = (*comp->iData->sparseData.functions.sun_sparse_matrix_data)(J);

	N_VSetArrayPointer(dy_data, tmp);

	/* iterate the groups */
	for (group_nr = 0; group_nr < nGroups; group_nr++) {
		const struct QJacobianTag_ pair = QJacobianGC2_[gcOffset + group_nr];
		const int * const b = pair.b;
		int nmembers = QJacobianCG_[cgOffset + group_ix];
		int member;
		int gc_ix = (int)(N * group_nr);
		int resOfJac=0;

		/* perturb each group member */
		for (member = 1; member <= nmembers; member++) {
			/* fetch column */
			int j = QJacobianCG_[cgOffset + group_ix + member] - 1;
			ysaved_data[j] = y_data[j];
			/* perturb the jth variable */
			dy_data[j] = compute_Jperturbation(srur, mindy, hcur, ysaved_data[j], ydot_data ? ydot_data[j] : 0.0, ewt_data[j]);
			y_data[j] += dy_data[j];
			/* reduce rounding error at a low cost */
			dy_data[j] = y_data[j] - ysaved_data[j];
		}

		/* compute new f */
		resOfJac = jac_f(t, y, ftmp, c);

		/* restore y */
		for (member = 1; member <= nmembers; member++) {
			/* fetch column */
			j = QJacobianCG_[cgOffset + group_ix + member] - 1;
			y_data[j] = ysaved_data[j];
		}
		if (resOfJac) return 1; /* After restoring y */

		/* store result */
		if (pair.a == 0) {
			for (i = 0; i < N; i++) {
				int j2 = b[i] - 1;
				if (j2>=0) {
					realtype val = (ftmp_data[i] - fy_data[i]) / dy_data[j2];
					int ix=comp->iData->sparseData.index[i+gc_ix];
					if (ix>=0) {
						data[ix]=val;
						rowvals[ix]=i;
					}
				}
			}
		} else if (pair.a == 1) {
			int i, j, ind = 1;
			for (i = 0; i < b[0]; ++i) {
				int column, num_rows;
				column = b[ind++] - 1;
				num_rows = b[ind++];
				for (j = 0; j < num_rows; ++j) {
					const int row = b[ind++] - 1;
					realtype val = (ftmp_data[row] - fy_data[row]) / dy_data[column];
					int ix=comp->iData->sparseData.index[row+gc_ix];
					if (ix>=0) {
						data[ix]=val;
						rowvals[ix]=row;
					}
				}
			}
		} else return 1;
		group_ix += 1 + nmembers;
	}
	for(i=0;i<N+1;++i) colptrs[i]=comp->iData->sparseData.colPtrs[i];
	return 0;
}
#endif

#ifdef INCLUDE_SUNDIALS_IDA
DYMOLA_STATIC int jac_Jacobian_IDA(
	realtype t, realtype c_j, N_Vector y, N_Vector ydot, N_Vector res, SUNMatrix J, void *user_data,
	N_Vector tmp1, N_Vector tmp2, N_Vector tmp3)
{
	FMIComponent* c = (FMIComponent*) user_data;
	Component* comp = (Component*) c;
	realtype* ydot_data = N_VGetArrayPointer(ydot);
	realtype* res_data = N_VGetArrayPointer(res);
	realtype* iData_tmp3_data = N_VGetArrayPointer(comp->iData->tmp3);
	size_t nxOrig = (comp->DAEMode ? comp->nxOrig : comp->nStates);
	int retval = 0;
	size_t i;

	if (comp->DAEMode && comp->DAEDerivatives) {
		for (i = 0; i < comp->nStates; ++i)
			comp->DAEDerivatives[i] = (FMIReal) ydot_data[i]; /* Initialze DAEDerivatives for DAEmode */
	}

	for (i = 0; i < nxOrig; ++i) {
		const realtype ydot_val = ydot_data[i];
		iData_tmp3_data[i] = ydot_val; /* Temporarily store ydot in tmp3 and use for dy computation */
		res_data[i] += ydot_val; /* Reconstruct fy in res */
	}
	for (; i < comp->nStates; ++i)
		iData_tmp3_data[i] = ydot_data[i]; /* Temporarily store ydot in tmp3 and use for dy computation */

	/* Compute ODE Jacobian */
#if !defined(FMU_SOURCE_CODE_EXPORT) || defined(FMU_SOURCE_CODE_EXPORT_SPARSE)
	if (comp->iData->sparseData.nnz)
		retval = jac_JacobianSparse(t, y, res, J, user_data, tmp1, tmp2, tmp3);
	else
#endif
		retval = jac_Jacobian(t, y, res, J, user_data, tmp1, tmp2, tmp3);

	for (i = 0; i < nxOrig; ++i) {
		const realtype ydot_val = iData_tmp3_data[i];
		ydot_data[i] = ydot_val; /* Restore the IDA ydot approximation */
		res_data[i] -= ydot_val; /* Reconstruct the IDA res value */
	}
	for (; i < comp->nStates; ++i)
		ydot_data[i] = iData_tmp3_data[i]; /* Restore the IDA ydot approximation */

	/* Construct DAE Jacobian by (partially) shifting the ODE Jacobian */
	if (!retval) {
#if !defined(FMU_SOURCE_CODE_EXPORT) || defined(FMU_SOURCE_CODE_EXPORT_SPARSE)
		if (comp->iData->sparseData.nnz) {
			if (comp->DAEMode)
				retval = (*comp->iData->sparseData.functions.ds_sunmat_add_partial_diagonal_sparse)(-c_j, (sunindextype) nxOrig, &comp->iData->partialI, comp->iData->sunctx, J);
			else 
				retval = (*comp->iData->sparseData.functions.ds_sunmat_add_diagonal_sparse)(-c_j, J);
		} else
#endif
		{
			if (comp->DAEMode)
				retval = DSSUNMatAddPartialDiagonal_Dense(-c_j, (sunindextype) nxOrig, &comp->iData->partialI, comp->iData->sunctx, J);
			else
				retval = DSSUNMatAddDiagonal_Dense(-c_j, J);
		}
	}
		
	return retval;
}
#endif
