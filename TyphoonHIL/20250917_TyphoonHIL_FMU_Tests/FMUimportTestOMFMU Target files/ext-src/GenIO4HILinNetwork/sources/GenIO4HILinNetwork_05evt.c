/* Events: Sample, Zero Crossings, Relations, Discrete Changes */
#include "GenIO4HILinNetwork_model.h"
#if defined(__cplusplus)
extern "C" {
#endif

/* Initializes the raw time events of the simulation using the now
   calcualted parameters. */
void GenIO4HILinNetwork_function_initSample(DATA *data, threadData_t *threadData)
{
  long i=0;
}

const char *GenIO4HILinNetwork_zeroCrossingDescription(int i, int **out_EquationIndexes)
{
  static const char *res[] = {"time < pwFault.t1",
  "time < pwFault.t2 and pwFault.ground",
  "time < pwFault.t2",
  "time >= pwLine2.t1 and time < pwLine2.t2",
  "time >= pwLine2.t1",
  "time < pwLine2.t2",
  "time >= pwLine1.t1 and time < pwLine1.t2",
  "time >= pwLine1.t1",
  "time < pwLine1.t2"};
  static const int occurEqs0[] = {1,-1};
  static const int occurEqs1[] = {1,-1};
  static const int occurEqs2[] = {1,-1};
  static const int occurEqs3[] = {1,-1};
  static const int occurEqs4[] = {1,-1};
  static const int occurEqs5[] = {1,-1};
  static const int occurEqs6[] = {1,-1};
  static const int occurEqs7[] = {1,-1};
  static const int occurEqs8[] = {1,-1};
  static const int *occurEqs[] = {occurEqs0,occurEqs1,occurEqs2,occurEqs3,occurEqs4,occurEqs5,occurEqs6,occurEqs7,occurEqs8};
  *out_EquationIndexes = (int*) occurEqs[i];
  return res[i];
}

/* forwarded equations */

int GenIO4HILinNetwork_function_ZeroCrossingsEquations(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->callStatistics.functionZeroCrossingsEquations++;

  
  TRACE_POP
  return 0;
}

int GenIO4HILinNetwork_function_ZeroCrossings(DATA *data, threadData_t *threadData, double *gout)
{
  TRACE_PUSH
  const int *equationIndexes = NULL;

  modelica_boolean tmp0;
  modelica_real tmp1;
  modelica_real tmp2;
  modelica_boolean tmp3;
  modelica_real tmp4;
  modelica_real tmp5;
  modelica_boolean tmp6;
  modelica_real tmp7;
  modelica_real tmp8;
  modelica_boolean tmp9;
  modelica_real tmp10;
  modelica_real tmp11;
  modelica_boolean tmp12;
  modelica_real tmp13;
  modelica_real tmp14;
  modelica_boolean tmp15;
  modelica_real tmp16;
  modelica_real tmp17;
  modelica_boolean tmp18;
  modelica_real tmp19;
  modelica_real tmp20;
  modelica_boolean tmp21;
  modelica_real tmp22;
  modelica_real tmp23;
  modelica_boolean tmp24;
  modelica_real tmp25;
  modelica_real tmp26;
  modelica_boolean tmp27;
  modelica_real tmp28;
  modelica_real tmp29;
  modelica_boolean tmp30;
  modelica_real tmp31;
  modelica_real tmp32;
  modelica_integer current_index = 0;
  modelica_integer start_index;
  
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_ZC);
#endif
  data->simulationInfo->callStatistics.functionZeroCrossings++;

  start_index = current_index;
  tmp1 = 1.0;
  tmp2 = fabs((data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */));
  tmp0 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */), tmp1, tmp2, data->simulationInfo->storedRelations[0]);
  gout[start_index] = (tmp0) ? 1 : -1;
  current_index++;

  start_index = current_index;
  tmp4 = 1.0;
  tmp5 = fabs((data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
  tmp3 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */), tmp4, tmp5, data->simulationInfo->storedRelations[1]);
  gout[start_index] = ((tmp3 && (data->simulationInfo->booleanParameter[54] /* pwFault.ground PARAM */))) ? 1 : -1;
  current_index++;

  start_index = current_index;
  tmp7 = 1.0;
  tmp8 = fabs((data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
  tmp6 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */), tmp7, tmp8, data->simulationInfo->storedRelations[1]);
  gout[start_index] = (tmp6) ? 1 : -1;
  current_index++;

  start_index = current_index;
  tmp10 = 1.0;
  tmp11 = fabs((data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  tmp9 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */), tmp10, tmp11, data->simulationInfo->storedRelations[2]);
  tmp13 = 1.0;
  tmp14 = fabs((data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  tmp12 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */), tmp13, tmp14, data->simulationInfo->storedRelations[3]);
  gout[start_index] = ((tmp9 && tmp12)) ? 1 : -1;
  current_index++;

  start_index = current_index;
  tmp16 = 1.0;
  tmp17 = fabs((data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  tmp15 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */), tmp16, tmp17, data->simulationInfo->storedRelations[2]);
  gout[start_index] = (tmp15) ? 1 : -1;
  current_index++;

  start_index = current_index;
  tmp19 = 1.0;
  tmp20 = fabs((data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  tmp18 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */), tmp19, tmp20, data->simulationInfo->storedRelations[3]);
  gout[start_index] = (tmp18) ? 1 : -1;
  current_index++;

  start_index = current_index;
  tmp22 = 1.0;
  tmp23 = fabs((data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  tmp21 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */), tmp22, tmp23, data->simulationInfo->storedRelations[4]);
  tmp25 = 1.0;
  tmp26 = fabs((data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  tmp24 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */), tmp25, tmp26, data->simulationInfo->storedRelations[5]);
  gout[start_index] = ((tmp21 && tmp24)) ? 1 : -1;
  current_index++;

  start_index = current_index;
  tmp28 = 1.0;
  tmp29 = fabs((data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  tmp27 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */), tmp28, tmp29, data->simulationInfo->storedRelations[4]);
  gout[start_index] = (tmp27) ? 1 : -1;
  current_index++;

  start_index = current_index;
  tmp31 = 1.0;
  tmp32 = fabs((data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  tmp30 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */), tmp31, tmp32, data->simulationInfo->storedRelations[5]);
  gout[start_index] = (tmp30) ? 1 : -1;
  current_index++;

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_ZC);
#endif

  TRACE_POP
  return 0;
}

const char *GenIO4HILinNetwork_relationDescription(int i)
{
  const char *res[] = {"time < pwFault.t1",
  "time < pwFault.t2",
  "time >= pwLine2.t1",
  "time < pwLine2.t2",
  "time >= pwLine1.t1",
  "time < pwLine1.t2"};
  return res[i];
}

int GenIO4HILinNetwork_function_updateRelations(DATA *data, threadData_t *threadData, int evalforZeroCross)
{
  TRACE_PUSH
  const int *equationIndexes = NULL;

  modelica_boolean tmp33;
  modelica_real tmp34;
  modelica_real tmp35;
  modelica_boolean tmp36;
  modelica_real tmp37;
  modelica_real tmp38;
  modelica_boolean tmp39;
  modelica_real tmp40;
  modelica_real tmp41;
  modelica_boolean tmp42;
  modelica_real tmp43;
  modelica_real tmp44;
  modelica_boolean tmp45;
  modelica_real tmp46;
  modelica_real tmp47;
  modelica_boolean tmp48;
  modelica_real tmp49;
  modelica_real tmp50;
  modelica_integer current_index = 0;
  modelica_integer start_index;
  
  if(evalforZeroCross) {
    start_index = current_index;
    tmp34 = 1.0;
    tmp35 = fabs((data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */));
    tmp33 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */), tmp34, tmp35, data->simulationInfo->storedRelations[0]);
    data->simulationInfo->relations[start_index] = tmp33;
    current_index++;

    start_index = current_index;
    tmp37 = 1.0;
    tmp38 = fabs((data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
    tmp36 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */), tmp37, tmp38, data->simulationInfo->storedRelations[1]);
    data->simulationInfo->relations[start_index] = tmp36;
    current_index++;

    start_index = current_index;
    tmp40 = 1.0;
    tmp41 = fabs((data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
    tmp39 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */), tmp40, tmp41, data->simulationInfo->storedRelations[2]);
    data->simulationInfo->relations[start_index] = tmp39;
    current_index++;

    start_index = current_index;
    tmp43 = 1.0;
    tmp44 = fabs((data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
    tmp42 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */), tmp43, tmp44, data->simulationInfo->storedRelations[3]);
    data->simulationInfo->relations[start_index] = tmp42;
    current_index++;

    start_index = current_index;
    tmp46 = 1.0;
    tmp47 = fabs((data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
    tmp45 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */), tmp46, tmp47, data->simulationInfo->storedRelations[4]);
    data->simulationInfo->relations[start_index] = tmp45;
    current_index++;

    start_index = current_index;
    tmp49 = 1.0;
    tmp50 = fabs((data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
    tmp48 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */), tmp49, tmp50, data->simulationInfo->storedRelations[5]);
    data->simulationInfo->relations[start_index] = tmp48;
    current_index++;
  } else {
    start_index = current_index;
    data->simulationInfo->relations[start_index] = (data->localData[0]->timeValue < (data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */));
    current_index++;

    start_index = current_index;
    data->simulationInfo->relations[start_index] = (data->localData[0]->timeValue < (data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
    current_index++;

    start_index = current_index;
    data->simulationInfo->relations[start_index] = (data->localData[0]->timeValue >= (data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
    current_index++;

    start_index = current_index;
    data->simulationInfo->relations[start_index] = (data->localData[0]->timeValue < (data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
    current_index++;

    start_index = current_index;
    data->simulationInfo->relations[start_index] = (data->localData[0]->timeValue >= (data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
    current_index++;

    start_index = current_index;
    data->simulationInfo->relations[start_index] = (data->localData[0]->timeValue < (data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
    current_index++;
  }
  
  TRACE_POP
  return 0;
}

#if defined(__cplusplus)
}
#endif

