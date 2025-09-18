/* update bound parameters and variable attributes (start, nominal, min, max) */
#include "GenIO4HILinNetwork_model.h"
#if defined(__cplusplus)
extern "C" {
#endif


/*
equation index: 223
type: SIMPLE_ASSIGN
$START.v = B1.v_0
*/
static void GenIO4HILinNetwork_eqFunction_223(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,223};
  (data->modelData->realVarsData[78] /* v variable */).attribute .start = (data->simulationInfo->realParameter[7] /* B1.v_0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[78]] /* v variable */) = (data->modelData->realVarsData[78] /* v variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[78].info /* v */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[78]] /* v variable */));
  TRACE_POP
}

/*
equation index: 224
type: SIMPLE_ASSIGN
$START.Qgen = G1.machine.q0
*/
static void GenIO4HILinNetwork_eqFunction_224(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,224};
  (data->modelData->realVarsData[41] /* Qgen variable */).attribute .start = (data->simulationInfo->realParameter[74] /* G1.machine.q0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[41]] /* Qgen variable */) = (data->modelData->realVarsData[41] /* Qgen variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[41].info /* Qgen */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[41]] /* Qgen variable */));
  TRACE_POP
}

/*
equation index: 225
type: SIMPLE_ASSIGN
$START.Pgen = G1.machine.p0
*/
static void GenIO4HILinNetwork_eqFunction_225(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,225};
  (data->modelData->realVarsData[40] /* Pgen variable */).attribute .start = (data->simulationInfo->realParameter[70] /* G1.machine.p0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[40]] /* Pgen variable */) = (data->modelData->realVarsData[40] /* Pgen variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[40].info /* Pgen */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[40]] /* Pgen variable */));
  TRACE_POP
}

/*
equation index: 226
type: SIMPLE_ASSIGN
$START.pwLine2.vs.im = B2.v_0 * sin(B2.angle_0)
*/
static void GenIO4HILinNetwork_eqFunction_226(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,226};
  (data->modelData->realVarsData[66] /* pwLine2.vs.im variable */).attribute .start = ((data->simulationInfo->realParameter[14] /* B2.v_0 PARAM */)) * (sin((data->simulationInfo->realParameter[12] /* B2.angle_0 PARAM */)));
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */) = (data->modelData->realVarsData[66] /* pwLine2.vs.im variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[66].info /* pwLine2.vs.im */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */));
  TRACE_POP
}

/*
equation index: 227
type: SIMPLE_ASSIGN
$START.pwLine2.vs.re = B2.v_0 * cos(B2.angle_0)
*/
static void GenIO4HILinNetwork_eqFunction_227(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,227};
  (data->modelData->realVarsData[67] /* pwLine2.vs.re variable */).attribute .start = ((data->simulationInfo->realParameter[14] /* B2.v_0 PARAM */)) * (cos((data->simulationInfo->realParameter[12] /* B2.angle_0 PARAM */)));
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) = (data->modelData->realVarsData[67] /* pwLine2.vs.re variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[67].info /* pwLine2.vs.re */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */));
  TRACE_POP
}

/*
equation index: 228
type: SIMPLE_ASSIGN
$START.transformer.vs.im = B1.v_0 * sin(B1.angle_0)
*/
static void GenIO4HILinNetwork_eqFunction_228(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,228};
  (data->modelData->realVarsData[76] /* transformer.vs.im variable */).attribute .start = ((data->simulationInfo->realParameter[7] /* B1.v_0 PARAM */)) * (sin((data->simulationInfo->realParameter[5] /* B1.angle_0 PARAM */)));
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */) = (data->modelData->realVarsData[76] /* transformer.vs.im variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[76].info /* transformer.vs.im */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */));
  TRACE_POP
}

/*
equation index: 229
type: SIMPLE_ASSIGN
$START.transformer.vs.re = B1.v_0 * cos(B1.angle_0)
*/
static void GenIO4HILinNetwork_eqFunction_229(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,229};
  (data->modelData->realVarsData[77] /* transformer.vs.re variable */).attribute .start = ((data->simulationInfo->realParameter[7] /* B1.v_0 PARAM */)) * (cos((data->simulationInfo->realParameter[5] /* B1.angle_0 PARAM */)));
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */) = (data->modelData->realVarsData[77] /* transformer.vs.re variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[77].info /* transformer.vs.re */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */));
  TRACE_POP
}

/*
equation index: 230
type: SIMPLE_ASSIGN
$START.B2.angle = B2.angle_0
*/
static void GenIO4HILinNetwork_eqFunction_230(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,230};
  (data->modelData->realVarsData[19] /* B2.angle variable */).attribute .start = (data->simulationInfo->realParameter[12] /* B2.angle_0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[19]] /* B2.angle variable */) = (data->modelData->realVarsData[19] /* B2.angle variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[19].info /* B2.angle */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[19]] /* B2.angle variable */));
  TRACE_POP
}

/*
equation index: 231
type: SIMPLE_ASSIGN
$START.B2.v = B2.v_0
*/
static void GenIO4HILinNetwork_eqFunction_231(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,231};
  (data->modelData->realVarsData[23] /* B2.v variable */).attribute .start = (data->simulationInfo->realParameter[14] /* B2.v_0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[23]] /* B2.v variable */) = (data->modelData->realVarsData[23] /* B2.v variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[23].info /* B2.v */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[23]] /* B2.v variable */));
  TRACE_POP
}

/*
equation index: 232
type: SIMPLE_ASSIGN
$START.B1.angle = B1.angle_0
*/
static void GenIO4HILinNetwork_eqFunction_232(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,232};
  (data->modelData->realVarsData[14] /* B1.angle variable */).attribute .start = (data->simulationInfo->realParameter[5] /* B1.angle_0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[14]] /* B1.angle variable */) = (data->modelData->realVarsData[14] /* B1.angle variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[14].info /* B1.angle */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[14]] /* B1.angle variable */));
  TRACE_POP
}

/*
equation index: 233
type: SIMPLE_ASSIGN
$START.B1.v = B1.v_0
*/
static void GenIO4HILinNetwork_eqFunction_233(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,233};
  (data->modelData->realVarsData[18] /* B1.v variable */).attribute .start = (data->simulationInfo->realParameter[7] /* B1.v_0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[18]] /* B1.v variable */) = (data->modelData->realVarsData[18] /* B1.v variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[18].info /* B1.v */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[18]] /* B1.v variable */));
  TRACE_POP
}

/*
equation index: 234
type: SIMPLE_ASSIGN
$START.G1.machine.anglev = G1.machine.angle_0
*/
static void GenIO4HILinNetwork_eqFunction_234(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,234};
  (data->modelData->realVarsData[33] /* G1.machine.anglev variable */).attribute .start = (data->simulationInfo->realParameter[59] /* G1.machine.angle_0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[33]] /* G1.machine.anglev variable */) = (data->modelData->realVarsData[33] /* G1.machine.anglev variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[33].info /* G1.machine.anglev */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[33]] /* G1.machine.anglev variable */));
  TRACE_POP
}
OMC_DISABLE_OPT
int GenIO4HILinNetwork_updateBoundVariableAttributes(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  /* min ******************************************************** */
  infoStreamPrint(OMC_LOG_INIT, 1, "updating min-values");
  if (OMC_ACTIVE_STREAM(OMC_LOG_INIT)) messageClose(OMC_LOG_INIT);
  
  /* max ******************************************************** */
  infoStreamPrint(OMC_LOG_INIT, 1, "updating max-values");
  if (OMC_ACTIVE_STREAM(OMC_LOG_INIT)) messageClose(OMC_LOG_INIT);
  
  /* nominal **************************************************** */
  infoStreamPrint(OMC_LOG_INIT, 1, "updating nominal-values");
  if (OMC_ACTIVE_STREAM(OMC_LOG_INIT)) messageClose(OMC_LOG_INIT);
  
  /* start ****************************************************** */
  infoStreamPrint(OMC_LOG_INIT, 1, "updating primary start-values");
  GenIO4HILinNetwork_eqFunction_223(data, threadData);

  GenIO4HILinNetwork_eqFunction_224(data, threadData);

  GenIO4HILinNetwork_eqFunction_225(data, threadData);

  GenIO4HILinNetwork_eqFunction_226(data, threadData);

  GenIO4HILinNetwork_eqFunction_227(data, threadData);

  GenIO4HILinNetwork_eqFunction_228(data, threadData);

  GenIO4HILinNetwork_eqFunction_229(data, threadData);

  GenIO4HILinNetwork_eqFunction_230(data, threadData);

  GenIO4HILinNetwork_eqFunction_231(data, threadData);

  GenIO4HILinNetwork_eqFunction_232(data, threadData);

  GenIO4HILinNetwork_eqFunction_233(data, threadData);

  GenIO4HILinNetwork_eqFunction_234(data, threadData);
  if (OMC_ACTIVE_STREAM(OMC_LOG_INIT)) messageClose(OMC_LOG_INIT);
  
  TRACE_POP
  return 0;
}

void GenIO4HILinNetwork_updateBoundParameters_0(DATA *data, threadData_t *threadData);

/*
equation index: 235
type: SIMPLE_ASSIGN
G1.machine.S_b = SysData.S_b
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_235(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,235};
  (data->simulationInfo->realParameter[44] /* G1.machine.S_b PARAM */) = (data->simulationInfo->realParameter[93] /* SysData.S_b PARAM */);
  TRACE_POP
}

/*
equation index: 236
type: SIMPLE_ASSIGN
G1.machine.S_SBtoMB = G1.machine.S_b / G1.machine.Sn
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_236(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,236};
  (data->simulationInfo->realParameter[43] /* G1.machine.S_SBtoMB PARAM */) = DIVISION_SIM((data->simulationInfo->realParameter[44] /* G1.machine.S_b PARAM */),(data->simulationInfo->realParameter[45] /* G1.machine.Sn PARAM */),"G1.machine.Sn",equationIndexes);
  TRACE_POP
}

/*
equation index: 237
type: SIMPLE_ASSIGN
G1.machine.V_b = G1.V_b
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_237(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,237};
  (data->simulationInfo->realParameter[52] /* G1.machine.V_b PARAM */) = (data->simulationInfo->realParameter[25] /* G1.V_b PARAM */);
  TRACE_POP
}

/*
equation index: 238
type: SIMPLE_ASSIGN
G1.machine.V_MBtoSB = G1.machine.Vn / G1.machine.V_b
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_238(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,238};
  (data->simulationInfo->realParameter[51] /* G1.machine.V_MBtoSB PARAM */) = DIVISION_SIM((data->simulationInfo->realParameter[55] /* G1.machine.Vn PARAM */),(data->simulationInfo->realParameter[52] /* G1.machine.V_b PARAM */),"G1.machine.V_b",equationIndexes);
  TRACE_POP
}

/*
equation index: 239
type: SIMPLE_ASSIGN
G1.machine.K1 = G1.machine.xd + (-G1.machine.x1d) - G1.machine.T2d0 * G1.machine.x2d * (G1.machine.xd - G1.machine.x1d) / (G1.machine.x1d * G1.machine.T1d0)
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_239(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,239};
  (data->simulationInfo->realParameter[36] /* G1.machine.K1 PARAM */) = (data->simulationInfo->realParameter[88] /* G1.machine.xd PARAM */) + (-(data->simulationInfo->realParameter[84] /* G1.machine.x1d PARAM */)) - (((data->simulationInfo->realParameter[48] /* G1.machine.T2d0 PARAM */)) * (((data->simulationInfo->realParameter[86] /* G1.machine.x2d PARAM */)) * (DIVISION_SIM((data->simulationInfo->realParameter[88] /* G1.machine.xd PARAM */) - (data->simulationInfo->realParameter[84] /* G1.machine.x1d PARAM */),((data->simulationInfo->realParameter[84] /* G1.machine.x1d PARAM */)) * ((data->simulationInfo->realParameter[46] /* G1.machine.T1d0 PARAM */)),"G1.machine.x1d * G1.machine.T1d0",equationIndexes))));
  TRACE_POP
}

/*
equation index: 240
type: SIMPLE_ASSIGN
G1.machine.K2 = G1.machine.x1d + G1.machine.T2d0 * G1.machine.x2d * (G1.machine.xd - G1.machine.x1d) / (G1.machine.x1d * G1.machine.T1d0) - G1.machine.x2d
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_240(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,240};
  (data->simulationInfo->realParameter[37] /* G1.machine.K2 PARAM */) = (data->simulationInfo->realParameter[84] /* G1.machine.x1d PARAM */) + ((data->simulationInfo->realParameter[48] /* G1.machine.T2d0 PARAM */)) * (((data->simulationInfo->realParameter[86] /* G1.machine.x2d PARAM */)) * (DIVISION_SIM((data->simulationInfo->realParameter[88] /* G1.machine.xd PARAM */) - (data->simulationInfo->realParameter[84] /* G1.machine.x1d PARAM */),((data->simulationInfo->realParameter[84] /* G1.machine.x1d PARAM */)) * ((data->simulationInfo->realParameter[46] /* G1.machine.T1d0 PARAM */)),"G1.machine.x1d * G1.machine.T1d0",equationIndexes))) - (data->simulationInfo->realParameter[86] /* G1.machine.x2d PARAM */);
  TRACE_POP
}

/*
equation index: 241
type: SIMPLE_ASSIGN
pwFault.ground = abs(pwFault.R) < 1e-15 and abs(pwFault.X) < 1e-15
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_241(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,241};
  modelica_boolean tmp0;
  modelica_boolean tmp1;
  tmp0 = Less(fabs((data->simulationInfo->realParameter[102] /* pwFault.R PARAM */)),1e-15);
  tmp1 = Less(fabs((data->simulationInfo->realParameter[103] /* pwFault.X PARAM */)),1e-15);
  (data->simulationInfo->booleanParameter[54] /* pwFault.ground PARAM */) = (tmp0 && tmp1);
  TRACE_POP
}

/*
equation index: 248
type: SIMPLE_ASSIGN
infiniteBus.fn = SysData.fn
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_248(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,248};
  (data->simulationInfo->realParameter[100] /* infiniteBus.fn PARAM */) = (data->simulationInfo->realParameter[94] /* SysData.fn PARAM */);
  TRACE_POP
}

/*
equation index: 251
type: SIMPLE_ASSIGN
infiniteBus.S_b = SysData.S_b
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_251(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,251};
  (data->simulationInfo->realParameter[97] /* infiniteBus.S_b PARAM */) = (data->simulationInfo->realParameter[93] /* SysData.S_b PARAM */);
  TRACE_POP
}

/*
equation index: 252
type: SIMPLE_ASSIGN
pwLine2.Z.im = pwLine2.X
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_252(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,252};
  (data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */) = (data->simulationInfo->realParameter[121] /* pwLine2.X PARAM */);
  TRACE_POP
}

/*
equation index: 253
type: SIMPLE_ASSIGN
pwLine2.Z.re = pwLine2.R
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_253(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,253};
  (data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */) = (data->simulationInfo->realParameter[119] /* pwLine2.R PARAM */);
  TRACE_POP
}

/*
equation index: 254
type: SIMPLE_ASSIGN
pwLine2.Y.im = pwLine2.B
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_254(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,254};
  (data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */) = (data->simulationInfo->realParameter[117] /* pwLine2.B PARAM */);
  TRACE_POP
}

/*
equation index: 255
type: SIMPLE_ASSIGN
pwLine2.Y.re = pwLine2.G
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_255(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,255};
  (data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */) = (data->simulationInfo->realParameter[118] /* pwLine2.G PARAM */);
  TRACE_POP
}

/*
equation index: 257
type: SIMPLE_ASSIGN
pwLine1.Z.im = pwLine1.X
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_257(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,257};
  (data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */) = (data->simulationInfo->realParameter[110] /* pwLine1.X PARAM */);
  TRACE_POP
}

/*
equation index: 258
type: SIMPLE_ASSIGN
pwLine1.Z.re = pwLine1.R
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_258(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,258};
  (data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */) = (data->simulationInfo->realParameter[108] /* pwLine1.R PARAM */);
  TRACE_POP
}

/*
equation index: 259
type: SIMPLE_ASSIGN
pwLine1.Y.im = pwLine1.B
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_259(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,259};
  (data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */) = (data->simulationInfo->realParameter[106] /* pwLine1.B PARAM */);
  TRACE_POP
}

/*
equation index: 260
type: SIMPLE_ASSIGN
pwLine1.Y.re = pwLine1.G
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_260(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,260};
  (data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */) = (data->simulationInfo->realParameter[107] /* pwLine1.G PARAM */);
  TRACE_POP
}

/*
equation index: 262
type: SIMPLE_ASSIGN
transformer.tc = transformer.m <> 1.0
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_262(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,262};
  (data->simulationInfo->booleanParameter[58] /* transformer.tc PARAM */) = ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */) != 1.0);
  TRACE_POP
}

/*
equation index: 263
type: SIMPLE_ASSIGN
transformer.Zn = transformer.Vn ^ 2.0 / transformer.Sn
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_263(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,263};
  modelica_real tmp2;
  tmp2 = (data->simulationInfo->realParameter[131] /* transformer.Vn PARAM */);
  (data->simulationInfo->realParameter[133] /* transformer.Zn PARAM */) = DIVISION_SIM((tmp2 * tmp2),(data->simulationInfo->realParameter[129] /* transformer.Sn PARAM */),"transformer.Sn",equationIndexes);
  TRACE_POP
}

/*
equation index: 264
type: SIMPLE_ASSIGN
transformer.S_b = SysData.S_b
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_264(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,264};
  (data->simulationInfo->realParameter[128] /* transformer.S_b PARAM */) = (data->simulationInfo->realParameter[93] /* SysData.S_b PARAM */);
  TRACE_POP
}

/*
equation index: 265
type: SIMPLE_ASSIGN
transformer.Zb = transformer.V_b ^ 2.0 / transformer.S_b
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_265(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,265};
  modelica_real tmp3;
  tmp3 = (data->simulationInfo->realParameter[130] /* transformer.V_b PARAM */);
  (data->simulationInfo->realParameter[132] /* transformer.Zb PARAM */) = DIVISION_SIM((tmp3 * tmp3),(data->simulationInfo->realParameter[128] /* transformer.S_b PARAM */),"transformer.S_b",equationIndexes);
  TRACE_POP
}

/*
equation index: 266
type: SIMPLE_ASSIGN
transformer.x = transformer.xT * transformer.Zn / transformer.Zb
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_266(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,266};
  (data->simulationInfo->realParameter[137] /* transformer.x PARAM */) = ((data->simulationInfo->realParameter[138] /* transformer.xT PARAM */)) * (DIVISION_SIM((data->simulationInfo->realParameter[133] /* transformer.Zn PARAM */),(data->simulationInfo->realParameter[132] /* transformer.Zb PARAM */),"transformer.Zb",equationIndexes));
  TRACE_POP
}

/*
equation index: 267
type: SIMPLE_ASSIGN
transformer.r = transformer.rT * transformer.Zn / transformer.Zb
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_267(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,267};
  (data->simulationInfo->realParameter[135] /* transformer.r PARAM */) = ((data->simulationInfo->realParameter[136] /* transformer.rT PARAM */)) * (DIVISION_SIM((data->simulationInfo->realParameter[133] /* transformer.Zn PARAM */),(data->simulationInfo->realParameter[132] /* transformer.Zb PARAM */),"transformer.Zb",equationIndexes));
  TRACE_POP
}

/*
equation index: 268
type: SIMPLE_ASSIGN
G1.machine.Z_MBtoSB = G1.machine.S_b * (G1.machine.Vn / G1.machine.V_b) ^ 2.0 / G1.machine.Sn
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_268(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,268};
  modelica_real tmp4;
  tmp4 = DIVISION_SIM((data->simulationInfo->realParameter[55] /* G1.machine.Vn PARAM */),(data->simulationInfo->realParameter[52] /* G1.machine.V_b PARAM */),"G1.machine.V_b",equationIndexes);
  (data->simulationInfo->realParameter[58] /* G1.machine.Z_MBtoSB PARAM */) = ((data->simulationInfo->realParameter[44] /* G1.machine.S_b PARAM */)) * (DIVISION_SIM((tmp4 * tmp4),(data->simulationInfo->realParameter[45] /* G1.machine.Sn PARAM */),"G1.machine.Sn",equationIndexes));
  TRACE_POP
}

/*
equation index: 269
type: SIMPLE_ASSIGN
G1.machine.xq0 = G1.machine.xq
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_269(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,269};
  (data->simulationInfo->realParameter[90] /* G1.machine.xq0 PARAM */) = (data->simulationInfo->realParameter[89] /* G1.machine.xq PARAM */);
  TRACE_POP
}

/*
equation index: 270
type: SIMPLE_ASSIGN
G1.machine.Q_0 = G1.Q_0
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_270(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,270};
  (data->simulationInfo->realParameter[40] /* G1.machine.Q_0 PARAM */) = (data->simulationInfo->realParameter[23] /* G1.Q_0 PARAM */);
  TRACE_POP
}

/*
equation index: 271
type: SIMPLE_ASSIGN
G1.machine.q0 = G1.machine.Q_0 / G1.machine.S_b
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_271(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,271};
  (data->simulationInfo->realParameter[74] /* G1.machine.q0 PARAM */) = DIVISION_SIM((data->simulationInfo->realParameter[40] /* G1.machine.Q_0 PARAM */),(data->simulationInfo->realParameter[44] /* G1.machine.S_b PARAM */),"G1.machine.S_b",equationIndexes);
  TRACE_POP
}

/*
equation index: 272
type: SIMPLE_ASSIGN
G1.machine.S0.im = -G1.machine.q0
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_272(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,272};
  (data->simulationInfo->realParameter[41] /* G1.machine.S0.im PARAM */) = (-(data->simulationInfo->realParameter[74] /* G1.machine.q0 PARAM */));
  TRACE_POP
}

/*
equation index: 273
type: SIMPLE_ASSIGN
G1.machine.P_0 = G1.P_0
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_273(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,273};
  (data->simulationInfo->realParameter[39] /* G1.machine.P_0 PARAM */) = (data->simulationInfo->realParameter[22] /* G1.P_0 PARAM */);
  TRACE_POP
}

/*
equation index: 274
type: SIMPLE_ASSIGN
G1.machine.p0 = G1.machine.P_0 / G1.machine.S_b
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_274(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,274};
  (data->simulationInfo->realParameter[70] /* G1.machine.p0 PARAM */) = DIVISION_SIM((data->simulationInfo->realParameter[39] /* G1.machine.P_0 PARAM */),(data->simulationInfo->realParameter[44] /* G1.machine.S_b PARAM */),"G1.machine.S_b",equationIndexes);
  TRACE_POP
}

/*
equation index: 275
type: SIMPLE_ASSIGN
G1.machine.S0.re = G1.machine.p0
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_275(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,275};
  (data->simulationInfo->realParameter[42] /* G1.machine.S0.re PARAM */) = (data->simulationInfo->realParameter[70] /* G1.machine.p0 PARAM */);
  TRACE_POP
}

/*
equation index: 276
type: SIMPLE_ASSIGN
G1.machine.I_MBtoSB = G1.machine.Sn * G1.machine.V_b / (G1.machine.Vn * G1.machine.S_b)
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_276(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,276};
  (data->simulationInfo->realParameter[33] /* G1.machine.I_MBtoSB PARAM */) = ((data->simulationInfo->realParameter[45] /* G1.machine.Sn PARAM */)) * (DIVISION_SIM((data->simulationInfo->realParameter[52] /* G1.machine.V_b PARAM */),((data->simulationInfo->realParameter[55] /* G1.machine.Vn PARAM */)) * ((data->simulationInfo->realParameter[44] /* G1.machine.S_b PARAM */)),"G1.machine.Vn * G1.machine.S_b",equationIndexes));
  TRACE_POP
}

/*
equation index: 277
type: SIMPLE_ASSIGN
G1.machine.fn = SysData.fn
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_277(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,277};
  (data->simulationInfo->realParameter[65] /* G1.machine.fn PARAM */) = (data->simulationInfo->realParameter[94] /* SysData.fn PARAM */);
  TRACE_POP
}

/*
equation index: 278
type: SIMPLE_ASSIGN
G1.machine.w_b = 6.283185307179586 * G1.machine.fn
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_278(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,278};
  (data->simulationInfo->realParameter[83] /* G1.machine.w_b PARAM */) = (6.283185307179586) * ((data->simulationInfo->realParameter[65] /* G1.machine.fn PARAM */));
  TRACE_POP
}

/*
equation index: 282
type: SIMPLE_ASSIGN
G1.machine.angle_0 = G1.angle_0
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_282(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,282};
  (data->simulationInfo->realParameter[59] /* G1.machine.angle_0 PARAM */) = (data->simulationInfo->realParameter[26] /* G1.angle_0 PARAM */);
  TRACE_POP
}

/*
equation index: 284
type: SIMPLE_ASSIGN
G1.machine.v_0 = G1.v_0
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_284(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,284};
  (data->simulationInfo->realParameter[76] /* G1.machine.v_0 PARAM */) = (data->simulationInfo->realParameter[91] /* G1.v_0 PARAM */);
  TRACE_POP
}

/*
equation index: 296
type: SIMPLE_ASSIGN
G1.fn = SysData.fn
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_296(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,296};
  (data->simulationInfo->realParameter[27] /* G1.fn PARAM */) = (data->simulationInfo->realParameter[94] /* SysData.fn PARAM */);
  TRACE_POP
}

/*
equation index: 299
type: SIMPLE_ASSIGN
G1.S_b = SysData.S_b
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_299(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,299};
  (data->simulationInfo->realParameter[24] /* G1.S_b PARAM */) = (data->simulationInfo->realParameter[93] /* SysData.S_b PARAM */);
  TRACE_POP
}

/*
equation index: 306
type: SIMPLE_ASSIGN
B3.fn = SysData.fn
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_306(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,306};
  (data->simulationInfo->realParameter[20] /* B3.fn PARAM */) = (data->simulationInfo->realParameter[94] /* SysData.fn PARAM */);
  TRACE_POP
}

/*
equation index: 309
type: SIMPLE_ASSIGN
B3.S_b = SysData.S_b
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_309(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,309};
  (data->simulationInfo->realParameter[17] /* B3.S_b PARAM */) = (data->simulationInfo->realParameter[93] /* SysData.S_b PARAM */);
  TRACE_POP
}

/*
equation index: 316
type: SIMPLE_ASSIGN
B2.fn = SysData.fn
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_316(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,316};
  (data->simulationInfo->realParameter[13] /* B2.fn PARAM */) = (data->simulationInfo->realParameter[94] /* SysData.fn PARAM */);
  TRACE_POP
}

/*
equation index: 319
type: SIMPLE_ASSIGN
B2.S_b = SysData.S_b
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_319(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,319};
  (data->simulationInfo->realParameter[10] /* B2.S_b PARAM */) = (data->simulationInfo->realParameter[93] /* SysData.S_b PARAM */);
  TRACE_POP
}

/*
equation index: 326
type: SIMPLE_ASSIGN
B1.fn = SysData.fn
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_326(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,326};
  (data->simulationInfo->realParameter[6] /* B1.fn PARAM */) = (data->simulationInfo->realParameter[94] /* SysData.fn PARAM */);
  TRACE_POP
}

/*
equation index: 329
type: SIMPLE_ASSIGN
B1.S_b = SysData.S_b
*/
OMC_DISABLE_OPT
static void GenIO4HILinNetwork_eqFunction_329(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,329};
  (data->simulationInfo->realParameter[3] /* B1.S_b PARAM */) = (data->simulationInfo->realParameter[93] /* SysData.S_b PARAM */);
  TRACE_POP
}
extern void GenIO4HILinNetwork_eqFunction_6(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_5(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_139(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_138(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_137(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_136(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_135(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_134(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_7(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_8(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_9(DATA *data, threadData_t *threadData);

OMC_DISABLE_OPT
void GenIO4HILinNetwork_updateBoundParameters_0(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  GenIO4HILinNetwork_eqFunction_235(data, threadData);
  GenIO4HILinNetwork_eqFunction_236(data, threadData);
  GenIO4HILinNetwork_eqFunction_237(data, threadData);
  GenIO4HILinNetwork_eqFunction_238(data, threadData);
  GenIO4HILinNetwork_eqFunction_239(data, threadData);
  GenIO4HILinNetwork_eqFunction_240(data, threadData);
  GenIO4HILinNetwork_eqFunction_241(data, threadData);
  GenIO4HILinNetwork_eqFunction_248(data, threadData);
  GenIO4HILinNetwork_eqFunction_251(data, threadData);
  GenIO4HILinNetwork_eqFunction_252(data, threadData);
  GenIO4HILinNetwork_eqFunction_253(data, threadData);
  GenIO4HILinNetwork_eqFunction_254(data, threadData);
  GenIO4HILinNetwork_eqFunction_255(data, threadData);
  GenIO4HILinNetwork_eqFunction_257(data, threadData);
  GenIO4HILinNetwork_eqFunction_258(data, threadData);
  GenIO4HILinNetwork_eqFunction_259(data, threadData);
  GenIO4HILinNetwork_eqFunction_260(data, threadData);
  GenIO4HILinNetwork_eqFunction_262(data, threadData);
  GenIO4HILinNetwork_eqFunction_263(data, threadData);
  GenIO4HILinNetwork_eqFunction_264(data, threadData);
  GenIO4HILinNetwork_eqFunction_265(data, threadData);
  GenIO4HILinNetwork_eqFunction_266(data, threadData);
  GenIO4HILinNetwork_eqFunction_267(data, threadData);
  GenIO4HILinNetwork_eqFunction_268(data, threadData);
  GenIO4HILinNetwork_eqFunction_269(data, threadData);
  GenIO4HILinNetwork_eqFunction_270(data, threadData);
  GenIO4HILinNetwork_eqFunction_271(data, threadData);
  GenIO4HILinNetwork_eqFunction_272(data, threadData);
  GenIO4HILinNetwork_eqFunction_273(data, threadData);
  GenIO4HILinNetwork_eqFunction_274(data, threadData);
  GenIO4HILinNetwork_eqFunction_275(data, threadData);
  GenIO4HILinNetwork_eqFunction_276(data, threadData);
  GenIO4HILinNetwork_eqFunction_277(data, threadData);
  GenIO4HILinNetwork_eqFunction_278(data, threadData);
  GenIO4HILinNetwork_eqFunction_282(data, threadData);
  GenIO4HILinNetwork_eqFunction_284(data, threadData);
  GenIO4HILinNetwork_eqFunction_296(data, threadData);
  GenIO4HILinNetwork_eqFunction_299(data, threadData);
  GenIO4HILinNetwork_eqFunction_306(data, threadData);
  GenIO4HILinNetwork_eqFunction_309(data, threadData);
  GenIO4HILinNetwork_eqFunction_316(data, threadData);
  GenIO4HILinNetwork_eqFunction_319(data, threadData);
  GenIO4HILinNetwork_eqFunction_326(data, threadData);
  GenIO4HILinNetwork_eqFunction_329(data, threadData);
  GenIO4HILinNetwork_eqFunction_6(data, threadData);
  GenIO4HILinNetwork_eqFunction_5(data, threadData);
  GenIO4HILinNetwork_eqFunction_139(data, threadData);
  GenIO4HILinNetwork_eqFunction_138(data, threadData);
  GenIO4HILinNetwork_eqFunction_137(data, threadData);
  GenIO4HILinNetwork_eqFunction_136(data, threadData);
  GenIO4HILinNetwork_eqFunction_135(data, threadData);
  GenIO4HILinNetwork_eqFunction_134(data, threadData);
  GenIO4HILinNetwork_eqFunction_7(data, threadData);
  GenIO4HILinNetwork_eqFunction_8(data, threadData);
  GenIO4HILinNetwork_eqFunction_9(data, threadData);
  TRACE_POP
}
OMC_DISABLE_OPT
int GenIO4HILinNetwork_updateBoundParameters(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  (data->simulationInfo->integerParameter[0] /* pwLine1.opening PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[0].time_unvarying = 1;
  (data->simulationInfo->integerParameter[1] /* pwLine2.opening PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[1].time_unvarying = 1;
  (data->simulationInfo->realParameter[30] /* G1.machine.D PARAM */) = 0.0;
  data->modelData->realParameterData[30].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[1] /* B1.enableP_0 PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[1].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[2] /* B1.enableQ_0 PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[2].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[3] /* B1.enableS_b PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[3].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[4] /* B1.enableV_b PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[4].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[5] /* B1.enableangle_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[5].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[6] /* B1.enabledisplayPF PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[6].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[7] /* B1.enablefn PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[7].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[8] /* B1.enablev_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[8].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[10] /* B2.enableP_0 PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[10].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[11] /* B2.enableQ_0 PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[11].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[12] /* B2.enableS_b PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[12].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[13] /* B2.enableV_b PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[13].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[14] /* B2.enableangle_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[14].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[15] /* B2.enabledisplayPF PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[15].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[16] /* B2.enablefn PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[16].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[17] /* B2.enablev_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[17].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[19] /* B3.enableP_0 PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[19].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[20] /* B3.enableQ_0 PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[20].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[21] /* B3.enableS_b PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[21].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[22] /* B3.enableV_b PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[22].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[23] /* B3.enableangle_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[23].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[24] /* B3.enabledisplayPF PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[24].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[25] /* B3.enablefn PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[25].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[26] /* B3.enablev_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[26].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[28] /* G1.enableP_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[28].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[29] /* G1.enableQ_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[29].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[30] /* G1.enableS_b PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[30].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[31] /* G1.enableV_b PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[31].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[32] /* G1.enableangle_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[32].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[33] /* G1.enabledisplayPF PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[33].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[34] /* G1.enablefn PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[34].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[35] /* G1.enablev_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[35].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[37] /* G1.machine.enableP_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[37].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[38] /* G1.machine.enableQ_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[38].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[39] /* G1.machine.enableS_b PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[39].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[40] /* G1.machine.enableV_b PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[40].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[41] /* G1.machine.enableangle_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[41].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[42] /* G1.machine.enabledisplayPF PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[42].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[43] /* G1.machine.enablefn PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[43].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[44] /* G1.machine.enablev_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[44].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[46] /* infiniteBus.enableP_0 PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[46].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[47] /* infiniteBus.enableQ_0 PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[47].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[48] /* infiniteBus.enableS_b PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[48].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[49] /* infiniteBus.enableV_b PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[49].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[50] /* infiniteBus.enableangle_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[50].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[51] /* infiniteBus.enabledisplayPF PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[51].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[52] /* infiniteBus.enablefn PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[52].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[53] /* infiniteBus.enablev_0 PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[53].time_unvarying = 1;
  GenIO4HILinNetwork_updateBoundParameters_0(data, threadData);
  TRACE_POP
  return 0;
}

#if defined(__cplusplus)
}
#endif

