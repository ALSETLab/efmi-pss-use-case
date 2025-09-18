/* Main Simulation File */

#if defined(__cplusplus)
extern "C" {
#endif

#include "GenIO4HILinNetwork_model.h"
#include "simulation/solver/events.h"



/* dummy VARINFO and FILEINFO */
const VAR_INFO dummyVAR_INFO = omc_dummyVarInfo;

int GenIO4HILinNetwork_input_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[79]] /* vf variable */) = data->simulationInfo->inputVars[0];
  
  TRACE_POP
  return 0;
}

int GenIO4HILinNetwork_input_function_init(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->inputVars[0] = data->modelData->realVarsData[79].attribute.start;
  
  TRACE_POP
  return 0;
}

int GenIO4HILinNetwork_input_function_updateStartValues(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->modelData->realVarsData[79].attribute.start = data->simulationInfo->inputVars[0];
  
  TRACE_POP
  return 0;
}

int GenIO4HILinNetwork_inputNames(DATA *data, char ** names){
  TRACE_PUSH

  names[0] = (char *) data->modelData->realVarsData[79].info.name;
  
  TRACE_POP
  return 0;
}

int GenIO4HILinNetwork_data_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  TRACE_POP
  return 0;
}

int GenIO4HILinNetwork_dataReconciliationInputNames(DATA *data, char ** names){
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int GenIO4HILinNetwork_dataReconciliationUnmeasuredVariables(DATA *data, char ** names)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int GenIO4HILinNetwork_output_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->outputVars[0] = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[40]] /* Pgen variable */);
  data->simulationInfo->outputVars[1] = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[41]] /* Qgen variable */);
  data->simulationInfo->outputVars[2] = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[78]] /* v variable */);
  data->simulationInfo->outputVars[3] = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[80]] /* vf0OUT variable */);
  data->simulationInfo->outputVars[4] = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[81]] /* w variable */);
  
  TRACE_POP
  return 0;
}

int GenIO4HILinNetwork_setc_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int GenIO4HILinNetwork_setb_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}


/*
equation index: 143
type: SIMPLE_ASSIGN
$DER.G1.machine.delta = G1.machine.w_b * (-1.0 + G1.machine.w)
*/
void GenIO4HILinNetwork_eqFunction_143(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,143};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[6]] /* der(G1.machine.delta) STATE_DER */) = ((data->simulationInfo->realParameter[83] /* G1.machine.w_b PARAM */)) * (-1.0 + (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[5]] /* G1.machine.w STATE(1) */));
  TRACE_POP
}
/*
equation index: 144
type: SIMPLE_ASSIGN
G1.feedbackVf0.y = vf - G1.gainVf0.y
*/
void GenIO4HILinNetwork_eqFunction_144(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,144};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[31]] /* G1.feedbackVf0.y variable */) = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[79]] /* vf variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[32]] /* G1.gainVf0.y variable */);
  TRACE_POP
}
/*
equation index: 145
type: SIMPLE_ASSIGN
G1.machine.vf_MB = G1.feedbackVf0.y * G1.machine.V_b / G1.machine.Vn
*/
void GenIO4HILinNetwork_eqFunction_145(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,145};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[38]] /* G1.machine.vf_MB variable */) = ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[31]] /* G1.feedbackVf0.y variable */)) * (DIVISION_SIM((data->simulationInfo->realParameter[52] /* G1.machine.V_b PARAM */),(data->simulationInfo->realParameter[55] /* G1.machine.Vn PARAM */),"G1.machine.Vn",equationIndexes));
  TRACE_POP
}
/*
equation index: 146
type: SIMPLE_ASSIGN
w = G1.machine.w
*/
void GenIO4HILinNetwork_eqFunction_146(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,146};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[81]] /* w variable */) = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[5]] /* G1.machine.w STATE(1) */);
  TRACE_POP
}
/*
equation index: 147
type: SIMPLE_ASSIGN
vf0OUT = G1.machine.vf00
*/
void GenIO4HILinNetwork_eqFunction_147(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,147};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[80]] /* vf0OUT variable */) = (data->simulationInfo->realParameter[79] /* G1.machine.vf00 PARAM */);
  TRACE_POP
}
/*
equation index: 148
type: SIMPLE_ASSIGN
$cse4 = cos(G1.machine.delta)
*/
void GenIO4HILinNetwork_eqFunction_148(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,148};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[13]] /* $cse4 variable */) = cos((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* G1.machine.delta STATE(1) */));
  TRACE_POP
}
/*
equation index: 149
type: SIMPLE_ASSIGN
$cse3 = sin(G1.machine.delta)
*/
void GenIO4HILinNetwork_eqFunction_149(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,149};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[12]] /* $cse3 variable */) = sin((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* G1.machine.delta STATE(1) */));
  TRACE_POP
}
/*
equation index: 186
type: LINEAR

<var>pwLine1.is.re</var>
<var>pwLine2.is.re</var>
<var>pwLine1.is.im</var>
<var>pwLine2.is.im</var>
<var>transformer.ir.re</var>
<var>G1.machine.iq</var>
<var>G1.machine.id</var>
<var>pwLine2.vs.im</var>
<var>pwLine2.vs.re</var>
<row>

</row>
<matrix>
</matrix>
*/
OMC_DISABLE_OPT
void GenIO4HILinNetwork_eqFunction_186(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,186};
  /* Linear equation system */
  int retValue;
  double aux_x[9] = { (data->localData[1]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[73]] /* transformer.ir.re variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) };
  if(OMC_ACTIVE_STREAM(OMC_LOG_DT))
  {
    infoStreamPrint(OMC_LOG_DT, 1, "Solving linear system 186 (STRICT TEARING SET if tearing enabled) at time = %18.10e", data->localData[0]->timeValue);
    messageClose(OMC_LOG_DT);
  }
  
  retValue = solve_linear_system(data, threadData, 3, &aux_x[0]);
  
  /* check if solution process was successful */
  if (retValue > 0){
    const int indexes[2] = {1,186};
    throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, indexes, "Solving linear system 186 failed at time=%.15g.\nFor more information please use -lv LOG_LS.", data->localData[0]->timeValue);
  }
  /* write solution */
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */) = aux_x[0];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */) = aux_x[1];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */) = aux_x[2];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */) = aux_x[3];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[73]] /* transformer.ir.re variable */) = aux_x[4];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */) = aux_x[5];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */) = aux_x[6];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */) = aux_x[7];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) = aux_x[8];

  TRACE_POP
}
/*
equation index: 187
type: SIMPLE_ASSIGN
B2.v = sqrt(pwLine2.vs.re ^ 2.0 + pwLine2.vs.im ^ 2.0)
*/
void GenIO4HILinNetwork_eqFunction_187(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,187};
  modelica_real tmp0;
  modelica_real tmp1;
  modelica_real tmp2;
  tmp0 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */);
  tmp1 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */);
  tmp2 = (tmp0 * tmp0) + (tmp1 * tmp1);
  if(!(tmp2 >= 0.0))
  {
    if (data->simulationInfo->noThrowAsserts) {
      FILE_INFO info = {"",0,0,0,0,0};
      infoStreamPrintWithEquationIndexes(OMC_LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f", initial() ? "during initialization " : "", data->localData[0]->timeValue);
      data->simulationInfo->needToReThrow = 1;
    } else {
      FILE_INFO info = {"",0,0,0,0,0};
      omc_assert_warning(info, "The following assertion has been violated %sat time %f", initial() ? "during initialization " : "", data->localData[0]->timeValue);
      throwStreamPrintWithEquationIndexes(threadData, info, equationIndexes, "Model error: Argument of sqrt(pwLine2.vs.re ^ 2.0 + pwLine2.vs.im ^ 2.0) was %g should be >= 0", tmp2);
    }
  }
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[23]] /* B2.v variable */) = sqrt(tmp2);
  TRACE_POP
}
/*
equation index: 188
type: LINEAR

<var>pwLine1.ir.re</var>
<var>pwLine1.ir.im</var>
<row>
  <cell>if time >= pwLine1.t1 and time < pwLine1.t2 then 0.0 else infiniteBus.p.vi - pwLine2.vs.im - (pwLine1.Z.re * ((-infiniteBus.p.vr) * pwLine1.Y.im - infiniteBus.p.vi * pwLine1.Y.re) + pwLine1.Z.im * (infiniteBus.p.vi * pwLine1.Y.im - infiniteBus.p.vr * pwLine1.Y.re))</cell>
  <cell>if time >= pwLine1.t1 and time < pwLine1.t2 then 0.0 else infiniteBus.p.vr - pwLine2.vs.re - (pwLine1.Z.re * (infiniteBus.p.vi * pwLine1.Y.im - infiniteBus.p.vr * pwLine1.Y.re) - pwLine1.Z.im * ((-infiniteBus.p.vr) * pwLine1.Y.im - infiniteBus.p.vi * pwLine1.Y.re))</cell>
</row>
<matrix>
  <cell row="0" col="0">
    <residual>-(if time >= pwLine1.t1 and time < pwLine1.t2 then 0.0 else -pwLine1.Z.im)</residual>
  </cell><cell row="0" col="1">
    <residual>-(if time >= pwLine1.t1 and time < pwLine1.t2 then 1.0 else -pwLine1.Z.re)</residual>
  </cell><cell row="1" col="0">
    <residual>-(if time >= pwLine1.t1 and time < pwLine1.t2 then 1.0 else -pwLine1.Z.re)</residual>
  </cell><cell row="1" col="1">
    <residual>-(if time >= pwLine1.t1 and time < pwLine1.t2 then 0.0 else pwLine1.Z.im)</residual>
  </cell>
</matrix>
*/
OMC_DISABLE_OPT
void GenIO4HILinNetwork_eqFunction_188(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,188};
  /* Linear equation system */
  int retValue;
  double aux_x[2] = { (data->localData[1]->realVars[data->simulationInfo->realVarsIndex[55]] /* pwLine1.ir.re variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[54]] /* pwLine1.ir.im variable */) };
  if(OMC_ACTIVE_STREAM(OMC_LOG_DT))
  {
    infoStreamPrint(OMC_LOG_DT, 1, "Solving linear system 188 (STRICT TEARING SET if tearing enabled) at time = %18.10e", data->localData[0]->timeValue);
    messageClose(OMC_LOG_DT);
  }
  
  retValue = solve_linear_system(data, threadData, 4, &aux_x[0]);
  
  /* check if solution process was successful */
  if (retValue > 0){
    const int indexes[2] = {1,188};
    throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, indexes, "Solving linear system 188 failed at time=%.15g.\nFor more information please use -lv LOG_LS.", data->localData[0]->timeValue);
  }
  /* write solution */
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[55]] /* pwLine1.ir.re variable */) = aux_x[0];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[54]] /* pwLine1.ir.im variable */) = aux_x[1];

  TRACE_POP
}
/*
equation index: 189
type: SIMPLE_ASSIGN
pwLine1.P21 = ((-infiniteBus.p.vr) * pwLine1.ir.re - infiniteBus.p.vi * pwLine1.ir.im) * pwLine1.S_b
*/
void GenIO4HILinNetwork_eqFunction_189(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,189};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[51]] /* pwLine1.P21 variable */) = (((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[55]] /* pwLine1.ir.re variable */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[54]] /* pwLine1.ir.im variable */)))) * ((data->simulationInfo->realParameter[109] /* pwLine1.S_b PARAM */));
  TRACE_POP
}
/*
equation index: 190
type: SIMPLE_ASSIGN
pwLine1.Q21 = (infiniteBus.p.vr * pwLine1.ir.im - infiniteBus.p.vi * pwLine1.ir.re) * pwLine1.S_b
*/
void GenIO4HILinNetwork_eqFunction_190(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,190};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[53]] /* pwLine1.Q21 variable */) = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[54]] /* pwLine1.ir.im variable */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[55]] /* pwLine1.ir.re variable */)))) * ((data->simulationInfo->realParameter[109] /* pwLine1.S_b PARAM */));
  TRACE_POP
}
/*
equation index: 191
type: SIMPLE_ASSIGN
pwLine1.P12 = (pwLine2.vs.re * pwLine1.is.re + pwLine2.vs.im * pwLine1.is.im) * pwLine1.S_b
*/
void GenIO4HILinNetwork_eqFunction_191(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,191};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[50]] /* pwLine1.P12 variable */) = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */)) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */))) * ((data->simulationInfo->realParameter[109] /* pwLine1.S_b PARAM */));
  TRACE_POP
}
/*
equation index: 192
type: SIMPLE_ASSIGN
pwLine1.Q12 = (pwLine2.vs.im * pwLine1.is.re - pwLine2.vs.re * pwLine1.is.im) * pwLine1.S_b
*/
void GenIO4HILinNetwork_eqFunction_192(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,192};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[52]] /* pwLine1.Q12 variable */) = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */)))) * ((data->simulationInfo->realParameter[109] /* pwLine1.S_b PARAM */));
  TRACE_POP
}
/*
equation index: 193
type: LINEAR

<var>pwLine2.ir.re</var>
<var>pwLine2.ir.im</var>
<row>
  <cell>if time >= pwLine2.t1 and time < pwLine2.t2 then 0.0 else infiniteBus.p.vi - pwLine2.vs.im - (pwLine2.Z.re * ((-infiniteBus.p.vr) * pwLine2.Y.im - infiniteBus.p.vi * pwLine2.Y.re) + pwLine2.Z.im * (infiniteBus.p.vi * pwLine2.Y.im - infiniteBus.p.vr * pwLine2.Y.re))</cell>
  <cell>if time >= pwLine2.t1 and time < pwLine2.t2 then 0.0 else infiniteBus.p.vr - pwLine2.vs.re - (pwLine2.Z.re * (infiniteBus.p.vi * pwLine2.Y.im - infiniteBus.p.vr * pwLine2.Y.re) - pwLine2.Z.im * ((-infiniteBus.p.vr) * pwLine2.Y.im - infiniteBus.p.vi * pwLine2.Y.re))</cell>
</row>
<matrix>
  <cell row="0" col="0">
    <residual>-(if time >= pwLine2.t1 and time < pwLine2.t2 then 0.0 else -pwLine2.Z.im)</residual>
  </cell><cell row="0" col="1">
    <residual>-(if time >= pwLine2.t1 and time < pwLine2.t2 then 1.0 else -pwLine2.Z.re)</residual>
  </cell><cell row="1" col="0">
    <residual>-(if time >= pwLine2.t1 and time < pwLine2.t2 then 1.0 else -pwLine2.Z.re)</residual>
  </cell><cell row="1" col="1">
    <residual>-(if time >= pwLine2.t1 and time < pwLine2.t2 then 0.0 else pwLine2.Z.im)</residual>
  </cell>
</matrix>
*/
OMC_DISABLE_OPT
void GenIO4HILinNetwork_eqFunction_193(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,193};
  /* Linear equation system */
  int retValue;
  double aux_x[2] = { (data->localData[1]->realVars[data->simulationInfo->realVarsIndex[63]] /* pwLine2.ir.re variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[62]] /* pwLine2.ir.im variable */) };
  if(OMC_ACTIVE_STREAM(OMC_LOG_DT))
  {
    infoStreamPrint(OMC_LOG_DT, 1, "Solving linear system 193 (STRICT TEARING SET if tearing enabled) at time = %18.10e", data->localData[0]->timeValue);
    messageClose(OMC_LOG_DT);
  }
  
  retValue = solve_linear_system(data, threadData, 5, &aux_x[0]);
  
  /* check if solution process was successful */
  if (retValue > 0){
    const int indexes[2] = {1,193};
    throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, indexes, "Solving linear system 193 failed at time=%.15g.\nFor more information please use -lv LOG_LS.", data->localData[0]->timeValue);
  }
  /* write solution */
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[63]] /* pwLine2.ir.re variable */) = aux_x[0];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[62]] /* pwLine2.ir.im variable */) = aux_x[1];

  TRACE_POP
}
/*
equation index: 194
type: SIMPLE_ASSIGN
infiniteBus.p.ir = (-pwLine2.ir.re) - pwLine1.ir.re
*/
void GenIO4HILinNetwork_eqFunction_194(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,194};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[45]] /* infiniteBus.p.ir variable */) = (-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[63]] /* pwLine2.ir.re variable */)) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[55]] /* pwLine1.ir.re variable */);
  TRACE_POP
}
/*
equation index: 195
type: SIMPLE_ASSIGN
infiniteBus.p.ii = (-pwLine2.ir.im) - pwLine1.ir.im
*/
void GenIO4HILinNetwork_eqFunction_195(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,195};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[44]] /* infiniteBus.p.ii variable */) = (-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[62]] /* pwLine2.ir.im variable */)) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[54]] /* pwLine1.ir.im variable */);
  TRACE_POP
}
/*
equation index: 196
type: SIMPLE_ASSIGN
infiniteBus.P = ((-infiniteBus.p.vr) * infiniteBus.p.ir - infiniteBus.p.vi * infiniteBus.p.ii) * infiniteBus.S_b
*/
void GenIO4HILinNetwork_eqFunction_196(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,196};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[42]] /* infiniteBus.P variable */) = (((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[45]] /* infiniteBus.p.ir variable */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[44]] /* infiniteBus.p.ii variable */)))) * ((data->simulationInfo->realParameter[97] /* infiniteBus.S_b PARAM */));
  TRACE_POP
}
/*
equation index: 197
type: SIMPLE_ASSIGN
infiniteBus.Q = (infiniteBus.p.vr * infiniteBus.p.ii - infiniteBus.p.vi * infiniteBus.p.ir) * infiniteBus.S_b
*/
void GenIO4HILinNetwork_eqFunction_197(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,197};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[43]] /* infiniteBus.Q variable */) = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[44]] /* infiniteBus.p.ii variable */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[45]] /* infiniteBus.p.ir variable */)))) * ((data->simulationInfo->realParameter[97] /* infiniteBus.S_b PARAM */));
  TRACE_POP
}
/*
equation index: 198
type: SIMPLE_ASSIGN
pwLine2.P21 = ((-infiniteBus.p.vr) * pwLine2.ir.re - infiniteBus.p.vi * pwLine2.ir.im) * pwLine2.S_b
*/
void GenIO4HILinNetwork_eqFunction_198(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,198};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[59]] /* pwLine2.P21 variable */) = (((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[63]] /* pwLine2.ir.re variable */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[62]] /* pwLine2.ir.im variable */)))) * ((data->simulationInfo->realParameter[120] /* pwLine2.S_b PARAM */));
  TRACE_POP
}
/*
equation index: 199
type: SIMPLE_ASSIGN
pwLine2.Q21 = (infiniteBus.p.vr * pwLine2.ir.im - infiniteBus.p.vi * pwLine2.ir.re) * pwLine2.S_b
*/
void GenIO4HILinNetwork_eqFunction_199(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,199};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[61]] /* pwLine2.Q21 variable */) = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[62]] /* pwLine2.ir.im variable */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[63]] /* pwLine2.ir.re variable */)))) * ((data->simulationInfo->realParameter[120] /* pwLine2.S_b PARAM */));
  TRACE_POP
}
/*
equation index: 200
type: SIMPLE_ASSIGN
pwLine2.P12 = (pwLine2.vs.re * pwLine2.is.re + pwLine2.vs.im * pwLine2.is.im) * pwLine2.S_b
*/
void GenIO4HILinNetwork_eqFunction_200(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,200};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[58]] /* pwLine2.P12 variable */) = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */)) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */))) * ((data->simulationInfo->realParameter[120] /* pwLine2.S_b PARAM */));
  TRACE_POP
}
/*
equation index: 201
type: SIMPLE_ASSIGN
pwLine2.Q12 = (pwLine2.vs.im * pwLine2.is.re - pwLine2.vs.re * pwLine2.is.im) * pwLine2.S_b
*/
void GenIO4HILinNetwork_eqFunction_201(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,201};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[60]] /* pwLine2.Q12 variable */) = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */)))) * ((data->simulationInfo->realParameter[120] /* pwLine2.S_b PARAM */));
  TRACE_POP
}
/*
equation index: 202
type: SIMPLE_ASSIGN
B2.angle = atan2(pwLine2.vs.im, pwLine2.vs.re)
*/
void GenIO4HILinNetwork_eqFunction_202(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,202};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[19]] /* B2.angle variable */) = atan2((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */), (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */));
  TRACE_POP
}
/*
equation index: 203
type: SIMPLE_ASSIGN
B2.angleDisplay = 57.29577951308232 * B2.angle
*/
void GenIO4HILinNetwork_eqFunction_203(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,203};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[20]] /* B2.angleDisplay variable */) = (57.29577951308232) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[19]] /* B2.angle variable */));
  TRACE_POP
}
/*
equation index: 204
type: SIMPLE_ASSIGN
transformer.P21 = ((-pwLine2.vs.re) * transformer.ir.re - pwLine2.vs.im * transformer.ir.im) * transformer.S_b
*/
void GenIO4HILinNetwork_eqFunction_204(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,204};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[69]] /* transformer.P21 variable */) = (((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[73]] /* transformer.ir.re variable */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[72]] /* transformer.ir.im variable */)))) * ((data->simulationInfo->realParameter[128] /* transformer.S_b PARAM */));
  TRACE_POP
}
/*
equation index: 205
type: SIMPLE_ASSIGN
transformer.Q21 = (pwLine2.vs.re * transformer.ir.im - pwLine2.vs.im * transformer.ir.re) * transformer.S_b
*/
void GenIO4HILinNetwork_eqFunction_205(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,205};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[71]] /* transformer.Q21 variable */) = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[72]] /* transformer.ir.im variable */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[73]] /* transformer.ir.re variable */)))) * ((data->simulationInfo->realParameter[128] /* transformer.S_b PARAM */));
  TRACE_POP
}
/*
equation index: 206
type: SIMPLE_ASSIGN
v = sqrt(transformer.vs.re ^ 2.0 + transformer.vs.im ^ 2.0)
*/
void GenIO4HILinNetwork_eqFunction_206(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,206};
  modelica_real tmp3;
  modelica_real tmp4;
  modelica_real tmp5;
  tmp3 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */);
  tmp4 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */);
  tmp5 = (tmp3 * tmp3) + (tmp4 * tmp4);
  if(!(tmp5 >= 0.0))
  {
    if (data->simulationInfo->noThrowAsserts) {
      FILE_INFO info = {"",0,0,0,0,0};
      infoStreamPrintWithEquationIndexes(OMC_LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f", initial() ? "during initialization " : "", data->localData[0]->timeValue);
      data->simulationInfo->needToReThrow = 1;
    } else {
      FILE_INFO info = {"",0,0,0,0,0};
      omc_assert_warning(info, "The following assertion has been violated %sat time %f", initial() ? "during initialization " : "", data->localData[0]->timeValue);
      throwStreamPrintWithEquationIndexes(threadData, info, equationIndexes, "Model error: Argument of sqrt(transformer.vs.re ^ 2.0 + transformer.vs.im ^ 2.0) was %g should be >= 0", tmp5);
    }
  }
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[78]] /* v variable */) = sqrt(tmp5);
  TRACE_POP
}
/*
equation index: 207
type: SIMPLE_ASSIGN
B1.v = v
*/
void GenIO4HILinNetwork_eqFunction_207(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,207};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[18]] /* B1.v variable */) = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[78]] /* v variable */);
  TRACE_POP
}
/*
equation index: 208
type: SIMPLE_ASSIGN
B1.angle = atan2(transformer.vs.im, transformer.vs.re)
*/
void GenIO4HILinNetwork_eqFunction_208(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,208};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[14]] /* B1.angle variable */) = atan2((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */), (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */));
  TRACE_POP
}
/*
equation index: 209
type: SIMPLE_ASSIGN
B1.angleDisplay = 57.29577951308232 * B1.angle
*/
void GenIO4HILinNetwork_eqFunction_209(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,209};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[15]] /* B1.angleDisplay variable */) = (57.29577951308232) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[14]] /* B1.angle variable */));
  TRACE_POP
}
/*
equation index: 210
type: SIMPLE_ASSIGN
G1.machine.anglev = B1.angle
*/
void GenIO4HILinNetwork_eqFunction_210(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,210};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[33]] /* G1.machine.anglev variable */) = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[14]] /* B1.angle variable */);
  TRACE_POP
}
/*
equation index: 211
type: SIMPLE_ASSIGN
$DER.G1.machine.e1q = ((1.0 - G1.machine.Taa / G1.machine.T1d0) * G1.machine.vf_MB + (G1.machine.T2d0 * G1.machine.x2d * (G1.machine.xd - G1.machine.x1d) / G1.machine.x1d / G1.machine.T1d0 + G1.machine.x1d - G1.machine.xd) * G1.machine.id - G1.machine.e1q) / G1.machine.T1d0
*/
void GenIO4HILinNetwork_eqFunction_211(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,211};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[8]] /* der(G1.machine.e1q) STATE_DER */) = DIVISION_SIM((1.0 - (DIVISION_SIM((data->simulationInfo->realParameter[50] /* G1.machine.Taa PARAM */),(data->simulationInfo->realParameter[46] /* G1.machine.T1d0 PARAM */),"G1.machine.T1d0",equationIndexes))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[38]] /* G1.machine.vf_MB variable */)) + (((data->simulationInfo->realParameter[48] /* G1.machine.T2d0 PARAM */)) * (DIVISION_SIM(((data->simulationInfo->realParameter[86] /* G1.machine.x2d PARAM */)) * (DIVISION_SIM((data->simulationInfo->realParameter[88] /* G1.machine.xd PARAM */) - (data->simulationInfo->realParameter[84] /* G1.machine.x1d PARAM */),(data->simulationInfo->realParameter[84] /* G1.machine.x1d PARAM */),"G1.machine.x1d",equationIndexes)),(data->simulationInfo->realParameter[46] /* G1.machine.T1d0 PARAM */),"G1.machine.T1d0",equationIndexes)) + (data->simulationInfo->realParameter[84] /* G1.machine.x1d PARAM */) - (data->simulationInfo->realParameter[88] /* G1.machine.xd PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */)) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[2]] /* G1.machine.e1q STATE(1) */),(data->simulationInfo->realParameter[46] /* G1.machine.T1d0 PARAM */),"G1.machine.T1d0",equationIndexes);
  TRACE_POP
}
/*
equation index: 212
type: SIMPLE_ASSIGN
$DER.G1.machine.e2q = (G1.machine.e1q + (G1.machine.x2d - G1.machine.T2d0 * G1.machine.x2d * (G1.machine.xd - G1.machine.x1d) / G1.machine.x1d / G1.machine.T1d0 - G1.machine.x1d) * G1.machine.id + G1.machine.Taa * G1.machine.vf_MB / G1.machine.T1d0 - G1.machine.e2q) / G1.machine.T2d0
*/
void GenIO4HILinNetwork_eqFunction_212(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,212};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[10]] /* der(G1.machine.e2q) STATE_DER */) = DIVISION_SIM((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[2]] /* G1.machine.e1q STATE(1) */) + ((data->simulationInfo->realParameter[86] /* G1.machine.x2d PARAM */) - (((data->simulationInfo->realParameter[48] /* G1.machine.T2d0 PARAM */)) * (DIVISION_SIM(((data->simulationInfo->realParameter[86] /* G1.machine.x2d PARAM */)) * (DIVISION_SIM((data->simulationInfo->realParameter[88] /* G1.machine.xd PARAM */) - (data->simulationInfo->realParameter[84] /* G1.machine.x1d PARAM */),(data->simulationInfo->realParameter[84] /* G1.machine.x1d PARAM */),"G1.machine.x1d",equationIndexes)),(data->simulationInfo->realParameter[46] /* G1.machine.T1d0 PARAM */),"G1.machine.T1d0",equationIndexes))) - (data->simulationInfo->realParameter[84] /* G1.machine.x1d PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */)) + ((data->simulationInfo->realParameter[50] /* G1.machine.Taa PARAM */)) * (DIVISION_SIM((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[38]] /* G1.machine.vf_MB variable */),(data->simulationInfo->realParameter[46] /* G1.machine.T1d0 PARAM */),"G1.machine.T1d0",equationIndexes)) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[4]] /* G1.machine.e2q STATE(1) */),(data->simulationInfo->realParameter[48] /* G1.machine.T2d0 PARAM */),"G1.machine.T2d0",equationIndexes);
  TRACE_POP
}
/*
equation index: 213
type: SIMPLE_ASSIGN
$DER.G1.machine.e1d = ((G1.machine.xq + (-G1.machine.x1q) - G1.machine.T2q0 * G1.machine.x2q * (G1.machine.xq - G1.machine.x1q) / G1.machine.x1q / G1.machine.T1q0) * G1.machine.iq - G1.machine.e1d) / G1.machine.T1q0
*/
void GenIO4HILinNetwork_eqFunction_213(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,213};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[7]] /* der(G1.machine.e1d) STATE_DER */) = DIVISION_SIM(((data->simulationInfo->realParameter[89] /* G1.machine.xq PARAM */) + (-(data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */)) - (((data->simulationInfo->realParameter[49] /* G1.machine.T2q0 PARAM */)) * (DIVISION_SIM(((data->simulationInfo->realParameter[87] /* G1.machine.x2q PARAM */)) * (DIVISION_SIM((data->simulationInfo->realParameter[89] /* G1.machine.xq PARAM */) - (data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */),(data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */),"G1.machine.x1q",equationIndexes)),(data->simulationInfo->realParameter[47] /* G1.machine.T1q0 PARAM */),"G1.machine.T1q0",equationIndexes)))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */)) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[1]] /* G1.machine.e1d STATE(1) */),(data->simulationInfo->realParameter[47] /* G1.machine.T1q0 PARAM */),"G1.machine.T1q0",equationIndexes);
  TRACE_POP
}
/*
equation index: 214
type: SIMPLE_ASSIGN
$DER.G1.machine.e2d = (G1.machine.e1d + (G1.machine.x1q + G1.machine.T2q0 * G1.machine.x2q * (G1.machine.xq - G1.machine.x1q) / G1.machine.x1q / G1.machine.T1q0 - G1.machine.x2q) * G1.machine.iq - G1.machine.e2d) / G1.machine.T2q0
*/
void GenIO4HILinNetwork_eqFunction_214(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,214};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[9]] /* der(G1.machine.e2d) STATE_DER */) = DIVISION_SIM((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[1]] /* G1.machine.e1d STATE(1) */) + ((data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */) + ((data->simulationInfo->realParameter[49] /* G1.machine.T2q0 PARAM */)) * (DIVISION_SIM(((data->simulationInfo->realParameter[87] /* G1.machine.x2q PARAM */)) * (DIVISION_SIM((data->simulationInfo->realParameter[89] /* G1.machine.xq PARAM */) - (data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */),(data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */),"G1.machine.x1q",equationIndexes)),(data->simulationInfo->realParameter[47] /* G1.machine.T1q0 PARAM */),"G1.machine.T1q0",equationIndexes)) - (data->simulationInfo->realParameter[87] /* G1.machine.x2q PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */)) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[3]] /* G1.machine.e2d STATE(1) */),(data->simulationInfo->realParameter[49] /* G1.machine.T2q0 PARAM */),"G1.machine.T2q0",equationIndexes);
  TRACE_POP
}
/*
equation index: 215
type: SIMPLE_ASSIGN
G1.machine.pe = (G1.machine.vq + G1.machine.ra * G1.machine.iq) * G1.machine.iq + (G1.machine.vd + G1.machine.ra * G1.machine.id) * G1.machine.id
*/
void GenIO4HILinNetwork_eqFunction_215(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,215};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[36]] /* G1.machine.pe variable */) = ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[39]] /* G1.machine.vq variable */) + ((data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */)) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[37]] /* G1.machine.vd variable */) + ((data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */));
  TRACE_POP
}
/*
equation index: 216
type: SIMPLE_ASSIGN
$DER.G1.machine.w = (G1.machine.pm00 * G1.machine.S_SBtoMB - G1.machine.pe) / G1.machine.M
*/
void GenIO4HILinNetwork_eqFunction_216(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,216};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[11]] /* der(G1.machine.w) STATE_DER */) = DIVISION_SIM(((data->simulationInfo->realParameter[73] /* G1.machine.pm00 PARAM */)) * ((data->simulationInfo->realParameter[43] /* G1.machine.S_SBtoMB PARAM */)) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[36]] /* G1.machine.pe variable */),(data->simulationInfo->realParameter[38] /* G1.machine.M PARAM */),"G1.machine.M",equationIndexes);
  TRACE_POP
}
/*
equation index: 217
type: SIMPLE_ASSIGN
Pgen = transformer.vs.re * transformer.is.re + transformer.vs.im * transformer.is.im
*/
void GenIO4HILinNetwork_eqFunction_217(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,217};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[40]] /* Pgen variable */) = ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[75]] /* transformer.is.re variable */)) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[74]] /* transformer.is.im variable */));
  TRACE_POP
}
/*
equation index: 218
type: SIMPLE_ASSIGN
Qgen = transformer.vs.im * transformer.is.re - transformer.vs.re * transformer.is.im
*/
void GenIO4HILinNetwork_eqFunction_218(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,218};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[41]] /* Qgen variable */) = ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[75]] /* transformer.is.re variable */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[74]] /* transformer.is.im variable */)));
  TRACE_POP
}
/*
equation index: 219
type: SIMPLE_ASSIGN
G1.P = (transformer.vs.im * transformer.is.im + transformer.vs.re * transformer.is.re) * G1.S_b
*/
void GenIO4HILinNetwork_eqFunction_219(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,219};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[29]] /* G1.P variable */) = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[74]] /* transformer.is.im variable */)) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[75]] /* transformer.is.re variable */))) * ((data->simulationInfo->realParameter[24] /* G1.S_b PARAM */));
  TRACE_POP
}
/*
equation index: 220
type: SIMPLE_ASSIGN
G1.Q = (transformer.vs.im * transformer.is.re - transformer.vs.re * transformer.is.im) * G1.S_b
*/
void GenIO4HILinNetwork_eqFunction_220(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,220};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[30]] /* G1.Q variable */) = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[75]] /* transformer.is.re variable */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[74]] /* transformer.is.im variable */)))) * ((data->simulationInfo->realParameter[24] /* G1.S_b PARAM */));
  TRACE_POP
}
/*
equation index: 221
type: SIMPLE_ASSIGN
transformer.P12 = (transformer.vs.re * transformer.is.re + transformer.vs.im * transformer.is.im) * transformer.S_b
*/
void GenIO4HILinNetwork_eqFunction_221(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,221};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[68]] /* transformer.P12 variable */) = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[75]] /* transformer.is.re variable */)) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[74]] /* transformer.is.im variable */))) * ((data->simulationInfo->realParameter[128] /* transformer.S_b PARAM */));
  TRACE_POP
}
/*
equation index: 222
type: SIMPLE_ASSIGN
transformer.Q12 = (transformer.vs.im * transformer.is.re - transformer.vs.re * transformer.is.im) * transformer.S_b
*/
void GenIO4HILinNetwork_eqFunction_222(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,222};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[70]] /* transformer.Q12 variable */) = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[75]] /* transformer.is.re variable */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[74]] /* transformer.is.im variable */)))) * ((data->simulationInfo->realParameter[128] /* transformer.S_b PARAM */));
  TRACE_POP
}

OMC_DISABLE_OPT
int GenIO4HILinNetwork_functionDAE(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  int equationIndexes[1] = {0};
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_DAE);
#endif

  data->simulationInfo->needToIterate = 0;
  data->simulationInfo->discreteCall = 1;
  GenIO4HILinNetwork_functionLocalKnownVars(data, threadData);
  GenIO4HILinNetwork_eqFunction_143(data, threadData);

  GenIO4HILinNetwork_eqFunction_144(data, threadData);

  GenIO4HILinNetwork_eqFunction_145(data, threadData);

  GenIO4HILinNetwork_eqFunction_146(data, threadData);

  GenIO4HILinNetwork_eqFunction_147(data, threadData);

  GenIO4HILinNetwork_eqFunction_148(data, threadData);

  GenIO4HILinNetwork_eqFunction_149(data, threadData);

  GenIO4HILinNetwork_eqFunction_186(data, threadData);

  GenIO4HILinNetwork_eqFunction_187(data, threadData);

  GenIO4HILinNetwork_eqFunction_188(data, threadData);

  GenIO4HILinNetwork_eqFunction_189(data, threadData);

  GenIO4HILinNetwork_eqFunction_190(data, threadData);

  GenIO4HILinNetwork_eqFunction_191(data, threadData);

  GenIO4HILinNetwork_eqFunction_192(data, threadData);

  GenIO4HILinNetwork_eqFunction_193(data, threadData);

  GenIO4HILinNetwork_eqFunction_194(data, threadData);

  GenIO4HILinNetwork_eqFunction_195(data, threadData);

  GenIO4HILinNetwork_eqFunction_196(data, threadData);

  GenIO4HILinNetwork_eqFunction_197(data, threadData);

  GenIO4HILinNetwork_eqFunction_198(data, threadData);

  GenIO4HILinNetwork_eqFunction_199(data, threadData);

  GenIO4HILinNetwork_eqFunction_200(data, threadData);

  GenIO4HILinNetwork_eqFunction_201(data, threadData);

  GenIO4HILinNetwork_eqFunction_202(data, threadData);

  GenIO4HILinNetwork_eqFunction_203(data, threadData);

  GenIO4HILinNetwork_eqFunction_204(data, threadData);

  GenIO4HILinNetwork_eqFunction_205(data, threadData);

  GenIO4HILinNetwork_eqFunction_206(data, threadData);

  GenIO4HILinNetwork_eqFunction_207(data, threadData);

  GenIO4HILinNetwork_eqFunction_208(data, threadData);

  GenIO4HILinNetwork_eqFunction_209(data, threadData);

  GenIO4HILinNetwork_eqFunction_210(data, threadData);

  GenIO4HILinNetwork_eqFunction_211(data, threadData);

  GenIO4HILinNetwork_eqFunction_212(data, threadData);

  GenIO4HILinNetwork_eqFunction_213(data, threadData);

  GenIO4HILinNetwork_eqFunction_214(data, threadData);

  GenIO4HILinNetwork_eqFunction_215(data, threadData);

  GenIO4HILinNetwork_eqFunction_216(data, threadData);

  GenIO4HILinNetwork_eqFunction_217(data, threadData);

  GenIO4HILinNetwork_eqFunction_218(data, threadData);

  GenIO4HILinNetwork_eqFunction_219(data, threadData);

  GenIO4HILinNetwork_eqFunction_220(data, threadData);

  GenIO4HILinNetwork_eqFunction_221(data, threadData);

  GenIO4HILinNetwork_eqFunction_222(data, threadData);
  data->simulationInfo->discreteCall = 0;
  
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_DAE);
#endif
  TRACE_POP
  return 0;
}


int GenIO4HILinNetwork_functionLocalKnownVars(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

/* forwarded equations */
extern void GenIO4HILinNetwork_eqFunction_143(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_144(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_145(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_148(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_149(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_186(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_211(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_212(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_213(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_214(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_215(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_216(DATA* data, threadData_t *threadData);

static void functionODE_system0(DATA *data, threadData_t *threadData)
{
  int id;

  static void (*const eqFunctions[12])(DATA*, threadData_t*) = {
    GenIO4HILinNetwork_eqFunction_143,
    GenIO4HILinNetwork_eqFunction_144,
    GenIO4HILinNetwork_eqFunction_145,
    GenIO4HILinNetwork_eqFunction_148,
    GenIO4HILinNetwork_eqFunction_149,
    GenIO4HILinNetwork_eqFunction_186,
    GenIO4HILinNetwork_eqFunction_211,
    GenIO4HILinNetwork_eqFunction_212,
    GenIO4HILinNetwork_eqFunction_213,
    GenIO4HILinNetwork_eqFunction_214,
    GenIO4HILinNetwork_eqFunction_215,
    GenIO4HILinNetwork_eqFunction_216
  };
  
  static const int eqIndices[12] = {
    143,
    144,
    145,
    148,
    149,
    186,
    211,
    212,
    213,
    214,
    215,
    216
  };
  
  for (id = 0; id < 12; id++) {
    eqFunctions[id](data, threadData);
    threadData->lastEquationSolved = eqIndices[id];
  }
}

int GenIO4HILinNetwork_functionODE(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_FUNCTION_ODE);
#endif

  
  data->simulationInfo->callStatistics.functionODE++;
  
  GenIO4HILinNetwork_functionLocalKnownVars(data, threadData);
  functionODE_system0(data, threadData);

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_FUNCTION_ODE);
#endif

  TRACE_POP
  return 0;
}

void GenIO4HILinNetwork_computeVarIndices(size_t* realIndex, size_t* integerIndex, size_t* booleanIndex, size_t* stringIndex)
{
  TRACE_PUSH

  size_t i_real = 0;
  size_t i_integer = 0;
  size_t i_boolean = 0;
  size_t i_string = 0;

  realIndex[0] = 0;
  integerIndex[0] = 0;
  booleanIndex[0] = 0;
  stringIndex[0] = 0;

  /* stateVars */
  realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.machine.delta STATE(1) */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.machine.e1d STATE(1) */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.machine.e1q STATE(1) */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.machine.e2d STATE(1) */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.machine.e2q STATE(1) */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.machine.w STATE(1) */
  
  /* derivativeVars */
  realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* der(G1.machine.delta) STATE_DER */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* der(G1.machine.e1d) STATE_DER */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* der(G1.machine.e1q) STATE_DER */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* der(G1.machine.e2d) STATE_DER */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* der(G1.machine.e2q) STATE_DER */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* der(G1.machine.w) STATE_DER */
  
  /* algVars */
  realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* $cse3 variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* $cse4 variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* B1.angle variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* B1.angleDisplay variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* B1.p.ii variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* B1.p.ir variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* B1.v variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* B2.angle variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* B2.angleDisplay variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* B2.p.ii variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* B2.p.ir variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* B2.v variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* B3.angle variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* B3.angleDisplay variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* B3.p.ii variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* B3.p.ir variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* B3.v variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.P variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.Q variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.feedbackVf0.y variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.gainVf0.y variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.machine.anglev variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.machine.id variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.machine.iq variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.machine.pe variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.machine.vd variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.machine.vf_MB variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* G1.machine.vq variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* Pgen variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* Qgen variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* infiniteBus.P variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* infiniteBus.Q variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* infiniteBus.p.ii variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* infiniteBus.p.ir variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* infiniteBus.p.vi variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* infiniteBus.p.vr variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwFault.p.ii variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwFault.p.ir variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine1.P12 variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine1.P21 variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine1.Q12 variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine1.Q21 variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine1.ir.im variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine1.ir.re variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine1.is.im variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine1.is.re variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine2.P12 variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine2.P21 variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine2.Q12 variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine2.Q21 variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine2.ir.im variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine2.ir.re variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine2.is.im variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine2.is.re variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine2.vs.im variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* pwLine2.vs.re variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* transformer.P12 variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* transformer.P21 variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* transformer.Q12 variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* transformer.Q21 variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* transformer.ir.im variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* transformer.ir.re variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* transformer.is.im variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* transformer.is.re variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* transformer.vs.im variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* transformer.vs.re variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* v variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* vf variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* vf0OUT variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* w variable */
  
  /* discreteAlgVars */
  
  /* realOptimizeConstraintsVars */
  
  /* realOptimizeFinalConstraintsVars */
  
  
  /* intAlgVars */
  
  /* boolAlgVars */
  
  /* stringAlgVars */
  
  TRACE_POP
}

/* forward the main in the simulation runtime */
extern int _main_SimulationRuntime(int argc, char**argv, DATA *data, threadData_t *threadData);

#include "GenIO4HILinNetwork_12jac.h"
#include "GenIO4HILinNetwork_13opt.h"

struct OpenModelicaGeneratedFunctionCallbacks GenIO4HILinNetwork_callback = {
   NULL,    /* performSimulation */
   NULL,    /* performQSSSimulation */
   NULL,    /* updateContinuousSystem */
   GenIO4HILinNetwork_callExternalObjectDestructors,    /* callExternalObjectDestructors */
   NULL,    /* initialNonLinearSystem */
   GenIO4HILinNetwork_initialLinearSystem,    /* initialLinearSystem */
   NULL,    /* initialMixedSystem */
   #if !defined(OMC_NO_STATESELECTION)
   GenIO4HILinNetwork_initializeStateSets,
   #else
   NULL,
   #endif    /* initializeStateSets */
   GenIO4HILinNetwork_initializeDAEmodeData,
   GenIO4HILinNetwork_computeVarIndices,
   GenIO4HILinNetwork_functionODE,
   GenIO4HILinNetwork_functionAlgebraics,
   GenIO4HILinNetwork_functionDAE,
   GenIO4HILinNetwork_functionLocalKnownVars,
   GenIO4HILinNetwork_input_function,
   GenIO4HILinNetwork_input_function_init,
   GenIO4HILinNetwork_input_function_updateStartValues,
   GenIO4HILinNetwork_data_function,
   GenIO4HILinNetwork_output_function,
   GenIO4HILinNetwork_setc_function,
   GenIO4HILinNetwork_setb_function,
   GenIO4HILinNetwork_function_storeDelayed,
   GenIO4HILinNetwork_function_storeSpatialDistribution,
   GenIO4HILinNetwork_function_initSpatialDistribution,
   GenIO4HILinNetwork_updateBoundVariableAttributes,
   GenIO4HILinNetwork_functionInitialEquations,
   1, /* useHomotopy - 0: local homotopy (equidistant lambda), 1: global homotopy (equidistant lambda), 2: new global homotopy approach (adaptive lambda), 3: new local homotopy approach (adaptive lambda)*/
   NULL,
   GenIO4HILinNetwork_functionRemovedInitialEquations,
   GenIO4HILinNetwork_updateBoundParameters,
   GenIO4HILinNetwork_checkForAsserts,
   GenIO4HILinNetwork_function_ZeroCrossingsEquations,
   GenIO4HILinNetwork_function_ZeroCrossings,
   GenIO4HILinNetwork_function_updateRelations,
   GenIO4HILinNetwork_zeroCrossingDescription,
   GenIO4HILinNetwork_relationDescription,
   GenIO4HILinNetwork_function_initSample,
   GenIO4HILinNetwork_INDEX_JAC_A,
   GenIO4HILinNetwork_INDEX_JAC_B,
   GenIO4HILinNetwork_INDEX_JAC_C,
   GenIO4HILinNetwork_INDEX_JAC_D,
   GenIO4HILinNetwork_INDEX_JAC_F,
   GenIO4HILinNetwork_INDEX_JAC_H,
   GenIO4HILinNetwork_initialAnalyticJacobianA,
   GenIO4HILinNetwork_initialAnalyticJacobianB,
   GenIO4HILinNetwork_initialAnalyticJacobianC,
   GenIO4HILinNetwork_initialAnalyticJacobianD,
   GenIO4HILinNetwork_initialAnalyticJacobianF,
   GenIO4HILinNetwork_initialAnalyticJacobianH,
   GenIO4HILinNetwork_functionJacA_column,
   GenIO4HILinNetwork_functionJacB_column,
   GenIO4HILinNetwork_functionJacC_column,
   GenIO4HILinNetwork_functionJacD_column,
   GenIO4HILinNetwork_functionJacF_column,
   GenIO4HILinNetwork_functionJacH_column,
   GenIO4HILinNetwork_linear_model_frame,
   GenIO4HILinNetwork_linear_model_datarecovery_frame,
   GenIO4HILinNetwork_mayer,
   GenIO4HILinNetwork_lagrange,
   GenIO4HILinNetwork_pickUpBoundsForInputsInOptimization,
   GenIO4HILinNetwork_setInputData,
   GenIO4HILinNetwork_getTimeGrid,
   GenIO4HILinNetwork_symbolicInlineSystem,
   GenIO4HILinNetwork_function_initSynchronous,
   GenIO4HILinNetwork_function_updateSynchronous,
   GenIO4HILinNetwork_function_equationsSynchronous,
   GenIO4HILinNetwork_inputNames,
   GenIO4HILinNetwork_dataReconciliationInputNames,
   GenIO4HILinNetwork_dataReconciliationUnmeasuredVariables,
   GenIO4HILinNetwork_read_simulation_info,
   GenIO4HILinNetwork_read_input_fmu,
   NULL,
   NULL,
   -1,
   NULL,
   NULL,
   -1

};

#define _OMC_LIT_RESOURCE_0_name_data "Complex"
#define _OMC_LIT_RESOURCE_0_dir_data "C:/Users/Luigi/AppData/Roaming/.openmodelica/libraries/Complex 4.0.0+maint.om"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_0_name,7,_OMC_LIT_RESOURCE_0_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_0_dir,77,_OMC_LIT_RESOURCE_0_dir_data);

#define _OMC_LIT_RESOURCE_1_name_data "Modelica"
#define _OMC_LIT_RESOURCE_1_dir_data "C:/Users/Luigi/AppData/Roaming/.openmodelica/libraries/Modelica 4.0.0+maint.om"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_1_name,8,_OMC_LIT_RESOURCE_1_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_1_dir,78,_OMC_LIT_RESOURCE_1_dir_data);

#define _OMC_LIT_RESOURCE_2_name_data "ModelicaServices"
#define _OMC_LIT_RESOURCE_2_dir_data "C:/Users/Luigi/AppData/Roaming/.openmodelica/libraries/ModelicaServices 4.0.0+maint.om"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_2_name,16,_OMC_LIT_RESOURCE_2_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_2_dir,86,_OMC_LIT_RESOURCE_2_dir_data);

#define _OMC_LIT_RESOURCE_3_name_data "OpenIPSL"
#define _OMC_LIT_RESOURCE_3_dir_data "C:/Users/Luigi/AppData/Roaming/.openmodelica/libraries/OpenIPSL 3.0.1"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_3_name,8,_OMC_LIT_RESOURCE_3_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_3_dir,69,_OMC_LIT_RESOURCE_3_dir_data);

#define _OMC_LIT_RESOURCE_4_name_data "PSSDesign"
#define _OMC_LIT_RESOURCE_4_dir_data "C:/Users/Luigi/Documents/Github/efmi-pss-use-case/Modelica/PSSDesign"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_4_name,9,_OMC_LIT_RESOURCE_4_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_4_dir,68,_OMC_LIT_RESOURCE_4_dir_data);

static const MMC_DEFSTRUCTLIT(_OMC_LIT_RESOURCES,10,MMC_ARRAY_TAG) {MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_0_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_0_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_1_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_1_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_2_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_2_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_3_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_3_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_4_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_4_dir)}};
void GenIO4HILinNetwork_setupDataStruc(DATA *data, threadData_t *threadData)
{
  assertStreamPrint(threadData,0!=data, "Error while initialize Data");
  threadData->localRoots[LOCAL_ROOT_SIMULATION_DATA] = data;
  data->callback = &GenIO4HILinNetwork_callback;
  OpenModelica_updateUriMapping(threadData, MMC_REFSTRUCTLIT(_OMC_LIT_RESOURCES));
  data->modelData->modelName = "PSSDesign.FMUs4RTHIL.GenIO4HILinNetwork";
  data->modelData->modelFilePrefix = "GenIO4HILinNetwork";
  data->modelData->resultFileName = NULL;
  data->modelData->modelDir = "C:/Users/Luigi/Documents/Github/efmi-pss-use-case/Modelica/PSSDesign/FMUs4RTHIL";
  data->modelData->modelGUID = "{6cd37720-5980-4da2-a322-84951152fed5}";
  data->modelData->initXMLData = NULL;
  data->modelData->modelDataXml.infoXMLData = NULL;
  GC_asprintf(&data->modelData->modelDataXml.fileName, "%s/GenIO4HILinNetwork_info.json", data->modelData->resourcesDir);
  data->modelData->runTestsuite = 0;
  data->modelData->nStates = 6;
  data->modelData->nVariablesRealArray = 82;
  data->modelData->nDiscreteReal = 0;
  data->modelData->nVariablesIntegerArray = 0;
  data->modelData->nVariablesBooleanArray = 0;
  data->modelData->nVariablesStringArray = 0;
  data->modelData->nParametersReal = 139;
  data->modelData->nParametersInteger = 2;
  data->modelData->nParametersBoolean = 59;
  data->modelData->nParametersString = 0;
  data->modelData->nInputVars = 1;
  data->modelData->nOutputVars = 5;
  data->modelData->nAliasReal = 64;
  data->modelData->nAliasInteger = 0;
  data->modelData->nAliasBoolean = 0;
  data->modelData->nAliasString = 0;
  data->modelData->nZeroCrossings = 9;
  data->modelData->nSamples = 0;
  data->modelData->nRelations = 6;
  data->modelData->nMathEvents = 0;
  data->modelData->nExtObjs = 0;
  data->modelData->modelDataXml.modelInfoXmlLength = 0;
  data->modelData->modelDataXml.nFunctions = 2;
  data->modelData->modelDataXml.nProfileBlocks = 0;
  data->modelData->modelDataXml.nEquations = 341;
  data->modelData->nMixedSystems = 0;
  data->modelData->nLinearSystems = 6;
  data->modelData->nNonLinearSystems = 0;
  data->modelData->nStateSets = 0;
  data->modelData->nJacobians = 8;
  data->modelData->nOptimizeConstraints = 0;
  data->modelData->nOptimizeFinalConstraints = 0;
  data->modelData->nDelayExpressions = 0;
  data->modelData->nBaseClocks = 0;
  data->modelData->nSpatialDistributions = 0;
  data->modelData->nSensitivityVars = 0;
  data->modelData->nSensitivityParamVars = 0;
  data->modelData->nSetcVars = 0;
  data->modelData->ndataReconVars = 0;
  data->modelData->nSetbVars = 0;
  data->modelData->nRelatedBoundaryConditions = 0;
  data->modelData->linearizationDumpLanguage = OMC_LINEARIZE_DUMP_LANGUAGE_MODELICA;
}

static int rml_execution_failed()
{
  fflush(NULL);
  fprintf(stderr, "Execution failed!\n");
  fflush(NULL);
  return 1;
}

