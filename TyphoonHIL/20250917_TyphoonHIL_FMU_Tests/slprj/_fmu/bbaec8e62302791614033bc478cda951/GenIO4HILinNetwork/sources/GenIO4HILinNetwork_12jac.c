/* Jacobians 8 */
#include "GenIO4HILinNetwork_model.h"
#include "GenIO4HILinNetwork_12jac.h"
#include "simulation/jacobian_util.h"
#include "util/omc_file.h"
/* constant equations */
/* dynamic equations */

/*
equation index: 77
type: SIMPLE_ASSIGN
$cse1 = sin(G1.machine.delta)
*/
void GenIO4HILinNetwork_eqFunction_77(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,77};
  jacobian->tmpVars[1] /* $cse1 JACOBIAN_TMP_VAR */ = sin((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* G1.machine.delta STATE(1) */));
  TRACE_POP
}

/*
equation index: 78
type: SIMPLE_ASSIGN
$cse2 = cos(G1.machine.delta)
*/
void GenIO4HILinNetwork_eqFunction_78(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,78};
  jacobian->tmpVars[0] /* $cse2 JACOBIAN_TMP_VAR */ = cos((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* G1.machine.delta STATE(1) */));
  TRACE_POP
}

/*
equation index: 79
type: SIMPLE_ASSIGN
G1.machine.e1d.$pDERLSJac0.dummyVarLSJac0 = G1.machine.iq.SeedLSJac0 * (G1.machine.xq + (-G1.machine.x1q) - G1.machine.T2q0 * G1.machine.x2q * (G1.machine.xq - G1.machine.x1q) / (G1.machine.T1q0 * G1.machine.x1q))
*/
void GenIO4HILinNetwork_eqFunction_79(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,79};
  jacobian->tmpVars[2] /* G1.machine.e1d.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = (jacobian->seedVars[6] /* G1.machine.iq.SeedLSJac0 SEED_VAR */) * ((data->simulationInfo->realParameter[89] /* G1.machine.xq PARAM */) + (-(data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */)) - (((data->simulationInfo->realParameter[49] /* G1.machine.T2q0 PARAM */)) * (((data->simulationInfo->realParameter[87] /* G1.machine.x2q PARAM */)) * (DIVISION((data->simulationInfo->realParameter[89] /* G1.machine.xq PARAM */) - (data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */),((data->simulationInfo->realParameter[47] /* G1.machine.T1q0 PARAM */)) * ((data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */)),"G1.machine.T1q0 * G1.machine.x1q")))));
  TRACE_POP
}

/*
equation index: 80
type: SIMPLE_ASSIGN
G1.machine.e2d.$pDERLSJac0.dummyVarLSJac0 = (G1.machine.x1q + G1.machine.T2q0 * G1.machine.x2q * (G1.machine.xq - G1.machine.x1q) / (G1.machine.T1q0 * G1.machine.x1q) - G1.machine.x2q) * G1.machine.iq.SeedLSJac0 + G1.machine.e1d.$pDERLSJac0.dummyVarLSJac0
*/
void GenIO4HILinNetwork_eqFunction_80(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 3;
  const int equationIndexes[2] = {1,80};
  jacobian->tmpVars[3] /* G1.machine.e2d.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */) + ((data->simulationInfo->realParameter[49] /* G1.machine.T2q0 PARAM */)) * (((data->simulationInfo->realParameter[87] /* G1.machine.x2q PARAM */)) * (DIVISION((data->simulationInfo->realParameter[89] /* G1.machine.xq PARAM */) - (data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */),((data->simulationInfo->realParameter[47] /* G1.machine.T1q0 PARAM */)) * ((data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */)),"G1.machine.T1q0 * G1.machine.x1q"))) - (data->simulationInfo->realParameter[87] /* G1.machine.x2q PARAM */)) * (jacobian->seedVars[6] /* G1.machine.iq.SeedLSJac0 SEED_VAR */) + jacobian->tmpVars[2] /* G1.machine.e1d.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */;
  TRACE_POP
}

/*
equation index: 81
type: SIMPLE_ASSIGN
transformer.is.im.$pDERLSJac0.dummyVarLSJac0 = ($cse1 * G1.machine.iq.SeedLSJac0 - $cse2 * G1.machine.id.SeedLSJac0) * G1.machine.I_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_81(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 4;
  const int equationIndexes[2] = {1,81};
  jacobian->tmpVars[4] /* transformer.is.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = ((jacobian->tmpVars[1] /* $cse1 JACOBIAN_TMP_VAR */) * (jacobian->seedVars[6] /* G1.machine.iq.SeedLSJac0 SEED_VAR */) - ((jacobian->tmpVars[0] /* $cse2 JACOBIAN_TMP_VAR */) * (jacobian->seedVars[5] /* G1.machine.id.SeedLSJac0 SEED_VAR */))) * ((data->simulationInfo->realParameter[33] /* G1.machine.I_MBtoSB PARAM */));
  TRACE_POP
}

/*
equation index: 82
type: SIMPLE_ASSIGN
transformer.is.re.$pDERLSJac0.dummyVarLSJac0 = ($cse2 * G1.machine.iq.SeedLSJac0 + $cse1 * G1.machine.id.SeedLSJac0) * G1.machine.I_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_82(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 5;
  const int equationIndexes[2] = {1,82};
  jacobian->tmpVars[5] /* transformer.is.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = ((jacobian->tmpVars[0] /* $cse2 JACOBIAN_TMP_VAR */) * (jacobian->seedVars[6] /* G1.machine.iq.SeedLSJac0 SEED_VAR */) + (jacobian->tmpVars[1] /* $cse1 JACOBIAN_TMP_VAR */) * (jacobian->seedVars[5] /* G1.machine.id.SeedLSJac0 SEED_VAR */)) * ((data->simulationInfo->realParameter[33] /* G1.machine.I_MBtoSB PARAM */));
  TRACE_POP
}

/*
equation index: 83
type: SIMPLE_ASSIGN
G1.machine.vd.$pDERLSJac0.dummyVarLSJac0 = G1.machine.e2d.$pDERLSJac0.dummyVarLSJac0 - (G1.machine.ra * G1.machine.id.SeedLSJac0 - G1.machine.x2q * G1.machine.iq.SeedLSJac0)
*/
void GenIO4HILinNetwork_eqFunction_83(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 6;
  const int equationIndexes[2] = {1,83};
  jacobian->tmpVars[6] /* G1.machine.vd.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = jacobian->tmpVars[3] /* G1.machine.e2d.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ - (((data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */)) * (jacobian->seedVars[5] /* G1.machine.id.SeedLSJac0 SEED_VAR */) - (((data->simulationInfo->realParameter[87] /* G1.machine.x2q PARAM */)) * (jacobian->seedVars[6] /* G1.machine.iq.SeedLSJac0 SEED_VAR */)));
  TRACE_POP
}

/*
equation index: 84
type: SIMPLE_ASSIGN
G1.machine.vq.$pDERLSJac0.dummyVarLSJac0 = (-G1.machine.ra) * G1.machine.iq.SeedLSJac0 - G1.machine.x2d * G1.machine.id.SeedLSJac0
*/
void GenIO4HILinNetwork_eqFunction_84(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 7;
  const int equationIndexes[2] = {1,84};
  jacobian->tmpVars[7] /* G1.machine.vq.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = ((-(data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */))) * (jacobian->seedVars[6] /* G1.machine.iq.SeedLSJac0 SEED_VAR */) - (((data->simulationInfo->realParameter[86] /* G1.machine.x2d PARAM */)) * (jacobian->seedVars[5] /* G1.machine.id.SeedLSJac0 SEED_VAR */));
  TRACE_POP
}

/*
equation index: 85
type: SIMPLE_ASSIGN
transformer.vs.re.$pDERLSJac0.dummyVarLSJac0 = ($cse1 * G1.machine.vd.$pDERLSJac0.dummyVarLSJac0 + $cse2 * G1.machine.vq.$pDERLSJac0.dummyVarLSJac0) * G1.machine.V_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_85(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 8;
  const int equationIndexes[2] = {1,85};
  jacobian->tmpVars[8] /* transformer.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = ((jacobian->tmpVars[1] /* $cse1 JACOBIAN_TMP_VAR */) * (jacobian->tmpVars[6] /* G1.machine.vd.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) + (jacobian->tmpVars[0] /* $cse2 JACOBIAN_TMP_VAR */) * (jacobian->tmpVars[7] /* G1.machine.vq.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */)) * ((data->simulationInfo->realParameter[51] /* G1.machine.V_MBtoSB PARAM */));
  TRACE_POP
}

/*
equation index: 86
type: SIMPLE_ASSIGN
pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 = (transformer.vs.re.$pDERLSJac0.dummyVarLSJac0 / transformer.m ^ 2.0 - (transformer.r * transformer.is.re.$pDERLSJac0.dummyVarLSJac0 - transformer.x * transformer.is.im.$pDERLSJac0.dummyVarLSJac0)) * transformer.m
*/
void GenIO4HILinNetwork_eqFunction_86(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 9;
  const int equationIndexes[2] = {1,86};
  modelica_real tmp0;
  tmp0 = (data->simulationInfo->realParameter[134] /* transformer.m PARAM */);
  jacobian->tmpVars[9] /* pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = (DIVISION(jacobian->tmpVars[8] /* transformer.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */,(tmp0 * tmp0),"transformer.m ^ 2.0") - (((data->simulationInfo->realParameter[135] /* transformer.r PARAM */)) * (jacobian->tmpVars[5] /* transformer.is.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) - (((data->simulationInfo->realParameter[137] /* transformer.x PARAM */)) * (jacobian->tmpVars[4] /* transformer.is.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */)))) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */));
  TRACE_POP
}

/*
equation index: 87
type: SIMPLE_ASSIGN
transformer.vs.im.$pDERLSJac0.dummyVarLSJac0 = ($cse1 * G1.machine.vq.$pDERLSJac0.dummyVarLSJac0 - $cse2 * G1.machine.vd.$pDERLSJac0.dummyVarLSJac0) * G1.machine.V_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_87(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 10;
  const int equationIndexes[2] = {1,87};
  jacobian->tmpVars[10] /* transformer.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = ((jacobian->tmpVars[1] /* $cse1 JACOBIAN_TMP_VAR */) * (jacobian->tmpVars[7] /* G1.machine.vq.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) - ((jacobian->tmpVars[0] /* $cse2 JACOBIAN_TMP_VAR */) * (jacobian->tmpVars[6] /* G1.machine.vd.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */))) * ((data->simulationInfo->realParameter[51] /* G1.machine.V_MBtoSB PARAM */));
  TRACE_POP
}

/*
equation index: 88
type: SIMPLE_ASSIGN
pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 = (transformer.vs.im.$pDERLSJac0.dummyVarLSJac0 / transformer.m ^ 2.0 - (transformer.r * transformer.is.im.$pDERLSJac0.dummyVarLSJac0 + transformer.x * transformer.is.re.$pDERLSJac0.dummyVarLSJac0)) * transformer.m
*/
void GenIO4HILinNetwork_eqFunction_88(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 11;
  const int equationIndexes[2] = {1,88};
  modelica_real tmp1;
  tmp1 = (data->simulationInfo->realParameter[134] /* transformer.m PARAM */);
  jacobian->tmpVars[11] /* pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = (DIVISION(jacobian->tmpVars[10] /* transformer.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */,(tmp1 * tmp1),"transformer.m ^ 2.0") - (((data->simulationInfo->realParameter[135] /* transformer.r PARAM */)) * (jacobian->tmpVars[4] /* transformer.is.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[137] /* transformer.x PARAM */)) * (jacobian->tmpVars[5] /* transformer.is.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */))) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */));
  TRACE_POP
}

/*
equation index: 89
type: SIMPLE_ASSIGN
transformer.ir.re.$pDERLSJac0.dummyVarLSJac0 = (pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 - transformer.vs.im.$pDERLSJac0.dummyVarLSJac0 / transformer.m - transformer.r * transformer.ir.im.SeedLSJac0) / transformer.x
*/
void GenIO4HILinNetwork_eqFunction_89(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 12;
  const int equationIndexes[2] = {1,89};
  jacobian->tmpVars[12] /* transformer.ir.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = DIVISION(jacobian->tmpVars[11] /* pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ - (DIVISION(jacobian->tmpVars[10] /* transformer.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */,(data->simulationInfo->realParameter[134] /* transformer.m PARAM */),"transformer.m")) - (((data->simulationInfo->realParameter[135] /* transformer.r PARAM */)) * (jacobian->seedVars[4] /* transformer.ir.im.SeedLSJac0 SEED_VAR */)),(data->simulationInfo->realParameter[137] /* transformer.x PARAM */),"transformer.x");
  TRACE_POP
}

/*
equation index: 90
type: SIMPLE_ASSIGN
pwFault.p.ir.$pDERLSJac0.dummyVarLSJac0 = (-pwLine2.is.re.SeedLSJac0) - pwLine1.is.re.SeedLSJac0 - transformer.ir.re.$pDERLSJac0.dummyVarLSJac0
*/
void GenIO4HILinNetwork_eqFunction_90(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 13;
  const int equationIndexes[2] = {1,90};
  jacobian->tmpVars[13] /* pwFault.p.ir.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = (-jacobian->seedVars[3] /* pwLine2.is.re.SeedLSJac0 SEED_VAR */) - jacobian->seedVars[2] /* pwLine1.is.re.SeedLSJac0 SEED_VAR */ - jacobian->tmpVars[12] /* transformer.ir.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */;
  TRACE_POP
}

/*
equation index: 91
type: SIMPLE_ASSIGN
pwFault.p.ii.$pDERLSJac0.dummyVarLSJac0 = (-pwLine2.is.im.SeedLSJac0) - pwLine1.is.im.SeedLSJac0 - transformer.ir.im.SeedLSJac0
*/
void GenIO4HILinNetwork_eqFunction_91(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 14;
  const int equationIndexes[2] = {1,91};
  jacobian->tmpVars[14] /* pwFault.p.ii.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = (-jacobian->seedVars[1] /* pwLine2.is.im.SeedLSJac0 SEED_VAR */) - jacobian->seedVars[0] /* pwLine1.is.im.SeedLSJac0 SEED_VAR */ - jacobian->seedVars[4] /* transformer.ir.im.SeedLSJac0 SEED_VAR */;
  TRACE_POP
}

/*
equation index: 92
type: SIMPLE_ASSIGN
$res_LSJac0_1.$pDERLSJac0.dummyVarLSJac0 = if time < pwFault.t1 then pwFault.p.ir.$pDERLSJac0.dummyVarLSJac0 else if time < pwFault.t2 and pwFault.ground then pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 else if time < pwFault.t2 then pwFault.p.ir.$pDERLSJac0.dummyVarLSJac0 - (pwFault.R * pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 + pwFault.X * pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0) * (pwFault.R ^ 2.0 + pwFault.X ^ 2.0) / (pwFault.R ^ 2.0 + pwFault.X ^ 2.0) ^ 2.0 else pwFault.p.ir.$pDERLSJac0.dummyVarLSJac0
*/
void GenIO4HILinNetwork_eqFunction_92(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 15;
  const int equationIndexes[2] = {1,92};
  modelica_boolean tmp2;
  modelica_boolean tmp3;
  modelica_boolean tmp4;
  modelica_real tmp5;
  modelica_real tmp6;
  modelica_real tmp7;
  modelica_real tmp8;
  modelica_real tmp9;
  modelica_boolean tmp10;
  modelica_real tmp11;
  modelica_boolean tmp12;
  modelica_real tmp13;
  modelica_boolean tmp14;
  modelica_real tmp15;
  tmp2 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */));
  tmp14 = (modelica_boolean)tmp2;
  if(tmp14)
  {
    tmp15 = jacobian->tmpVars[13] /* pwFault.p.ir.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */;
  }
  else
  {
    tmp3 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
    tmp12 = (modelica_boolean)(tmp3 && (data->simulationInfo->booleanParameter[54] /* pwFault.ground PARAM */));
    if(tmp12)
    {
      tmp13 = jacobian->tmpVars[11] /* pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */;
    }
    else
    {
      tmp4 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
      tmp10 = (modelica_boolean)tmp4;
      if(tmp10)
      {
        tmp5 = (data->simulationInfo->realParameter[102] /* pwFault.R PARAM */);
        tmp6 = (data->simulationInfo->realParameter[103] /* pwFault.X PARAM */);
        tmp7 = (data->simulationInfo->realParameter[102] /* pwFault.R PARAM */);
        tmp8 = (data->simulationInfo->realParameter[103] /* pwFault.X PARAM */);
        tmp9 = (tmp7 * tmp7) + (tmp8 * tmp8);
        tmp11 = jacobian->tmpVars[13] /* pwFault.p.ir.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ - (DIVISION((((data->simulationInfo->realParameter[102] /* pwFault.R PARAM */)) * (jacobian->tmpVars[9] /* pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[103] /* pwFault.X PARAM */)) * (jacobian->tmpVars[11] /* pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */)) * ((tmp5 * tmp5) + (tmp6 * tmp6)),(tmp9 * tmp9),"(pwFault.R ^ 2.0 + pwFault.X ^ 2.0) ^ 2.0"));
      }
      else
      {
        tmp11 = jacobian->tmpVars[13] /* pwFault.p.ir.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */;
      }
      tmp13 = tmp11;
    }
    tmp15 = tmp13;
  }
  jacobian->resultVars[0] /* $res_LSJac0_1.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_VAR */ = tmp15;
  TRACE_POP
}

/*
equation index: 93
type: SIMPLE_ASSIGN
$res_LSJac0_2.$pDERLSJac0.dummyVarLSJac0 = if time >= pwLine2.t1 and time < pwLine2.t2 then pwLine2.is.re.SeedLSJac0 else pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 - (pwLine2.Z.re * (pwLine2.is.re.SeedLSJac0 + pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 * pwLine2.Y.im - pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 * pwLine2.Y.re) - pwLine2.Z.im * (pwLine2.is.im.SeedLSJac0 + (-pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0) * pwLine2.Y.im - pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 * pwLine2.Y.re))
*/
void GenIO4HILinNetwork_eqFunction_93(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 16;
  const int equationIndexes[2] = {1,93};
  modelica_boolean tmp16;
  modelica_boolean tmp17;
  tmp16 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  tmp17 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  jacobian->resultVars[1] /* $res_LSJac0_2.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_VAR */ = ((tmp16 && tmp17)?jacobian->seedVars[3] /* pwLine2.is.re.SeedLSJac0 SEED_VAR */:jacobian->tmpVars[9] /* pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ - (((data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */)) * (jacobian->seedVars[3] /* pwLine2.is.re.SeedLSJac0 SEED_VAR */ + (jacobian->tmpVars[11] /* pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - ((jacobian->tmpVars[9] /* pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))) - (((data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */)) * (jacobian->seedVars[1] /* pwLine2.is.im.SeedLSJac0 SEED_VAR */ + ((-jacobian->tmpVars[9] /* pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */)) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - ((jacobian->tmpVars[11] /* pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))))));
  TRACE_POP
}

/*
equation index: 94
type: SIMPLE_ASSIGN
$res_LSJac0_3.$pDERLSJac0.dummyVarLSJac0 = if time >= pwLine2.t1 and time < pwLine2.t2 then pwLine2.is.im.SeedLSJac0 else pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 - (pwLine2.Z.re * (pwLine2.is.im.SeedLSJac0 + (-pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0) * pwLine2.Y.im - pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 * pwLine2.Y.re) + pwLine2.Z.im * (pwLine2.is.re.SeedLSJac0 + pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 * pwLine2.Y.im - pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 * pwLine2.Y.re))
*/
void GenIO4HILinNetwork_eqFunction_94(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 17;
  const int equationIndexes[2] = {1,94};
  modelica_boolean tmp18;
  modelica_boolean tmp19;
  tmp18 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  tmp19 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  jacobian->resultVars[2] /* $res_LSJac0_3.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_VAR */ = ((tmp18 && tmp19)?jacobian->seedVars[1] /* pwLine2.is.im.SeedLSJac0 SEED_VAR */:jacobian->tmpVars[11] /* pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ - (((data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */)) * (jacobian->seedVars[1] /* pwLine2.is.im.SeedLSJac0 SEED_VAR */ + ((-jacobian->tmpVars[9] /* pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */)) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - ((jacobian->tmpVars[11] /* pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))) + ((data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */)) * (jacobian->seedVars[3] /* pwLine2.is.re.SeedLSJac0 SEED_VAR */ + (jacobian->tmpVars[11] /* pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - ((jacobian->tmpVars[9] /* pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */))))));
  TRACE_POP
}

/*
equation index: 95
type: SIMPLE_ASSIGN
$res_LSJac0_4.$pDERLSJac0.dummyVarLSJac0 = if time >= pwLine1.t1 and time < pwLine1.t2 then pwLine1.is.re.SeedLSJac0 else pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 - (pwLine1.Z.re * (pwLine1.is.re.SeedLSJac0 + pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 * pwLine1.Y.im - pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 * pwLine1.Y.re) - pwLine1.Z.im * (pwLine1.is.im.SeedLSJac0 + (-pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0) * pwLine1.Y.im - pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 * pwLine1.Y.re))
*/
void GenIO4HILinNetwork_eqFunction_95(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 18;
  const int equationIndexes[2] = {1,95};
  modelica_boolean tmp20;
  modelica_boolean tmp21;
  tmp20 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  tmp21 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  jacobian->resultVars[3] /* $res_LSJac0_4.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_VAR */ = ((tmp20 && tmp21)?jacobian->seedVars[2] /* pwLine1.is.re.SeedLSJac0 SEED_VAR */:jacobian->tmpVars[9] /* pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ - (((data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */)) * (jacobian->seedVars[2] /* pwLine1.is.re.SeedLSJac0 SEED_VAR */ + (jacobian->tmpVars[11] /* pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - ((jacobian->tmpVars[9] /* pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))) - (((data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */)) * (jacobian->seedVars[0] /* pwLine1.is.im.SeedLSJac0 SEED_VAR */ + ((-jacobian->tmpVars[9] /* pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */)) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - ((jacobian->tmpVars[11] /* pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))))));
  TRACE_POP
}

/*
equation index: 96
type: SIMPLE_ASSIGN
$res_LSJac0_5.$pDERLSJac0.dummyVarLSJac0 = pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 * transformer.m + transformer.x * transformer.ir.im.SeedLSJac0 * transformer.m + (-transformer.r) * transformer.ir.re.$pDERLSJac0.dummyVarLSJac0 * transformer.m - transformer.vs.re.$pDERLSJac0.dummyVarLSJac0
*/
void GenIO4HILinNetwork_eqFunction_96(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 19;
  const int equationIndexes[2] = {1,96};
  jacobian->resultVars[4] /* $res_LSJac0_5.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_VAR */ = (jacobian->tmpVars[9] /* pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */)) + ((data->simulationInfo->realParameter[137] /* transformer.x PARAM */)) * ((jacobian->seedVars[4] /* transformer.ir.im.SeedLSJac0 SEED_VAR */) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */))) + ((-(data->simulationInfo->realParameter[135] /* transformer.r PARAM */))) * ((jacobian->tmpVars[12] /* transformer.ir.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */))) - jacobian->tmpVars[8] /* transformer.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */;
  TRACE_POP
}

/*
equation index: 97
type: SIMPLE_ASSIGN
$res_LSJac0_6.$pDERLSJac0.dummyVarLSJac0 = if time >= pwLine1.t1 and time < pwLine1.t2 then pwLine1.is.im.SeedLSJac0 else pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 - (pwLine1.Z.re * (pwLine1.is.im.SeedLSJac0 + (-pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0) * pwLine1.Y.im - pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 * pwLine1.Y.re) + pwLine1.Z.im * (pwLine1.is.re.SeedLSJac0 + pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 * pwLine1.Y.im - pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 * pwLine1.Y.re))
*/
void GenIO4HILinNetwork_eqFunction_97(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 20;
  const int equationIndexes[2] = {1,97};
  modelica_boolean tmp22;
  modelica_boolean tmp23;
  tmp22 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  tmp23 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  jacobian->resultVars[5] /* $res_LSJac0_6.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_VAR */ = ((tmp22 && tmp23)?jacobian->seedVars[0] /* pwLine1.is.im.SeedLSJac0 SEED_VAR */:jacobian->tmpVars[11] /* pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ - (((data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */)) * (jacobian->seedVars[0] /* pwLine1.is.im.SeedLSJac0 SEED_VAR */ + ((-jacobian->tmpVars[9] /* pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */)) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - ((jacobian->tmpVars[11] /* pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))) + ((data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */)) * (jacobian->seedVars[2] /* pwLine1.is.re.SeedLSJac0 SEED_VAR */ + (jacobian->tmpVars[11] /* pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - ((jacobian->tmpVars[9] /* pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */))))));
  TRACE_POP
}

/*
equation index: 98
type: SIMPLE_ASSIGN
$res_LSJac0_7.$pDERLSJac0.dummyVarLSJac0 = if time < pwFault.t1 then pwFault.p.ii.$pDERLSJac0.dummyVarLSJac0 else if time < pwFault.t2 and pwFault.ground then pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 else if time < pwFault.t2 then pwFault.p.ii.$pDERLSJac0.dummyVarLSJac0 - (pwFault.R * pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 - pwFault.X * pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0) * (pwFault.X ^ 2.0 + pwFault.R ^ 2.0) / (pwFault.X ^ 2.0 + pwFault.R ^ 2.0) ^ 2.0 else pwFault.p.ii.$pDERLSJac0.dummyVarLSJac0
*/
void GenIO4HILinNetwork_eqFunction_98(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 21;
  const int equationIndexes[2] = {1,98};
  modelica_boolean tmp24;
  modelica_boolean tmp25;
  modelica_boolean tmp26;
  modelica_real tmp27;
  modelica_real tmp28;
  modelica_real tmp29;
  modelica_real tmp30;
  modelica_real tmp31;
  modelica_boolean tmp32;
  modelica_real tmp33;
  modelica_boolean tmp34;
  modelica_real tmp35;
  modelica_boolean tmp36;
  modelica_real tmp37;
  tmp24 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */));
  tmp36 = (modelica_boolean)tmp24;
  if(tmp36)
  {
    tmp37 = jacobian->tmpVars[14] /* pwFault.p.ii.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */;
  }
  else
  {
    tmp25 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
    tmp34 = (modelica_boolean)(tmp25 && (data->simulationInfo->booleanParameter[54] /* pwFault.ground PARAM */));
    if(tmp34)
    {
      tmp35 = jacobian->tmpVars[9] /* pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */;
    }
    else
    {
      tmp26 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
      tmp32 = (modelica_boolean)tmp26;
      if(tmp32)
      {
        tmp27 = (data->simulationInfo->realParameter[103] /* pwFault.X PARAM */);
        tmp28 = (data->simulationInfo->realParameter[102] /* pwFault.R PARAM */);
        tmp29 = (data->simulationInfo->realParameter[103] /* pwFault.X PARAM */);
        tmp30 = (data->simulationInfo->realParameter[102] /* pwFault.R PARAM */);
        tmp31 = (tmp29 * tmp29) + (tmp30 * tmp30);
        tmp33 = jacobian->tmpVars[14] /* pwFault.p.ii.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ - (DIVISION((((data->simulationInfo->realParameter[102] /* pwFault.R PARAM */)) * (jacobian->tmpVars[11] /* pwLine2.vs.im.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) - (((data->simulationInfo->realParameter[103] /* pwFault.X PARAM */)) * (jacobian->tmpVars[9] /* pwLine2.vs.re.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */))) * ((tmp27 * tmp27) + (tmp28 * tmp28)),(tmp31 * tmp31),"(pwFault.X ^ 2.0 + pwFault.R ^ 2.0) ^ 2.0"));
      }
      else
      {
        tmp33 = jacobian->tmpVars[14] /* pwFault.p.ii.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */;
      }
      tmp35 = tmp33;
    }
    tmp37 = tmp35;
  }
  jacobian->resultVars[6] /* $res_LSJac0_7.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_VAR */ = tmp37;
  TRACE_POP
}

OMC_DISABLE_OPT
int GenIO4HILinNetwork_functionJacLSJac0_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = GenIO4HILinNetwork_INDEX_JAC_LSJac0;
  
  TRACE_POP
  return 0;
}

int GenIO4HILinNetwork_functionJacLSJac0_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = GenIO4HILinNetwork_INDEX_JAC_LSJac0;
  GenIO4HILinNetwork_eqFunction_77(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_78(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_79(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_80(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_81(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_82(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_83(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_84(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_85(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_86(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_87(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_88(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_89(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_90(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_91(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_92(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_93(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_94(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_95(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_96(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_97(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_98(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 168
type: SIMPLE_ASSIGN
transformer.is.re.$pDERLSJac1.dummyVarLSJac1 = ($cse4 * G1.machine.iq.SeedLSJac1 + $cse3 * G1.machine.id.SeedLSJac1) * G1.machine.I_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_168(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,168};
  jacobian->tmpVars[0] /* transformer.is.re.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[13]] /* $cse4 variable */)) * (jacobian->seedVars[5] /* G1.machine.iq.SeedLSJac1 SEED_VAR */) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[12]] /* $cse3 variable */)) * (jacobian->seedVars[6] /* G1.machine.id.SeedLSJac1 SEED_VAR */)) * ((data->simulationInfo->realParameter[33] /* G1.machine.I_MBtoSB PARAM */));
  TRACE_POP
}

/*
equation index: 169
type: SIMPLE_ASSIGN
transformer.is.im.$pDERLSJac1.dummyVarLSJac1 = ($cse3 * G1.machine.iq.SeedLSJac1 - $cse4 * G1.machine.id.SeedLSJac1) * G1.machine.I_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_169(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,169};
  jacobian->tmpVars[1] /* transformer.is.im.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[12]] /* $cse3 variable */)) * (jacobian->seedVars[5] /* G1.machine.iq.SeedLSJac1 SEED_VAR */) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[13]] /* $cse4 variable */)) * (jacobian->seedVars[6] /* G1.machine.id.SeedLSJac1 SEED_VAR */))) * ((data->simulationInfo->realParameter[33] /* G1.machine.I_MBtoSB PARAM */));
  TRACE_POP
}

/*
equation index: 170
type: SIMPLE_ASSIGN
transformer.vs.re.$pDERLSJac1.dummyVarLSJac1 = (transformer.r * transformer.is.re.$pDERLSJac1.dummyVarLSJac1 - transformer.x * transformer.is.im.$pDERLSJac1.dummyVarLSJac1 + pwLine2.vs.re.SeedLSJac1 / transformer.m) * transformer.m ^ 2.0
*/
void GenIO4HILinNetwork_eqFunction_170(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,170};
  modelica_real tmp38;
  tmp38 = (data->simulationInfo->realParameter[134] /* transformer.m PARAM */);
  jacobian->tmpVars[2] /* transformer.vs.re.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ = (((data->simulationInfo->realParameter[135] /* transformer.r PARAM */)) * (jacobian->tmpVars[0] /* transformer.is.re.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */) - (((data->simulationInfo->realParameter[137] /* transformer.x PARAM */)) * (jacobian->tmpVars[1] /* transformer.is.im.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */)) + DIVISION(jacobian->seedVars[8] /* pwLine2.vs.re.SeedLSJac1 SEED_VAR */,(data->simulationInfo->realParameter[134] /* transformer.m PARAM */),"transformer.m")) * ((tmp38 * tmp38));
  TRACE_POP
}

/*
equation index: 171
type: SIMPLE_ASSIGN
transformer.vs.im.$pDERLSJac1.dummyVarLSJac1 = (transformer.r * transformer.is.im.$pDERLSJac1.dummyVarLSJac1 + transformer.x * transformer.is.re.$pDERLSJac1.dummyVarLSJac1 + pwLine2.vs.im.SeedLSJac1 / transformer.m) * transformer.m ^ 2.0
*/
void GenIO4HILinNetwork_eqFunction_171(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 3;
  const int equationIndexes[2] = {1,171};
  modelica_real tmp39;
  tmp39 = (data->simulationInfo->realParameter[134] /* transformer.m PARAM */);
  jacobian->tmpVars[3] /* transformer.vs.im.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ = (((data->simulationInfo->realParameter[135] /* transformer.r PARAM */)) * (jacobian->tmpVars[1] /* transformer.is.im.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[137] /* transformer.x PARAM */)) * (jacobian->tmpVars[0] /* transformer.is.re.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */) + DIVISION(jacobian->seedVars[7] /* pwLine2.vs.im.SeedLSJac1 SEED_VAR */,(data->simulationInfo->realParameter[134] /* transformer.m PARAM */),"transformer.m")) * ((tmp39 * tmp39));
  TRACE_POP
}

/*
equation index: 172
type: SIMPLE_ASSIGN
G1.machine.vd.$pDERLSJac1.dummyVarLSJac1 = G1.machine.x2q * G1.machine.iq.SeedLSJac1 - G1.machine.ra * G1.machine.id.SeedLSJac1
*/
void GenIO4HILinNetwork_eqFunction_172(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 4;
  const int equationIndexes[2] = {1,172};
  jacobian->tmpVars[4] /* G1.machine.vd.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[87] /* G1.machine.x2q PARAM */)) * (jacobian->seedVars[5] /* G1.machine.iq.SeedLSJac1 SEED_VAR */) - (((data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */)) * (jacobian->seedVars[6] /* G1.machine.id.SeedLSJac1 SEED_VAR */));
  TRACE_POP
}

/*
equation index: 173
type: SIMPLE_ASSIGN
G1.machine.vq.$pDERLSJac1.dummyVarLSJac1 = (-G1.machine.ra) * G1.machine.iq.SeedLSJac1 - G1.machine.x2d * G1.machine.id.SeedLSJac1
*/
void GenIO4HILinNetwork_eqFunction_173(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 5;
  const int equationIndexes[2] = {1,173};
  jacobian->tmpVars[5] /* G1.machine.vq.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ = ((-(data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */))) * (jacobian->seedVars[5] /* G1.machine.iq.SeedLSJac1 SEED_VAR */) - (((data->simulationInfo->realParameter[86] /* G1.machine.x2d PARAM */)) * (jacobian->seedVars[6] /* G1.machine.id.SeedLSJac1 SEED_VAR */));
  TRACE_POP
}

/*
equation index: 174
type: SIMPLE_ASSIGN
transformer.ir.im.$pDERLSJac1.dummyVarLSJac1 = (transformer.r * transformer.ir.re.SeedLSJac1 - (pwLine2.vs.re.SeedLSJac1 - transformer.vs.re.$pDERLSJac1.dummyVarLSJac1 / transformer.m)) / transformer.x
*/
void GenIO4HILinNetwork_eqFunction_174(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 6;
  const int equationIndexes[2] = {1,174};
  jacobian->tmpVars[6] /* transformer.ir.im.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ = DIVISION(((data->simulationInfo->realParameter[135] /* transformer.r PARAM */)) * (jacobian->seedVars[4] /* transformer.ir.re.SeedLSJac1 SEED_VAR */) - (jacobian->seedVars[8] /* pwLine2.vs.re.SeedLSJac1 SEED_VAR */ - (DIVISION(jacobian->tmpVars[2] /* transformer.vs.re.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */,(data->simulationInfo->realParameter[134] /* transformer.m PARAM */),"transformer.m"))),(data->simulationInfo->realParameter[137] /* transformer.x PARAM */),"transformer.x");
  TRACE_POP
}

/*
equation index: 175
type: SIMPLE_ASSIGN
pwFault.p.ii.$pDERLSJac1.dummyVarLSJac1 = (-pwLine2.is.im.SeedLSJac1) - pwLine1.is.im.SeedLSJac1 - transformer.ir.im.$pDERLSJac1.dummyVarLSJac1
*/
void GenIO4HILinNetwork_eqFunction_175(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 7;
  const int equationIndexes[2] = {1,175};
  jacobian->tmpVars[7] /* pwFault.p.ii.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ = (-jacobian->seedVars[3] /* pwLine2.is.im.SeedLSJac1 SEED_VAR */) - jacobian->seedVars[2] /* pwLine1.is.im.SeedLSJac1 SEED_VAR */ - jacobian->tmpVars[6] /* transformer.ir.im.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */;
  TRACE_POP
}

/*
equation index: 176
type: SIMPLE_ASSIGN
pwFault.p.ir.$pDERLSJac1.dummyVarLSJac1 = (-pwLine2.is.re.SeedLSJac1) - pwLine1.is.re.SeedLSJac1 - transformer.ir.re.SeedLSJac1
*/
void GenIO4HILinNetwork_eqFunction_176(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 8;
  const int equationIndexes[2] = {1,176};
  jacobian->tmpVars[8] /* pwFault.p.ir.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ = (-jacobian->seedVars[1] /* pwLine2.is.re.SeedLSJac1 SEED_VAR */) - jacobian->seedVars[0] /* pwLine1.is.re.SeedLSJac1 SEED_VAR */ - jacobian->seedVars[4] /* transformer.ir.re.SeedLSJac1 SEED_VAR */;
  TRACE_POP
}

/*
equation index: 177
type: SIMPLE_ASSIGN
$res_LSJac1_1.$pDERLSJac1.dummyVarLSJac1 = if time < pwFault.t1 then pwFault.p.ir.$pDERLSJac1.dummyVarLSJac1 else if time < pwFault.t2 and pwFault.ground then pwLine2.vs.im.SeedLSJac1 else if time < pwFault.t2 then pwFault.p.ir.$pDERLSJac1.dummyVarLSJac1 - (pwFault.R * pwLine2.vs.re.SeedLSJac1 + pwFault.X * pwLine2.vs.im.SeedLSJac1) * (pwFault.R ^ 2.0 + pwFault.X ^ 2.0) / (pwFault.R ^ 2.0 + pwFault.X ^ 2.0) ^ 2.0 else pwFault.p.ir.$pDERLSJac1.dummyVarLSJac1
*/
void GenIO4HILinNetwork_eqFunction_177(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 9;
  const int equationIndexes[2] = {1,177};
  modelica_boolean tmp40;
  modelica_real tmp41;
  modelica_real tmp42;
  modelica_boolean tmp43;
  modelica_real tmp44;
  modelica_real tmp45;
  modelica_boolean tmp46;
  modelica_real tmp47;
  modelica_real tmp48;
  modelica_real tmp49;
  modelica_real tmp50;
  modelica_real tmp51;
  modelica_real tmp52;
  modelica_real tmp53;
  modelica_boolean tmp54;
  modelica_real tmp55;
  modelica_boolean tmp56;
  modelica_real tmp57;
  modelica_boolean tmp58;
  modelica_real tmp59;
  tmp41 = 1.0;
  tmp42 = fabs((data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */));
  relationhysteresis(data, &tmp40, data->localData[0]->timeValue, (data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */), tmp41, tmp42, 0, Less, LessZC);
  tmp58 = (modelica_boolean)tmp40;
  if(tmp58)
  {
    tmp59 = jacobian->tmpVars[8] /* pwFault.p.ir.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */;
  }
  else
  {
    tmp44 = 1.0;
    tmp45 = fabs((data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
    relationhysteresis(data, &tmp43, data->localData[0]->timeValue, (data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */), tmp44, tmp45, 1, Less, LessZC);
    tmp56 = (modelica_boolean)(tmp43 && (data->simulationInfo->booleanParameter[54] /* pwFault.ground PARAM */));
    if(tmp56)
    {
      tmp57 = jacobian->seedVars[7] /* pwLine2.vs.im.SeedLSJac1 SEED_VAR */;
    }
    else
    {
      tmp47 = 1.0;
      tmp48 = fabs((data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
      relationhysteresis(data, &tmp46, data->localData[0]->timeValue, (data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */), tmp47, tmp48, 1, Less, LessZC);
      tmp54 = (modelica_boolean)tmp46;
      if(tmp54)
      {
        tmp49 = (data->simulationInfo->realParameter[102] /* pwFault.R PARAM */);
        tmp50 = (data->simulationInfo->realParameter[103] /* pwFault.X PARAM */);
        tmp51 = (data->simulationInfo->realParameter[102] /* pwFault.R PARAM */);
        tmp52 = (data->simulationInfo->realParameter[103] /* pwFault.X PARAM */);
        tmp53 = (tmp51 * tmp51) + (tmp52 * tmp52);
        tmp55 = jacobian->tmpVars[8] /* pwFault.p.ir.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ - (DIVISION((((data->simulationInfo->realParameter[102] /* pwFault.R PARAM */)) * (jacobian->seedVars[8] /* pwLine2.vs.re.SeedLSJac1 SEED_VAR */) + ((data->simulationInfo->realParameter[103] /* pwFault.X PARAM */)) * (jacobian->seedVars[7] /* pwLine2.vs.im.SeedLSJac1 SEED_VAR */)) * ((tmp49 * tmp49) + (tmp50 * tmp50)),(tmp53 * tmp53),"(pwFault.R ^ 2.0 + pwFault.X ^ 2.0) ^ 2.0"));
      }
      else
      {
        tmp55 = jacobian->tmpVars[8] /* pwFault.p.ir.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */;
      }
      tmp57 = tmp55;
    }
    tmp59 = tmp57;
  }
  jacobian->resultVars[0] /* $res_LSJac1_1.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_VAR */ = tmp59;
  TRACE_POP
}

/*
equation index: 178
type: SIMPLE_ASSIGN
$res_LSJac1_2.$pDERLSJac1.dummyVarLSJac1 = if time < pwFault.t1 then pwFault.p.ii.$pDERLSJac1.dummyVarLSJac1 else if time < pwFault.t2 and pwFault.ground then pwLine2.vs.re.SeedLSJac1 else if time < pwFault.t2 then pwFault.p.ii.$pDERLSJac1.dummyVarLSJac1 - (pwFault.R * pwLine2.vs.im.SeedLSJac1 - pwFault.X * pwLine2.vs.re.SeedLSJac1) * (pwFault.X ^ 2.0 + pwFault.R ^ 2.0) / (pwFault.X ^ 2.0 + pwFault.R ^ 2.0) ^ 2.0 else pwFault.p.ii.$pDERLSJac1.dummyVarLSJac1
*/
void GenIO4HILinNetwork_eqFunction_178(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 10;
  const int equationIndexes[2] = {1,178};
  modelica_boolean tmp60;
  modelica_real tmp61;
  modelica_real tmp62;
  modelica_boolean tmp63;
  modelica_real tmp64;
  modelica_real tmp65;
  modelica_boolean tmp66;
  modelica_real tmp67;
  modelica_real tmp68;
  modelica_real tmp69;
  modelica_real tmp70;
  modelica_real tmp71;
  modelica_real tmp72;
  modelica_real tmp73;
  modelica_boolean tmp74;
  modelica_real tmp75;
  modelica_boolean tmp76;
  modelica_real tmp77;
  modelica_boolean tmp78;
  modelica_real tmp79;
  tmp61 = 1.0;
  tmp62 = fabs((data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */));
  relationhysteresis(data, &tmp60, data->localData[0]->timeValue, (data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */), tmp61, tmp62, 0, Less, LessZC);
  tmp78 = (modelica_boolean)tmp60;
  if(tmp78)
  {
    tmp79 = jacobian->tmpVars[7] /* pwFault.p.ii.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */;
  }
  else
  {
    tmp64 = 1.0;
    tmp65 = fabs((data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
    relationhysteresis(data, &tmp63, data->localData[0]->timeValue, (data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */), tmp64, tmp65, 1, Less, LessZC);
    tmp76 = (modelica_boolean)(tmp63 && (data->simulationInfo->booleanParameter[54] /* pwFault.ground PARAM */));
    if(tmp76)
    {
      tmp77 = jacobian->seedVars[8] /* pwLine2.vs.re.SeedLSJac1 SEED_VAR */;
    }
    else
    {
      tmp67 = 1.0;
      tmp68 = fabs((data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
      relationhysteresis(data, &tmp66, data->localData[0]->timeValue, (data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */), tmp67, tmp68, 1, Less, LessZC);
      tmp74 = (modelica_boolean)tmp66;
      if(tmp74)
      {
        tmp69 = (data->simulationInfo->realParameter[103] /* pwFault.X PARAM */);
        tmp70 = (data->simulationInfo->realParameter[102] /* pwFault.R PARAM */);
        tmp71 = (data->simulationInfo->realParameter[103] /* pwFault.X PARAM */);
        tmp72 = (data->simulationInfo->realParameter[102] /* pwFault.R PARAM */);
        tmp73 = (tmp71 * tmp71) + (tmp72 * tmp72);
        tmp75 = jacobian->tmpVars[7] /* pwFault.p.ii.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ - (DIVISION((((data->simulationInfo->realParameter[102] /* pwFault.R PARAM */)) * (jacobian->seedVars[7] /* pwLine2.vs.im.SeedLSJac1 SEED_VAR */) - (((data->simulationInfo->realParameter[103] /* pwFault.X PARAM */)) * (jacobian->seedVars[8] /* pwLine2.vs.re.SeedLSJac1 SEED_VAR */))) * ((tmp69 * tmp69) + (tmp70 * tmp70)),(tmp73 * tmp73),"(pwFault.X ^ 2.0 + pwFault.R ^ 2.0) ^ 2.0"));
      }
      else
      {
        tmp75 = jacobian->tmpVars[7] /* pwFault.p.ii.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */;
      }
      tmp77 = tmp75;
    }
    tmp79 = tmp77;
  }
  jacobian->resultVars[1] /* $res_LSJac1_2.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_VAR */ = tmp79;
  TRACE_POP
}

/*
equation index: 179
type: SIMPLE_ASSIGN
$res_LSJac1_3.$pDERLSJac1.dummyVarLSJac1 = if time >= pwLine2.t1 and time < pwLine2.t2 then pwLine2.is.re.SeedLSJac1 else pwLine2.vs.re.SeedLSJac1 - (pwLine2.Z.re * (pwLine2.is.re.SeedLSJac1 + pwLine2.vs.im.SeedLSJac1 * pwLine2.Y.im - pwLine2.vs.re.SeedLSJac1 * pwLine2.Y.re) - pwLine2.Z.im * (pwLine2.is.im.SeedLSJac1 + (-pwLine2.vs.re.SeedLSJac1) * pwLine2.Y.im - pwLine2.vs.im.SeedLSJac1 * pwLine2.Y.re))
*/
void GenIO4HILinNetwork_eqFunction_179(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 11;
  const int equationIndexes[2] = {1,179};
  modelica_boolean tmp80;
  modelica_real tmp81;
  modelica_real tmp82;
  modelica_boolean tmp83;
  modelica_real tmp84;
  modelica_real tmp85;
  tmp81 = 1.0;
  tmp82 = fabs((data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  relationhysteresis(data, &tmp80, data->localData[0]->timeValue, (data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */), tmp81, tmp82, 2, GreaterEq, GreaterEqZC);
  tmp84 = 1.0;
  tmp85 = fabs((data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  relationhysteresis(data, &tmp83, data->localData[0]->timeValue, (data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */), tmp84, tmp85, 3, Less, LessZC);
  jacobian->resultVars[2] /* $res_LSJac1_3.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_VAR */ = ((tmp80 && tmp83)?jacobian->seedVars[1] /* pwLine2.is.re.SeedLSJac1 SEED_VAR */:jacobian->seedVars[8] /* pwLine2.vs.re.SeedLSJac1 SEED_VAR */ - (((data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */)) * (jacobian->seedVars[1] /* pwLine2.is.re.SeedLSJac1 SEED_VAR */ + (jacobian->seedVars[7] /* pwLine2.vs.im.SeedLSJac1 SEED_VAR */) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - ((jacobian->seedVars[8] /* pwLine2.vs.re.SeedLSJac1 SEED_VAR */) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))) - (((data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */)) * (jacobian->seedVars[3] /* pwLine2.is.im.SeedLSJac1 SEED_VAR */ + ((-jacobian->seedVars[8] /* pwLine2.vs.re.SeedLSJac1 SEED_VAR */)) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - ((jacobian->seedVars[7] /* pwLine2.vs.im.SeedLSJac1 SEED_VAR */) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))))));
  TRACE_POP
}

/*
equation index: 180
type: SIMPLE_ASSIGN
$res_LSJac1_4.$pDERLSJac1.dummyVarLSJac1 = if time >= pwLine2.t1 and time < pwLine2.t2 then pwLine2.is.im.SeedLSJac1 else pwLine2.vs.im.SeedLSJac1 - (pwLine2.Z.re * (pwLine2.is.im.SeedLSJac1 + (-pwLine2.vs.re.SeedLSJac1) * pwLine2.Y.im - pwLine2.vs.im.SeedLSJac1 * pwLine2.Y.re) + pwLine2.Z.im * (pwLine2.is.re.SeedLSJac1 + pwLine2.vs.im.SeedLSJac1 * pwLine2.Y.im - pwLine2.vs.re.SeedLSJac1 * pwLine2.Y.re))
*/
void GenIO4HILinNetwork_eqFunction_180(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 12;
  const int equationIndexes[2] = {1,180};
  modelica_boolean tmp86;
  modelica_real tmp87;
  modelica_real tmp88;
  modelica_boolean tmp89;
  modelica_real tmp90;
  modelica_real tmp91;
  tmp87 = 1.0;
  tmp88 = fabs((data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  relationhysteresis(data, &tmp86, data->localData[0]->timeValue, (data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */), tmp87, tmp88, 2, GreaterEq, GreaterEqZC);
  tmp90 = 1.0;
  tmp91 = fabs((data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  relationhysteresis(data, &tmp89, data->localData[0]->timeValue, (data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */), tmp90, tmp91, 3, Less, LessZC);
  jacobian->resultVars[3] /* $res_LSJac1_4.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_VAR */ = ((tmp86 && tmp89)?jacobian->seedVars[3] /* pwLine2.is.im.SeedLSJac1 SEED_VAR */:jacobian->seedVars[7] /* pwLine2.vs.im.SeedLSJac1 SEED_VAR */ - (((data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */)) * (jacobian->seedVars[3] /* pwLine2.is.im.SeedLSJac1 SEED_VAR */ + ((-jacobian->seedVars[8] /* pwLine2.vs.re.SeedLSJac1 SEED_VAR */)) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - ((jacobian->seedVars[7] /* pwLine2.vs.im.SeedLSJac1 SEED_VAR */) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))) + ((data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */)) * (jacobian->seedVars[1] /* pwLine2.is.re.SeedLSJac1 SEED_VAR */ + (jacobian->seedVars[7] /* pwLine2.vs.im.SeedLSJac1 SEED_VAR */) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - ((jacobian->seedVars[8] /* pwLine2.vs.re.SeedLSJac1 SEED_VAR */) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */))))));
  TRACE_POP
}

/*
equation index: 181
type: SIMPLE_ASSIGN
$res_LSJac1_5.$pDERLSJac1.dummyVarLSJac1 = if time >= pwLine1.t1 and time < pwLine1.t2 then pwLine1.is.re.SeedLSJac1 else pwLine2.vs.re.SeedLSJac1 - (pwLine1.Z.re * (pwLine1.is.re.SeedLSJac1 + pwLine2.vs.im.SeedLSJac1 * pwLine1.Y.im - pwLine2.vs.re.SeedLSJac1 * pwLine1.Y.re) - pwLine1.Z.im * (pwLine1.is.im.SeedLSJac1 + (-pwLine2.vs.re.SeedLSJac1) * pwLine1.Y.im - pwLine2.vs.im.SeedLSJac1 * pwLine1.Y.re))
*/
void GenIO4HILinNetwork_eqFunction_181(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 13;
  const int equationIndexes[2] = {1,181};
  modelica_boolean tmp92;
  modelica_real tmp93;
  modelica_real tmp94;
  modelica_boolean tmp95;
  modelica_real tmp96;
  modelica_real tmp97;
  tmp93 = 1.0;
  tmp94 = fabs((data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  relationhysteresis(data, &tmp92, data->localData[0]->timeValue, (data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */), tmp93, tmp94, 4, GreaterEq, GreaterEqZC);
  tmp96 = 1.0;
  tmp97 = fabs((data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  relationhysteresis(data, &tmp95, data->localData[0]->timeValue, (data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */), tmp96, tmp97, 5, Less, LessZC);
  jacobian->resultVars[4] /* $res_LSJac1_5.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_VAR */ = ((tmp92 && tmp95)?jacobian->seedVars[0] /* pwLine1.is.re.SeedLSJac1 SEED_VAR */:jacobian->seedVars[8] /* pwLine2.vs.re.SeedLSJac1 SEED_VAR */ - (((data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */)) * (jacobian->seedVars[0] /* pwLine1.is.re.SeedLSJac1 SEED_VAR */ + (jacobian->seedVars[7] /* pwLine2.vs.im.SeedLSJac1 SEED_VAR */) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - ((jacobian->seedVars[8] /* pwLine2.vs.re.SeedLSJac1 SEED_VAR */) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))) - (((data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */)) * (jacobian->seedVars[2] /* pwLine1.is.im.SeedLSJac1 SEED_VAR */ + ((-jacobian->seedVars[8] /* pwLine2.vs.re.SeedLSJac1 SEED_VAR */)) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - ((jacobian->seedVars[7] /* pwLine2.vs.im.SeedLSJac1 SEED_VAR */) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))))));
  TRACE_POP
}

/*
equation index: 182
type: SIMPLE_ASSIGN
$res_LSJac1_6.$pDERLSJac1.dummyVarLSJac1 = if time >= pwLine1.t1 and time < pwLine1.t2 then pwLine1.is.im.SeedLSJac1 else pwLine2.vs.im.SeedLSJac1 - (pwLine1.Z.re * (pwLine1.is.im.SeedLSJac1 + (-pwLine2.vs.re.SeedLSJac1) * pwLine1.Y.im - pwLine2.vs.im.SeedLSJac1 * pwLine1.Y.re) + pwLine1.Z.im * (pwLine1.is.re.SeedLSJac1 + pwLine2.vs.im.SeedLSJac1 * pwLine1.Y.im - pwLine2.vs.re.SeedLSJac1 * pwLine1.Y.re))
*/
void GenIO4HILinNetwork_eqFunction_182(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 14;
  const int equationIndexes[2] = {1,182};
  modelica_boolean tmp98;
  modelica_real tmp99;
  modelica_real tmp100;
  modelica_boolean tmp101;
  modelica_real tmp102;
  modelica_real tmp103;
  tmp99 = 1.0;
  tmp100 = fabs((data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  relationhysteresis(data, &tmp98, data->localData[0]->timeValue, (data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */), tmp99, tmp100, 4, GreaterEq, GreaterEqZC);
  tmp102 = 1.0;
  tmp103 = fabs((data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  relationhysteresis(data, &tmp101, data->localData[0]->timeValue, (data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */), tmp102, tmp103, 5, Less, LessZC);
  jacobian->resultVars[5] /* $res_LSJac1_6.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_VAR */ = ((tmp98 && tmp101)?jacobian->seedVars[2] /* pwLine1.is.im.SeedLSJac1 SEED_VAR */:jacobian->seedVars[7] /* pwLine2.vs.im.SeedLSJac1 SEED_VAR */ - (((data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */)) * (jacobian->seedVars[2] /* pwLine1.is.im.SeedLSJac1 SEED_VAR */ + ((-jacobian->seedVars[8] /* pwLine2.vs.re.SeedLSJac1 SEED_VAR */)) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - ((jacobian->seedVars[7] /* pwLine2.vs.im.SeedLSJac1 SEED_VAR */) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))) + ((data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */)) * (jacobian->seedVars[0] /* pwLine1.is.re.SeedLSJac1 SEED_VAR */ + (jacobian->seedVars[7] /* pwLine2.vs.im.SeedLSJac1 SEED_VAR */) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - ((jacobian->seedVars[8] /* pwLine2.vs.re.SeedLSJac1 SEED_VAR */) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */))))));
  TRACE_POP
}

/*
equation index: 183
type: SIMPLE_ASSIGN
$res_LSJac1_7.$pDERLSJac1.dummyVarLSJac1 = pwLine2.vs.im.SeedLSJac1 * transformer.m + (-transformer.x) * transformer.ir.re.SeedLSJac1 * transformer.m - transformer.vs.im.$pDERLSJac1.dummyVarLSJac1 - transformer.r * transformer.ir.im.$pDERLSJac1.dummyVarLSJac1 * transformer.m
*/
void GenIO4HILinNetwork_eqFunction_183(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 15;
  const int equationIndexes[2] = {1,183};
  jacobian->resultVars[6] /* $res_LSJac1_7.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_VAR */ = (jacobian->seedVars[7] /* pwLine2.vs.im.SeedLSJac1 SEED_VAR */) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */)) + ((-(data->simulationInfo->realParameter[137] /* transformer.x PARAM */))) * ((jacobian->seedVars[4] /* transformer.ir.re.SeedLSJac1 SEED_VAR */) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */))) - jacobian->tmpVars[3] /* transformer.vs.im.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ - (((data->simulationInfo->realParameter[135] /* transformer.r PARAM */)) * ((jacobian->tmpVars[6] /* transformer.ir.im.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */))));
  TRACE_POP
}

/*
equation index: 184
type: SIMPLE_ASSIGN
$res_LSJac1_8.$pDERLSJac1.dummyVarLSJac1 = ($cse3 * G1.machine.vd.$pDERLSJac1.dummyVarLSJac1 + $cse4 * G1.machine.vq.$pDERLSJac1.dummyVarLSJac1) * G1.machine.V_MBtoSB - transformer.vs.re.$pDERLSJac1.dummyVarLSJac1
*/
void GenIO4HILinNetwork_eqFunction_184(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 16;
  const int equationIndexes[2] = {1,184};
  jacobian->resultVars[7] /* $res_LSJac1_8.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_VAR */ = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[12]] /* $cse3 variable */)) * (jacobian->tmpVars[4] /* G1.machine.vd.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[13]] /* $cse4 variable */)) * (jacobian->tmpVars[5] /* G1.machine.vq.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */)) * ((data->simulationInfo->realParameter[51] /* G1.machine.V_MBtoSB PARAM */)) - jacobian->tmpVars[2] /* transformer.vs.re.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */;
  TRACE_POP
}

/*
equation index: 185
type: SIMPLE_ASSIGN
$res_LSJac1_9.$pDERLSJac1.dummyVarLSJac1 = ($cse3 * G1.machine.vq.$pDERLSJac1.dummyVarLSJac1 - $cse4 * G1.machine.vd.$pDERLSJac1.dummyVarLSJac1) * G1.machine.V_MBtoSB - transformer.vs.im.$pDERLSJac1.dummyVarLSJac1
*/
void GenIO4HILinNetwork_eqFunction_185(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 17;
  const int equationIndexes[2] = {1,185};
  jacobian->resultVars[8] /* $res_LSJac1_9.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_VAR */ = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[12]] /* $cse3 variable */)) * (jacobian->tmpVars[5] /* G1.machine.vq.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[13]] /* $cse4 variable */)) * (jacobian->tmpVars[4] /* G1.machine.vd.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */))) * ((data->simulationInfo->realParameter[51] /* G1.machine.V_MBtoSB PARAM */)) - jacobian->tmpVars[3] /* transformer.vs.im.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int GenIO4HILinNetwork_functionJacLSJac1_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = GenIO4HILinNetwork_INDEX_JAC_LSJac1;
  
  TRACE_POP
  return 0;
}

int GenIO4HILinNetwork_functionJacLSJac1_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = GenIO4HILinNetwork_INDEX_JAC_LSJac1;
  GenIO4HILinNetwork_eqFunction_168(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_169(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_170(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_171(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_172(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_173(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_174(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_175(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_176(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_177(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_178(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_179(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_180(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_181(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_182(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_183(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_184(data, threadData, jacobian, parentJacobian);
  GenIO4HILinNetwork_eqFunction_185(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
int GenIO4HILinNetwork_functionJacH_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int GenIO4HILinNetwork_functionJacF_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int GenIO4HILinNetwork_functionJacD_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int GenIO4HILinNetwork_functionJacC_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int GenIO4HILinNetwork_functionJacB_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

OMC_DISABLE_OPT
int GenIO4HILinNetwork_functionJacA_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = GenIO4HILinNetwork_INDEX_JAC_A;
  
  TRACE_POP
  return 0;
}

int GenIO4HILinNetwork_functionJacA_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = GenIO4HILinNetwork_INDEX_JAC_A;
  TRACE_POP
  return 0;
}

OMC_DISABLE_OPT
int GenIO4HILinNetwork_initialAnalyticJacobianLSJac0(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "GenIO4HILinNetwork_JacLSJac0.bin");
  
  initAnalyticJacobian(jacobian, 7, 7, 22, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(7, 29, 5);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 7+1, pFile, FALSE);
  if (count != 7+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %zu", 7+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 29, pFile, FALSE);
  if (count != 29) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %zu", 29, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1, 7);
  /* color 2 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 2, 1, 7);
  /* color 3 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 3, 1, 7);
  /* color 4 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 4, 2, 7);
  /* color 5 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 5, 2, 7);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int GenIO4HILinNetwork_initialAnalyticJacobianLSJac1(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "GenIO4HILinNetwork_JacLSJac1.bin");
  
  initAnalyticJacobian(jacobian, 9, 9, 18, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(9, 39, 7);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 9+1, pFile, FALSE);
  if (count != 9+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %zu", 9+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 39, pFile, FALSE);
  if (count != 39) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %zu", 39, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1, 9);
  /* color 2 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 2, 1, 9);
  /* color 3 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 3, 1, 9);
  /* color 4 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 4, 1, 9);
  /* color 5 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 5, 1, 9);
  /* color 6 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 6, 2, 9);
  /* color 7 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 7, 2, 9);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
int GenIO4HILinNetwork_initialAnalyticJacobianH(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int GenIO4HILinNetwork_initialAnalyticJacobianF(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int GenIO4HILinNetwork_initialAnalyticJacobianD(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int GenIO4HILinNetwork_initialAnalyticJacobianC(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int GenIO4HILinNetwork_initialAnalyticJacobianB(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
OMC_DISABLE_OPT
int GenIO4HILinNetwork_initialAnalyticJacobianA(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "GenIO4HILinNetwork_JacA.bin");
  
  initAnalyticJacobian(jacobian, 6, 6, 0, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(6, 20, 4);
  jacobian->availability = JACOBIAN_ONLY_SPARSITY;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 6+1, pFile, FALSE);
  if (count != 6+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %zu", 6+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 20, pFile, FALSE);
  if (count != 20) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %zu", 20, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1, 6);
  /* color 2 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 2, 1, 6);
  /* color 3 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 3, 2, 6);
  /* color 4 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 4, 2, 6);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}



