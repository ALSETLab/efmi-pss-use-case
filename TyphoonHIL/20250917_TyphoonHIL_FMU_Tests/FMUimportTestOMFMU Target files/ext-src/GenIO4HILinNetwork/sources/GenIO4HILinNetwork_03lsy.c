/* Linear Systems */
#include "GenIO4HILinNetwork_model.h"
#include "GenIO4HILinNetwork_12jac.h"
#if defined(__cplusplus)
extern "C" {
#endif

/* linear systems */
OMC_DISABLE_OPT
void setLinearMatrixA193(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData)
{
  const int equationIndexes[2] = {1,193};
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
  tmp1 = 1.0;
  tmp2 = fabs((data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  relationhysteresis(data, &tmp0, data->localData[0]->timeValue, (data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */), tmp1, tmp2, 2, GreaterEq, GreaterEqZC);
  tmp4 = 1.0;
  tmp5 = fabs((data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  relationhysteresis(data, &tmp3, data->localData[0]->timeValue, (data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */), tmp4, tmp5, 3, Less, LessZC);
  linearSystemData->setAElement(0, 0, (-(((tmp0 && tmp3)?0.0:(-(data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */))))), 0, linearSystemData, threadData);
  tmp7 = 1.0;
  tmp8 = fabs((data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  relationhysteresis(data, &tmp6, data->localData[0]->timeValue, (data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */), tmp7, tmp8, 2, GreaterEq, GreaterEqZC);
  tmp10 = 1.0;
  tmp11 = fabs((data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  relationhysteresis(data, &tmp9, data->localData[0]->timeValue, (data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */), tmp10, tmp11, 3, Less, LessZC);
  linearSystemData->setAElement(0, 1, (-(((tmp6 && tmp9)?1.0:(-(data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */))))), 1, linearSystemData, threadData);
  tmp13 = 1.0;
  tmp14 = fabs((data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  relationhysteresis(data, &tmp12, data->localData[0]->timeValue, (data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */), tmp13, tmp14, 2, GreaterEq, GreaterEqZC);
  tmp16 = 1.0;
  tmp17 = fabs((data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  relationhysteresis(data, &tmp15, data->localData[0]->timeValue, (data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */), tmp16, tmp17, 3, Less, LessZC);
  linearSystemData->setAElement(1, 0, (-(((tmp12 && tmp15)?1.0:(-(data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */))))), 2, linearSystemData, threadData);
  tmp19 = 1.0;
  tmp20 = fabs((data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  relationhysteresis(data, &tmp18, data->localData[0]->timeValue, (data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */), tmp19, tmp20, 2, GreaterEq, GreaterEqZC);
  tmp22 = 1.0;
  tmp23 = fabs((data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  relationhysteresis(data, &tmp21, data->localData[0]->timeValue, (data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */), tmp22, tmp23, 3, Less, LessZC);
  linearSystemData->setAElement(1, 1, (-(((tmp18 && tmp21)?0.0:(data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */)))), 3, linearSystemData, threadData);
}
OMC_DISABLE_OPT
void setLinearVectorb193(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData)
{
  const int equationIndexes[2] = {1,193};
  modelica_boolean tmp24;
  modelica_real tmp25;
  modelica_real tmp26;
  modelica_boolean tmp27;
  modelica_real tmp28;
  modelica_real tmp29;
  modelica_boolean tmp30;
  modelica_real tmp31;
  modelica_real tmp32;
  modelica_boolean tmp33;
  modelica_real tmp34;
  modelica_real tmp35;
  tmp25 = 1.0;
  tmp26 = fabs((data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  relationhysteresis(data, &tmp24, data->localData[0]->timeValue, (data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */), tmp25, tmp26, 2, GreaterEq, GreaterEqZC);
  tmp28 = 1.0;
  tmp29 = fabs((data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  relationhysteresis(data, &tmp27, data->localData[0]->timeValue, (data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */), tmp28, tmp29, 3, Less, LessZC);
  linearSystemData->setBElement(0, ((tmp24 && tmp27)?0.0:(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */) - (((data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */)) * (((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */))) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))) + ((data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */)) * (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))))), linearSystemData, threadData);
  tmp31 = 1.0;
  tmp32 = fabs((data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  relationhysteresis(data, &tmp30, data->localData[0]->timeValue, (data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */), tmp31, tmp32, 2, GreaterEq, GreaterEqZC);
  tmp34 = 1.0;
  tmp35 = fabs((data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  relationhysteresis(data, &tmp33, data->localData[0]->timeValue, (data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */), tmp34, tmp35, 3, Less, LessZC);
  linearSystemData->setBElement(1, ((tmp30 && tmp33)?0.0:(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) - (((data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */)) * (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))) - (((data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */)) * (((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */))) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */))))))), linearSystemData, threadData);
}
OMC_DISABLE_OPT
void initializeStaticLSData193(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData, modelica_boolean initSparsePattern)
{
  const int indices[2] = {
    63 /* pwLine2.ir.re */,
    62 /* pwLine2.ir.im */
  };
  for (int i = 0; i < 2; ++i) {
    linearSystemData->nominal[i] = data->modelData->realVarsData[indices[i]].attribute.nominal;
    linearSystemData->min[i]     = data->modelData->realVarsData[indices[i]].attribute.min;
    linearSystemData->max[i]     = data->modelData->realVarsData[indices[i]].attribute.max;
  }
}

OMC_DISABLE_OPT
void setLinearMatrixA188(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData)
{
  const int equationIndexes[2] = {1,188};
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
  modelica_boolean tmp51;
  modelica_real tmp52;
  modelica_real tmp53;
  modelica_boolean tmp54;
  modelica_real tmp55;
  modelica_real tmp56;
  modelica_boolean tmp57;
  modelica_real tmp58;
  modelica_real tmp59;
  tmp37 = 1.0;
  tmp38 = fabs((data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  relationhysteresis(data, &tmp36, data->localData[0]->timeValue, (data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */), tmp37, tmp38, 4, GreaterEq, GreaterEqZC);
  tmp40 = 1.0;
  tmp41 = fabs((data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  relationhysteresis(data, &tmp39, data->localData[0]->timeValue, (data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */), tmp40, tmp41, 5, Less, LessZC);
  linearSystemData->setAElement(0, 0, (-(((tmp36 && tmp39)?0.0:(-(data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */))))), 0, linearSystemData, threadData);
  tmp43 = 1.0;
  tmp44 = fabs((data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  relationhysteresis(data, &tmp42, data->localData[0]->timeValue, (data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */), tmp43, tmp44, 4, GreaterEq, GreaterEqZC);
  tmp46 = 1.0;
  tmp47 = fabs((data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  relationhysteresis(data, &tmp45, data->localData[0]->timeValue, (data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */), tmp46, tmp47, 5, Less, LessZC);
  linearSystemData->setAElement(0, 1, (-(((tmp42 && tmp45)?1.0:(-(data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */))))), 1, linearSystemData, threadData);
  tmp49 = 1.0;
  tmp50 = fabs((data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  relationhysteresis(data, &tmp48, data->localData[0]->timeValue, (data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */), tmp49, tmp50, 4, GreaterEq, GreaterEqZC);
  tmp52 = 1.0;
  tmp53 = fabs((data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  relationhysteresis(data, &tmp51, data->localData[0]->timeValue, (data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */), tmp52, tmp53, 5, Less, LessZC);
  linearSystemData->setAElement(1, 0, (-(((tmp48 && tmp51)?1.0:(-(data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */))))), 2, linearSystemData, threadData);
  tmp55 = 1.0;
  tmp56 = fabs((data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  relationhysteresis(data, &tmp54, data->localData[0]->timeValue, (data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */), tmp55, tmp56, 4, GreaterEq, GreaterEqZC);
  tmp58 = 1.0;
  tmp59 = fabs((data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  relationhysteresis(data, &tmp57, data->localData[0]->timeValue, (data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */), tmp58, tmp59, 5, Less, LessZC);
  linearSystemData->setAElement(1, 1, (-(((tmp54 && tmp57)?0.0:(data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */)))), 3, linearSystemData, threadData);
}
OMC_DISABLE_OPT
void setLinearVectorb188(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData)
{
  const int equationIndexes[2] = {1,188};
  modelica_boolean tmp60;
  modelica_real tmp61;
  modelica_real tmp62;
  modelica_boolean tmp63;
  modelica_real tmp64;
  modelica_real tmp65;
  modelica_boolean tmp66;
  modelica_real tmp67;
  modelica_real tmp68;
  modelica_boolean tmp69;
  modelica_real tmp70;
  modelica_real tmp71;
  tmp61 = 1.0;
  tmp62 = fabs((data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  relationhysteresis(data, &tmp60, data->localData[0]->timeValue, (data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */), tmp61, tmp62, 4, GreaterEq, GreaterEqZC);
  tmp64 = 1.0;
  tmp65 = fabs((data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  relationhysteresis(data, &tmp63, data->localData[0]->timeValue, (data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */), tmp64, tmp65, 5, Less, LessZC);
  linearSystemData->setBElement(0, ((tmp60 && tmp63)?0.0:(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */) - (((data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */)) * (((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */))) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))) + ((data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */)) * (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))))), linearSystemData, threadData);
  tmp67 = 1.0;
  tmp68 = fabs((data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  relationhysteresis(data, &tmp66, data->localData[0]->timeValue, (data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */), tmp67, tmp68, 4, GreaterEq, GreaterEqZC);
  tmp70 = 1.0;
  tmp71 = fabs((data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  relationhysteresis(data, &tmp69, data->localData[0]->timeValue, (data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */), tmp70, tmp71, 5, Less, LessZC);
  linearSystemData->setBElement(1, ((tmp66 && tmp69)?0.0:(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) - (((data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */)) * (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))) - (((data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */)) * (((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */))) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */))))))), linearSystemData, threadData);
}
OMC_DISABLE_OPT
void initializeStaticLSData188(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData, modelica_boolean initSparsePattern)
{
  const int indices[2] = {
    55 /* pwLine1.ir.re */,
    54 /* pwLine1.ir.im */
  };
  for (int i = 0; i < 2; ++i) {
    linearSystemData->nominal[i] = data->modelData->realVarsData[indices[i]].attribute.nominal;
    linearSystemData->min[i]     = data->modelData->realVarsData[indices[i]].attribute.min;
    linearSystemData->max[i]     = data->modelData->realVarsData[indices[i]].attribute.max;
  }
}


/*
equation index: 150
type: SIMPLE_ASSIGN
transformer.is.re = ($cse4 * G1.machine.iq - (-$cse3) * G1.machine.id) * G1.machine.I_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_150(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,150};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[75]] /* transformer.is.re variable */) = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[13]] /* $cse4 variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */)) - (((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[12]] /* $cse3 variable */))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */)))) * ((data->simulationInfo->realParameter[33] /* G1.machine.I_MBtoSB PARAM */));
  TRACE_POP
}
/*
equation index: 151
type: SIMPLE_ASSIGN
transformer.is.im = ($cse3 * G1.machine.iq - $cse4 * G1.machine.id) * G1.machine.I_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_151(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,151};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[74]] /* transformer.is.im variable */) = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[12]] /* $cse3 variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[13]] /* $cse4 variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */)))) * ((data->simulationInfo->realParameter[33] /* G1.machine.I_MBtoSB PARAM */));
  TRACE_POP
}
/*
equation index: 152
type: SIMPLE_ASSIGN
transformer.vs.re = (transformer.r * transformer.is.re - transformer.x * transformer.is.im + pwLine2.vs.re / transformer.m) * transformer.m ^ 2.0
*/
void GenIO4HILinNetwork_eqFunction_152(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,152};
  modelica_real tmp0;
  tmp0 = (data->simulationInfo->realParameter[134] /* transformer.m PARAM */);
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */) = (((data->simulationInfo->realParameter[135] /* transformer.r PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[75]] /* transformer.is.re variable */)) - (((data->simulationInfo->realParameter[137] /* transformer.x PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[74]] /* transformer.is.im variable */))) + DIVISION_SIM((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */),(data->simulationInfo->realParameter[134] /* transformer.m PARAM */),"transformer.m",equationIndexes)) * ((tmp0 * tmp0));
  TRACE_POP
}
/*
equation index: 153
type: SIMPLE_ASSIGN
transformer.vs.im = (transformer.r * transformer.is.im + transformer.x * transformer.is.re + pwLine2.vs.im / transformer.m) * transformer.m ^ 2.0
*/
void GenIO4HILinNetwork_eqFunction_153(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,153};
  modelica_real tmp0;
  tmp0 = (data->simulationInfo->realParameter[134] /* transformer.m PARAM */);
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */) = (((data->simulationInfo->realParameter[135] /* transformer.r PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[74]] /* transformer.is.im variable */)) + ((data->simulationInfo->realParameter[137] /* transformer.x PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[75]] /* transformer.is.re variable */)) + DIVISION_SIM((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */),(data->simulationInfo->realParameter[134] /* transformer.m PARAM */),"transformer.m",equationIndexes)) * ((tmp0 * tmp0));
  TRACE_POP
}
/*
equation index: 154
type: SIMPLE_ASSIGN
G1.machine.vd = G1.machine.e2d - (G1.machine.ra * G1.machine.id - G1.machine.x2q * G1.machine.iq)
*/
void GenIO4HILinNetwork_eqFunction_154(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,154};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[37]] /* G1.machine.vd variable */) = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[3]] /* G1.machine.e2d STATE(1) */) - (((data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */)) - (((data->simulationInfo->realParameter[87] /* G1.machine.x2q PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */))));
  TRACE_POP
}
/*
equation index: 155
type: SIMPLE_ASSIGN
G1.machine.vq = G1.machine.e2q - (G1.machine.ra * G1.machine.iq + G1.machine.x2d * G1.machine.id)
*/
void GenIO4HILinNetwork_eqFunction_155(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,155};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[39]] /* G1.machine.vq variable */) = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[4]] /* G1.machine.e2q STATE(1) */) - (((data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */)) + ((data->simulationInfo->realParameter[86] /* G1.machine.x2d PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */)));
  TRACE_POP
}
/*
equation index: 156
type: SIMPLE_ASSIGN
transformer.ir.im = (transformer.r * transformer.ir.re - (pwLine2.vs.re - transformer.vs.re / transformer.m)) / transformer.x
*/
void GenIO4HILinNetwork_eqFunction_156(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,156};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[72]] /* transformer.ir.im variable */) = DIVISION_SIM(((data->simulationInfo->realParameter[135] /* transformer.r PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[73]] /* transformer.ir.re variable */)) - ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) - (DIVISION_SIM((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */),(data->simulationInfo->realParameter[134] /* transformer.m PARAM */),"transformer.m",equationIndexes))),(data->simulationInfo->realParameter[137] /* transformer.x PARAM */),"transformer.x",equationIndexes);
  TRACE_POP
}
/*
equation index: 157
type: SIMPLE_ASSIGN
pwFault.p.ii = (-pwLine2.is.im) - pwLine1.is.im - transformer.ir.im
*/
void GenIO4HILinNetwork_eqFunction_157(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,157};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[48]] /* pwFault.p.ii variable */) = (-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */)) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[72]] /* transformer.ir.im variable */);
  TRACE_POP
}
/*
equation index: 158
type: SIMPLE_ASSIGN
pwFault.p.ir = (-pwLine2.is.re) - pwLine1.is.re - transformer.ir.re
*/
void GenIO4HILinNetwork_eqFunction_158(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,158};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[49]] /* pwFault.p.ir variable */) = (-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */)) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[73]] /* transformer.ir.re variable */);
  TRACE_POP
}

void residualFunc186(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,186};
  ANALYTIC_JACOBIAN* jacobian = NULL;
  modelica_boolean tmp0;
  modelica_real tmp1;
  modelica_real tmp2;
  modelica_boolean tmp3;
  modelica_real tmp4;
  modelica_real tmp5;
  modelica_boolean tmp6;
  modelica_real tmp7;
  modelica_real tmp8;
  modelica_real tmp9;
  modelica_real tmp10;
  modelica_boolean tmp11;
  modelica_real tmp12;
  modelica_boolean tmp13;
  modelica_real tmp14;
  modelica_boolean tmp15;
  modelica_real tmp16;
  modelica_boolean tmp17;
  modelica_real tmp18;
  modelica_real tmp19;
  modelica_boolean tmp20;
  modelica_real tmp21;
  modelica_real tmp22;
  modelica_boolean tmp23;
  modelica_real tmp24;
  modelica_real tmp25;
  modelica_real tmp26;
  modelica_real tmp27;
  modelica_boolean tmp28;
  modelica_real tmp29;
  modelica_boolean tmp30;
  modelica_real tmp31;
  modelica_boolean tmp32;
  modelica_real tmp33;
  modelica_boolean tmp34;
  modelica_real tmp35;
  modelica_real tmp36;
  modelica_boolean tmp37;
  modelica_real tmp38;
  modelica_real tmp39;
  modelica_boolean tmp40;
  modelica_real tmp41;
  modelica_real tmp42;
  modelica_boolean tmp43;
  modelica_real tmp44;
  modelica_real tmp45;
  modelica_boolean tmp46;
  modelica_real tmp47;
  modelica_real tmp48;
  modelica_boolean tmp49;
  modelica_real tmp50;
  modelica_real tmp51;
  modelica_boolean tmp52;
  modelica_real tmp53;
  modelica_real tmp54;
  modelica_boolean tmp55;
  modelica_real tmp56;
  modelica_real tmp57;
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */) = xloc[0];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */) = xloc[1];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */) = xloc[2];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */) = xloc[3];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[73]] /* transformer.ir.re variable */) = xloc[4];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */) = xloc[5];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */) = xloc[6];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */) = xloc[7];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) = xloc[8];
  /* local constraints */
  GenIO4HILinNetwork_eqFunction_150(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_151(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_152(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_153(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_154(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_155(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_156(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_157(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_158(data, threadData);
  tmp1 = 1.0;
  tmp2 = fabs((data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */));
  relationhysteresis(data, &tmp0, data->localData[0]->timeValue, (data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */), tmp1, tmp2, 0, Less, LessZC);
  tmp15 = (modelica_boolean)tmp0;
  if(tmp15)
  {
    tmp16 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[49]] /* pwFault.p.ir variable */);
  }
  else
  {
    tmp4 = 1.0;
    tmp5 = fabs((data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
    relationhysteresis(data, &tmp3, data->localData[0]->timeValue, (data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */), tmp4, tmp5, 1, Less, LessZC);
    tmp13 = (modelica_boolean)(tmp3 && (data->simulationInfo->booleanParameter[54] /* pwFault.ground PARAM */));
    if(tmp13)
    {
      tmp14 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */);
    }
    else
    {
      tmp7 = 1.0;
      tmp8 = fabs((data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
      relationhysteresis(data, &tmp6, data->localData[0]->timeValue, (data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */), tmp7, tmp8, 1, Less, LessZC);
      tmp11 = (modelica_boolean)tmp6;
      if(tmp11)
      {
        tmp9 = (data->simulationInfo->realParameter[102] /* pwFault.R PARAM */);
        tmp10 = (data->simulationInfo->realParameter[103] /* pwFault.X PARAM */);
        tmp12 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[49]] /* pwFault.p.ir variable */) - (DIVISION_SIM(((data->simulationInfo->realParameter[102] /* pwFault.R PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) + ((data->simulationInfo->realParameter[103] /* pwFault.X PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)),(tmp9 * tmp9) + (tmp10 * tmp10),"pwFault.R ^ 2.0 + pwFault.X ^ 2.0",equationIndexes));
      }
      else
      {
        tmp12 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[49]] /* pwFault.p.ir variable */);
      }
      tmp14 = tmp12;
    }
    tmp16 = tmp14;
  }
  res[0] = tmp16;

  tmp18 = 1.0;
  tmp19 = fabs((data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */));
  relationhysteresis(data, &tmp17, data->localData[0]->timeValue, (data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */), tmp18, tmp19, 0, Less, LessZC);
  tmp32 = (modelica_boolean)tmp17;
  if(tmp32)
  {
    tmp33 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[48]] /* pwFault.p.ii variable */);
  }
  else
  {
    tmp21 = 1.0;
    tmp22 = fabs((data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
    relationhysteresis(data, &tmp20, data->localData[0]->timeValue, (data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */), tmp21, tmp22, 1, Less, LessZC);
    tmp30 = (modelica_boolean)(tmp20 && (data->simulationInfo->booleanParameter[54] /* pwFault.ground PARAM */));
    if(tmp30)
    {
      tmp31 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) - 1e-10;
    }
    else
    {
      tmp24 = 1.0;
      tmp25 = fabs((data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
      relationhysteresis(data, &tmp23, data->localData[0]->timeValue, (data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */), tmp24, tmp25, 1, Less, LessZC);
      tmp28 = (modelica_boolean)tmp23;
      if(tmp28)
      {
        tmp26 = (data->simulationInfo->realParameter[103] /* pwFault.X PARAM */);
        tmp27 = (data->simulationInfo->realParameter[102] /* pwFault.R PARAM */);
        tmp29 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[48]] /* pwFault.p.ii variable */) - (DIVISION_SIM(((data->simulationInfo->realParameter[102] /* pwFault.R PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) - (((data->simulationInfo->realParameter[103] /* pwFault.X PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */))),(tmp26 * tmp26) + (tmp27 * tmp27),"pwFault.X ^ 2.0 + pwFault.R ^ 2.0",equationIndexes));
      }
      else
      {
        tmp29 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[48]] /* pwFault.p.ii variable */);
      }
      tmp31 = tmp29;
    }
    tmp33 = tmp31;
  }
  res[1] = tmp33;

  tmp35 = 1.0;
  tmp36 = fabs((data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  relationhysteresis(data, &tmp34, data->localData[0]->timeValue, (data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */), tmp35, tmp36, 2, GreaterEq, GreaterEqZC);
  tmp38 = 1.0;
  tmp39 = fabs((data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  relationhysteresis(data, &tmp37, data->localData[0]->timeValue, (data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */), tmp38, tmp39, 3, Less, LessZC);
  res[2] = ((tmp34 && tmp37)?(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */):(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */) - (((data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))) - (((data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */) + ((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */))) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))))));

  tmp41 = 1.0;
  tmp42 = fabs((data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  relationhysteresis(data, &tmp40, data->localData[0]->timeValue, (data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */), tmp41, tmp42, 2, GreaterEq, GreaterEqZC);
  tmp44 = 1.0;
  tmp45 = fabs((data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  relationhysteresis(data, &tmp43, data->localData[0]->timeValue, (data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */), tmp44, tmp45, 3, Less, LessZC);
  res[3] = ((tmp40 && tmp43)?(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */):(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */) - (((data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */) + ((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */))) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))) + ((data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */))))));

  tmp47 = 1.0;
  tmp48 = fabs((data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  relationhysteresis(data, &tmp46, data->localData[0]->timeValue, (data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */), tmp47, tmp48, 4, GreaterEq, GreaterEqZC);
  tmp50 = 1.0;
  tmp51 = fabs((data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  relationhysteresis(data, &tmp49, data->localData[0]->timeValue, (data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */), tmp50, tmp51, 5, Less, LessZC);
  res[4] = ((tmp46 && tmp49)?(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */):(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */) - (((data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))) - (((data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */) + ((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */))) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))))));

  tmp53 = 1.0;
  tmp54 = fabs((data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  relationhysteresis(data, &tmp52, data->localData[0]->timeValue, (data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */), tmp53, tmp54, 4, GreaterEq, GreaterEqZC);
  tmp56 = 1.0;
  tmp57 = fabs((data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  relationhysteresis(data, &tmp55, data->localData[0]->timeValue, (data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */), tmp56, tmp57, 5, Less, LessZC);
  res[5] = ((tmp52 && tmp55)?(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */):(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */) - (((data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */) + ((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */))) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))) + ((data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */))))));

  res[6] = ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */)) + ((-(data->simulationInfo->realParameter[135] /* transformer.r PARAM */))) * (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[72]] /* transformer.ir.im variable */)) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */))) - (((data->simulationInfo->realParameter[137] /* transformer.x PARAM */)) * (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[73]] /* transformer.ir.re variable */)) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */)))) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */);

  res[7] = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[12]] /* $cse3 variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[37]] /* G1.machine.vd variable */)) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[13]] /* $cse4 variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[39]] /* G1.machine.vq variable */))) * ((data->simulationInfo->realParameter[51] /* G1.machine.V_MBtoSB PARAM */)) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */);

  res[8] = (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[12]] /* $cse3 variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[39]] /* G1.machine.vq variable */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[13]] /* $cse4 variable */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[37]] /* G1.machine.vd variable */)))) * ((data->simulationInfo->realParameter[51] /* G1.machine.V_MBtoSB PARAM */)) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */);
  TRACE_POP
}
OMC_DISABLE_OPT
void initializeStaticLSData186(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData, modelica_boolean initSparsePattern)
{
  const int indices[9] = {
    57 /* pwLine1.is.re */,
    65 /* pwLine2.is.re */,
    56 /* pwLine1.is.im */,
    64 /* pwLine2.is.im */,
    73 /* transformer.ir.re */,
    35 /* G1.machine.iq */,
    34 /* G1.machine.id */,
    66 /* pwLine2.vs.im */,
    67 /* pwLine2.vs.re */
  };
  for (int i = 0; i < 9; ++i) {
    linearSystemData->nominal[i] = data->modelData->realVarsData[indices[i]].attribute.nominal;
    linearSystemData->min[i]     = data->modelData->realVarsData[indices[i]].attribute.min;
    linearSystemData->max[i]     = data->modelData->realVarsData[indices[i]].attribute.max;
  }
}

OMC_DISABLE_OPT
void setLinearMatrixA107(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData)
{
  const int equationIndexes[2] = {1,107};
  modelica_boolean tmp58;
  modelica_boolean tmp59;
  modelica_boolean tmp60;
  modelica_boolean tmp61;
  modelica_boolean tmp62;
  modelica_boolean tmp63;
  modelica_boolean tmp64;
  modelica_boolean tmp65;
  tmp58 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  tmp59 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  linearSystemData->setAElement(0, 0, (-(((tmp58 && tmp59)?0.0:(-(data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */))))), 0, linearSystemData, threadData);
  tmp60 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  tmp61 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  linearSystemData->setAElement(0, 1, (-(((tmp60 && tmp61)?1.0:(-(data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */))))), 1, linearSystemData, threadData);
  tmp62 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  tmp63 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  linearSystemData->setAElement(1, 0, (-(((tmp62 && tmp63)?1.0:(-(data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */))))), 2, linearSystemData, threadData);
  tmp64 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  tmp65 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  linearSystemData->setAElement(1, 1, (-(((tmp64 && tmp65)?0.0:(data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */)))), 3, linearSystemData, threadData);
}
OMC_DISABLE_OPT
void setLinearVectorb107(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData)
{
  const int equationIndexes[2] = {1,107};
  modelica_boolean tmp66;
  modelica_boolean tmp67;
  modelica_boolean tmp68;
  modelica_boolean tmp69;
  tmp66 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  tmp67 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  linearSystemData->setBElement(0, ((tmp66 && tmp67)?0.0:(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */) - (((data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */)) * (((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */))) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))) + ((data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */)) * (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))))), linearSystemData, threadData);
  tmp68 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  tmp69 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  linearSystemData->setBElement(1, ((tmp68 && tmp69)?0.0:(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) - (((data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */)) * (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))) - (((data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */)) * (((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */))) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */))))))), linearSystemData, threadData);
}
OMC_DISABLE_OPT
void initializeStaticLSData107(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData, modelica_boolean initSparsePattern)
{
  const int indices[2] = {
    55 /* pwLine1.ir.re */,
    54 /* pwLine1.ir.im */
  };
  for (int i = 0; i < 2; ++i) {
    linearSystemData->nominal[i] = data->modelData->realVarsData[indices[i]].attribute.nominal;
    linearSystemData->min[i]     = data->modelData->realVarsData[indices[i]].attribute.min;
    linearSystemData->max[i]     = data->modelData->realVarsData[indices[i]].attribute.max;
  }
}

OMC_DISABLE_OPT
void setLinearMatrixA102(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData)
{
  const int equationIndexes[2] = {1,102};
  modelica_boolean tmp70;
  modelica_boolean tmp71;
  modelica_boolean tmp72;
  modelica_boolean tmp73;
  modelica_boolean tmp74;
  modelica_boolean tmp75;
  modelica_boolean tmp76;
  modelica_boolean tmp77;
  tmp70 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  tmp71 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  linearSystemData->setAElement(0, 0, (-(((tmp70 && tmp71)?0.0:(data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */)))), 0, linearSystemData, threadData);
  tmp72 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  tmp73 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  linearSystemData->setAElement(0, 1, (-(((tmp72 && tmp73)?1.0:(-(data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */))))), 1, linearSystemData, threadData);
  tmp74 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  tmp75 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  linearSystemData->setAElement(1, 0, (-(((tmp74 && tmp75)?1.0:(-(data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */))))), 2, linearSystemData, threadData);
  tmp76 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  tmp77 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  linearSystemData->setAElement(1, 1, (-(((tmp76 && tmp77)?0.0:(-(data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */))))), 3, linearSystemData, threadData);
}
OMC_DISABLE_OPT
void setLinearVectorb102(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData)
{
  const int equationIndexes[2] = {1,102};
  modelica_boolean tmp78;
  modelica_boolean tmp79;
  modelica_boolean tmp80;
  modelica_boolean tmp81;
  tmp78 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  tmp79 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  linearSystemData->setBElement(0, ((tmp78 && tmp79)?0.0:(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) - (((data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */)) * (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))) - (((data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */)) * (((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */))) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */))))))), linearSystemData, threadData);
  tmp80 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  tmp81 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  linearSystemData->setBElement(1, ((tmp80 && tmp81)?0.0:(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */) - (((data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */)) * (((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */))) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))) + ((data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */)) * (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */)) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))))), linearSystemData, threadData);
}
OMC_DISABLE_OPT
void initializeStaticLSData102(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData, modelica_boolean initSparsePattern)
{
  const int indices[2] = {
    62 /* pwLine2.ir.im */,
    63 /* pwLine2.ir.re */
  };
  for (int i = 0; i < 2; ++i) {
    linearSystemData->nominal[i] = data->modelData->realVarsData[indices[i]].attribute.nominal;
    linearSystemData->min[i]     = data->modelData->realVarsData[indices[i]].attribute.min;
    linearSystemData->max[i]     = data->modelData->realVarsData[indices[i]].attribute.max;
  }
}


/*
equation index: 57
type: SIMPLE_ASSIGN
G1.machine.e1d = G1.machine.iq * (G1.machine.xq + (-G1.machine.x1q) - G1.machine.T2q0 * G1.machine.x2q * (G1.machine.xq - G1.machine.x1q) / G1.machine.x1q / G1.machine.T1q0) - $DER.G1.machine.e1d * G1.machine.T1q0
*/
void GenIO4HILinNetwork_eqFunction_57(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,57};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[1]] /* G1.machine.e1d STATE(1) */) = ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */)) * ((data->simulationInfo->realParameter[89] /* G1.machine.xq PARAM */) + (-(data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */)) - (((data->simulationInfo->realParameter[49] /* G1.machine.T2q0 PARAM */)) * (DIVISION_SIM(((data->simulationInfo->realParameter[87] /* G1.machine.x2q PARAM */)) * (DIVISION_SIM((data->simulationInfo->realParameter[89] /* G1.machine.xq PARAM */) - (data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */),(data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */),"G1.machine.x1q",equationIndexes)),(data->simulationInfo->realParameter[47] /* G1.machine.T1q0 PARAM */),"G1.machine.T1q0",equationIndexes)))) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[7]] /* der(G1.machine.e1d) STATE_DER */)) * ((data->simulationInfo->realParameter[47] /* G1.machine.T1q0 PARAM */)));
  TRACE_POP
}
/*
equation index: 58
type: SIMPLE_ASSIGN
G1.machine.e2d = (-$DER.G1.machine.e2d) * G1.machine.T2q0 - ((-G1.machine.e1d) - (G1.machine.x1q + G1.machine.T2q0 * G1.machine.x2q * (G1.machine.xq - G1.machine.x1q) / G1.machine.x1q / G1.machine.T1q0 - G1.machine.x2q) * G1.machine.iq)
*/
void GenIO4HILinNetwork_eqFunction_58(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,58};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[3]] /* G1.machine.e2d STATE(1) */) = ((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[9]] /* der(G1.machine.e2d) STATE_DER */))) * ((data->simulationInfo->realParameter[49] /* G1.machine.T2q0 PARAM */)) - ((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[1]] /* G1.machine.e1d STATE(1) */)) - (((data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */) + ((data->simulationInfo->realParameter[49] /* G1.machine.T2q0 PARAM */)) * (DIVISION_SIM(((data->simulationInfo->realParameter[87] /* G1.machine.x2q PARAM */)) * (DIVISION_SIM((data->simulationInfo->realParameter[89] /* G1.machine.xq PARAM */) - (data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */),(data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */),"G1.machine.x1q",equationIndexes)),(data->simulationInfo->realParameter[47] /* G1.machine.T1q0 PARAM */),"G1.machine.T1q0",equationIndexes)) - (data->simulationInfo->realParameter[87] /* G1.machine.x2q PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */))));
  TRACE_POP
}
/*
equation index: 59
type: SIMPLE_ASSIGN
transformer.is.im = (sin(G1.machine.delta) * G1.machine.iq - cos(G1.machine.delta) * G1.machine.id) * G1.machine.I_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_59(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,59};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[74]] /* transformer.is.im variable */) = ((sin((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* G1.machine.delta STATE(1) */))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */)) - ((cos((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* G1.machine.delta STATE(1) */))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */)))) * ((data->simulationInfo->realParameter[33] /* G1.machine.I_MBtoSB PARAM */));
  TRACE_POP
}
/*
equation index: 60
type: SIMPLE_ASSIGN
transformer.is.re = (cos(G1.machine.delta) * G1.machine.iq - (-sin(G1.machine.delta)) * G1.machine.id) * G1.machine.I_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_60(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,60};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[75]] /* transformer.is.re variable */) = ((cos((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* G1.machine.delta STATE(1) */))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */)) - (((-sin((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* G1.machine.delta STATE(1) */)))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */)))) * ((data->simulationInfo->realParameter[33] /* G1.machine.I_MBtoSB PARAM */));
  TRACE_POP
}
/*
equation index: 61
type: SIMPLE_ASSIGN
G1.machine.vd = G1.machine.e2d - (G1.machine.ra * G1.machine.id - G1.machine.x2q * G1.machine.iq)
*/
void GenIO4HILinNetwork_eqFunction_61(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,61};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[37]] /* G1.machine.vd variable */) = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[3]] /* G1.machine.e2d STATE(1) */) - (((data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */)) - (((data->simulationInfo->realParameter[87] /* G1.machine.x2q PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */))));
  TRACE_POP
}
/*
equation index: 62
type: SIMPLE_ASSIGN
G1.machine.vq = G1.machine.e2q - (G1.machine.ra * G1.machine.iq + G1.machine.x2d * G1.machine.id)
*/
void GenIO4HILinNetwork_eqFunction_62(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,62};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[39]] /* G1.machine.vq variable */) = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[4]] /* G1.machine.e2q STATE(1) */) - (((data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */)) + ((data->simulationInfo->realParameter[86] /* G1.machine.x2d PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */)));
  TRACE_POP
}
/*
equation index: 63
type: SIMPLE_ASSIGN
transformer.vs.re = (sin(G1.machine.delta) * G1.machine.vd + cos(G1.machine.delta) * G1.machine.vq) * G1.machine.V_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_63(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,63};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */) = ((sin((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* G1.machine.delta STATE(1) */))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[37]] /* G1.machine.vd variable */)) + (cos((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* G1.machine.delta STATE(1) */))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[39]] /* G1.machine.vq variable */))) * ((data->simulationInfo->realParameter[51] /* G1.machine.V_MBtoSB PARAM */));
  TRACE_POP
}
/*
equation index: 64
type: SIMPLE_ASSIGN
pwLine2.vs.re = (transformer.vs.re / transformer.m ^ 2.0 - (transformer.r * transformer.is.re - transformer.x * transformer.is.im)) * transformer.m
*/
void GenIO4HILinNetwork_eqFunction_64(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,64};
  modelica_real tmp0;
  tmp0 = (data->simulationInfo->realParameter[134] /* transformer.m PARAM */);
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) = (DIVISION_SIM((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */),(tmp0 * tmp0),"transformer.m ^ 2.0",equationIndexes) - (((data->simulationInfo->realParameter[135] /* transformer.r PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[75]] /* transformer.is.re variable */)) - (((data->simulationInfo->realParameter[137] /* transformer.x PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[74]] /* transformer.is.im variable */))))) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */));
  TRACE_POP
}
/*
equation index: 65
type: SIMPLE_ASSIGN
transformer.vs.im = (sin(G1.machine.delta) * G1.machine.vq - cos(G1.machine.delta) * G1.machine.vd) * G1.machine.V_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_65(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,65};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */) = ((sin((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* G1.machine.delta STATE(1) */))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[39]] /* G1.machine.vq variable */)) - ((cos((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* G1.machine.delta STATE(1) */))) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[37]] /* G1.machine.vd variable */)))) * ((data->simulationInfo->realParameter[51] /* G1.machine.V_MBtoSB PARAM */));
  TRACE_POP
}
/*
equation index: 66
type: SIMPLE_ASSIGN
pwLine2.vs.im = (transformer.vs.im / transformer.m ^ 2.0 - (transformer.r * transformer.is.im + transformer.x * transformer.is.re)) * transformer.m
*/
void GenIO4HILinNetwork_eqFunction_66(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,66};
  modelica_real tmp0;
  tmp0 = (data->simulationInfo->realParameter[134] /* transformer.m PARAM */);
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */) = (DIVISION_SIM((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */),(tmp0 * tmp0),"transformer.m ^ 2.0",equationIndexes) - (((data->simulationInfo->realParameter[135] /* transformer.r PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[74]] /* transformer.is.im variable */)) + ((data->simulationInfo->realParameter[137] /* transformer.x PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[75]] /* transformer.is.re variable */)))) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */));
  TRACE_POP
}
/*
equation index: 67
type: SIMPLE_ASSIGN
transformer.ir.re = (pwLine2.vs.im - transformer.vs.im / transformer.m - transformer.r * transformer.ir.im) / transformer.x
*/
void GenIO4HILinNetwork_eqFunction_67(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,67};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[73]] /* transformer.ir.re variable */) = DIVISION_SIM((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */) - (DIVISION_SIM((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[76]] /* transformer.vs.im variable */),(data->simulationInfo->realParameter[134] /* transformer.m PARAM */),"transformer.m",equationIndexes)) - (((data->simulationInfo->realParameter[135] /* transformer.r PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[72]] /* transformer.ir.im variable */))),(data->simulationInfo->realParameter[137] /* transformer.x PARAM */),"transformer.x",equationIndexes);
  TRACE_POP
}
/*
equation index: 68
type: SIMPLE_ASSIGN
pwFault.p.ir = (-pwLine2.is.re) - pwLine1.is.re - transformer.ir.re
*/
void GenIO4HILinNetwork_eqFunction_68(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,68};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[49]] /* pwFault.p.ir variable */) = (-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */)) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[73]] /* transformer.ir.re variable */);
  TRACE_POP
}
/*
equation index: 69
type: SIMPLE_ASSIGN
pwFault.p.ii = (-pwLine2.is.im) - pwLine1.is.im - transformer.ir.im
*/
void GenIO4HILinNetwork_eqFunction_69(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,69};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[48]] /* pwFault.p.ii variable */) = (-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */)) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[72]] /* transformer.ir.im variable */);
  TRACE_POP
}

void residualFunc99(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,99};
  ANALYTIC_JACOBIAN* jacobian = NULL;
  modelica_boolean tmp0;
  modelica_boolean tmp1;
  modelica_boolean tmp2;
  modelica_real tmp3;
  modelica_real tmp4;
  modelica_boolean tmp5;
  modelica_real tmp6;
  modelica_boolean tmp7;
  modelica_real tmp8;
  modelica_boolean tmp9;
  modelica_real tmp10;
  modelica_boolean tmp11;
  modelica_boolean tmp12;
  modelica_boolean tmp13;
  modelica_boolean tmp14;
  modelica_boolean tmp15;
  modelica_boolean tmp16;
  modelica_boolean tmp17;
  modelica_boolean tmp18;
  modelica_boolean tmp19;
  modelica_boolean tmp20;
  modelica_boolean tmp21;
  modelica_real tmp22;
  modelica_real tmp23;
  modelica_boolean tmp24;
  modelica_real tmp25;
  modelica_boolean tmp26;
  modelica_real tmp27;
  modelica_boolean tmp28;
  modelica_real tmp29;
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */) = xloc[0];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */) = xloc[1];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */) = xloc[2];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */) = xloc[3];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[72]] /* transformer.ir.im variable */) = xloc[4];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */) = xloc[5];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */) = xloc[6];
  /* local constraints */
  GenIO4HILinNetwork_eqFunction_57(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_58(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_59(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_60(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_61(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_62(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_63(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_64(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_65(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_66(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_67(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_68(data, threadData);

  /* local constraints */
  GenIO4HILinNetwork_eqFunction_69(data, threadData);
  tmp0 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */));
  tmp9 = (modelica_boolean)tmp0;
  if(tmp9)
  {
    tmp10 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[49]] /* pwFault.p.ir variable */);
  }
  else
  {
    tmp1 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
    tmp7 = (modelica_boolean)(tmp1 && (data->simulationInfo->booleanParameter[54] /* pwFault.ground PARAM */));
    if(tmp7)
    {
      tmp8 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */);
    }
    else
    {
      tmp2 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
      tmp5 = (modelica_boolean)tmp2;
      if(tmp5)
      {
        tmp3 = (data->simulationInfo->realParameter[102] /* pwFault.R PARAM */);
        tmp4 = (data->simulationInfo->realParameter[103] /* pwFault.X PARAM */);
        tmp6 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[49]] /* pwFault.p.ir variable */) - (DIVISION_SIM(((data->simulationInfo->realParameter[102] /* pwFault.R PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) + ((data->simulationInfo->realParameter[103] /* pwFault.X PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)),(tmp3 * tmp3) + (tmp4 * tmp4),"pwFault.R ^ 2.0 + pwFault.X ^ 2.0",equationIndexes));
      }
      else
      {
        tmp6 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[49]] /* pwFault.p.ir variable */);
      }
      tmp8 = tmp6;
    }
    tmp10 = tmp8;
  }
  res[0] = tmp10;

  tmp11 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  tmp12 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  res[1] = ((tmp11 && tmp12)?(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */):(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */) - (((data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))) - (((data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */) + ((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */))) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))))));

  tmp13 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[126] /* pwLine2.t1 PARAM */));
  tmp14 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[127] /* pwLine2.t2 PARAM */));
  res[2] = ((tmp13 && tmp14)?(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */):(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */) - (((data->simulationInfo->realParameter[125] /* pwLine2.Z.re PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */) + ((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */))) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */)))) + ((data->simulationInfo->realParameter[124] /* pwLine2.Z.im PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[122] /* pwLine2.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) * ((data->simulationInfo->realParameter[123] /* pwLine2.Y.re PARAM */))))));

  tmp15 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  tmp16 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  res[3] = ((tmp15 && tmp16)?(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */):(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */) - (((data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))) - (((data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */) + ((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */))) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))))));

  res[4] = ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */)) + ((data->simulationInfo->realParameter[137] /* transformer.x PARAM */)) * (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[72]] /* transformer.ir.im variable */)) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */))) - (((data->simulationInfo->realParameter[135] /* transformer.r PARAM */)) * (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[73]] /* transformer.ir.re variable */)) * ((data->simulationInfo->realParameter[134] /* transformer.m PARAM */)))) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[77]] /* transformer.vs.re variable */);

  tmp17 = GreaterEq(data->localData[0]->timeValue,(data->simulationInfo->realParameter[115] /* pwLine1.t1 PARAM */));
  tmp18 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[116] /* pwLine1.t2 PARAM */));
  res[5] = ((tmp17 && tmp18)?(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */):(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */) - (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */) - (((data->simulationInfo->realParameter[114] /* pwLine1.Z.re PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */) + ((-(data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */))) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */)))) + ((data->simulationInfo->realParameter[113] /* pwLine1.Z.im PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */) + ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) * ((data->simulationInfo->realParameter[111] /* pwLine1.Y.im PARAM */)) - (((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */)) * ((data->simulationInfo->realParameter[112] /* pwLine1.Y.re PARAM */))))));

  tmp19 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[104] /* pwFault.t1 PARAM */));
  tmp28 = (modelica_boolean)tmp19;
  if(tmp28)
  {
    tmp29 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[48]] /* pwFault.p.ii variable */);
  }
  else
  {
    tmp20 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
    tmp26 = (modelica_boolean)(tmp20 && (data->simulationInfo->booleanParameter[54] /* pwFault.ground PARAM */));
    if(tmp26)
    {
      tmp27 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */) - 1e-10;
    }
    else
    {
      tmp21 = Less(data->localData[0]->timeValue,(data->simulationInfo->realParameter[105] /* pwFault.t2 PARAM */));
      tmp24 = (modelica_boolean)tmp21;
      if(tmp24)
      {
        tmp22 = (data->simulationInfo->realParameter[103] /* pwFault.X PARAM */);
        tmp23 = (data->simulationInfo->realParameter[102] /* pwFault.R PARAM */);
        tmp25 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[48]] /* pwFault.p.ii variable */) - (DIVISION_SIM(((data->simulationInfo->realParameter[102] /* pwFault.R PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[66]] /* pwLine2.vs.im variable */)) - (((data->simulationInfo->realParameter[103] /* pwFault.X PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[67]] /* pwLine2.vs.re variable */))),(tmp22 * tmp22) + (tmp23 * tmp23),"pwFault.X ^ 2.0 + pwFault.R ^ 2.0",equationIndexes));
      }
      else
      {
        tmp25 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[48]] /* pwFault.p.ii variable */);
      }
      tmp27 = tmp25;
    }
    tmp29 = tmp27;
  }
  res[6] = tmp29;
  TRACE_POP
}
OMC_DISABLE_OPT
void initializeStaticLSData99(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData, modelica_boolean initSparsePattern)
{
  const int indices[7] = {
    56 /* pwLine1.is.im */,
    64 /* pwLine2.is.im */,
    57 /* pwLine1.is.re */,
    65 /* pwLine2.is.re */,
    72 /* transformer.ir.im */,
    34 /* G1.machine.id */,
    35 /* G1.machine.iq */
  };
  for (int i = 0; i < 7; ++i) {
    linearSystemData->nominal[i] = data->modelData->realVarsData[indices[i]].attribute.nominal;
    linearSystemData->min[i]     = data->modelData->realVarsData[indices[i]].attribute.min;
    linearSystemData->max[i]     = data->modelData->realVarsData[indices[i]].attribute.max;
  }
}

/* Prototypes for the strict sets (Dynamic Tearing) */

/* Global constraints for the casual sets */
/* function initialize linear systems */
void GenIO4HILinNetwork_initialLinearSystem(int nLinearSystems, LINEAR_SYSTEM_DATA* linearSystemData)
{
  /* linear systems */
  assertStreamPrint(NULL, nLinearSystems > 5, "Internal Error: nLinearSystems mismatch!");
  linearSystemData[5].equationIndex = 193;
  linearSystemData[5].size = 2;
  linearSystemData[5].nnz = 4;
  linearSystemData[5].method = 0;   /* No symbolic Jacobian available */
  linearSystemData[5].strictTearingFunctionCall = NULL;
  linearSystemData[5].setA = setLinearMatrixA193;
  linearSystemData[5].setb = setLinearVectorb193;
  linearSystemData[5].initializeStaticLSData = initializeStaticLSData193;
  
  assertStreamPrint(NULL, nLinearSystems > 4, "Internal Error: nLinearSystems mismatch!");
  linearSystemData[4].equationIndex = 188;
  linearSystemData[4].size = 2;
  linearSystemData[4].nnz = 4;
  linearSystemData[4].method = 0;   /* No symbolic Jacobian available */
  linearSystemData[4].strictTearingFunctionCall = NULL;
  linearSystemData[4].setA = setLinearMatrixA188;
  linearSystemData[4].setb = setLinearVectorb188;
  linearSystemData[4].initializeStaticLSData = initializeStaticLSData188;
  
  assertStreamPrint(NULL, nLinearSystems > 3, "Internal Error: indexlinearSystem mismatch!");
  linearSystemData[3].equationIndex = 186;
  linearSystemData[3].size = 9;
  linearSystemData[3].nnz = 0;
  linearSystemData[3].method = 1;   /* Symbolic Jacobian available */
  linearSystemData[3].residualFunc = residualFunc186;
  linearSystemData[3].strictTearingFunctionCall = NULL;
  linearSystemData[3].analyticalJacobianColumn = GenIO4HILinNetwork_functionJacLSJac1_column;
  linearSystemData[3].initialAnalyticalJacobian = GenIO4HILinNetwork_initialAnalyticJacobianLSJac1;
  linearSystemData[3].jacobianIndex = 1 /*jacInx*/;
  linearSystemData[3].setA = NULL;  //setLinearMatrixA186;
  linearSystemData[3].setb = NULL;  //setLinearVectorb186;
  linearSystemData[3].initializeStaticLSData = initializeStaticLSData186;
  
  assertStreamPrint(NULL, nLinearSystems > 2, "Internal Error: nLinearSystems mismatch!");
  linearSystemData[2].equationIndex = 107;
  linearSystemData[2].size = 2;
  linearSystemData[2].nnz = 4;
  linearSystemData[2].method = 0;   /* No symbolic Jacobian available */
  linearSystemData[2].strictTearingFunctionCall = NULL;
  linearSystemData[2].setA = setLinearMatrixA107;
  linearSystemData[2].setb = setLinearVectorb107;
  linearSystemData[2].initializeStaticLSData = initializeStaticLSData107;
  
  assertStreamPrint(NULL, nLinearSystems > 1, "Internal Error: nLinearSystems mismatch!");
  linearSystemData[1].equationIndex = 102;
  linearSystemData[1].size = 2;
  linearSystemData[1].nnz = 4;
  linearSystemData[1].method = 0;   /* No symbolic Jacobian available */
  linearSystemData[1].strictTearingFunctionCall = NULL;
  linearSystemData[1].setA = setLinearMatrixA102;
  linearSystemData[1].setb = setLinearVectorb102;
  linearSystemData[1].initializeStaticLSData = initializeStaticLSData102;
  
  assertStreamPrint(NULL, nLinearSystems > 0, "Internal Error: indexlinearSystem mismatch!");
  linearSystemData[0].equationIndex = 99;
  linearSystemData[0].size = 7;
  linearSystemData[0].nnz = 0;
  linearSystemData[0].method = 1;   /* Symbolic Jacobian available */
  linearSystemData[0].residualFunc = residualFunc99;
  linearSystemData[0].strictTearingFunctionCall = NULL;
  linearSystemData[0].analyticalJacobianColumn = GenIO4HILinNetwork_functionJacLSJac0_column;
  linearSystemData[0].initialAnalyticalJacobian = GenIO4HILinNetwork_initialAnalyticJacobianLSJac0;
  linearSystemData[0].jacobianIndex = 0 /*jacInx*/;
  linearSystemData[0].setA = NULL;  //setLinearMatrixA99;
  linearSystemData[0].setb = NULL;  //setLinearVectorb99;
  linearSystemData[0].initializeStaticLSData = initializeStaticLSData99;
}

#if defined(__cplusplus)
}
#endif

