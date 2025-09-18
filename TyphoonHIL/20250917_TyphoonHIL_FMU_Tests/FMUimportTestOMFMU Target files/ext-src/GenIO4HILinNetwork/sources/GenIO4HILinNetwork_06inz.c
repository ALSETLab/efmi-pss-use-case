/* Initialization */
#include "GenIO4HILinNetwork_model.h"
#include "GenIO4HILinNetwork_11mix.h"
#include "GenIO4HILinNetwork_12jac.h"
#if defined(__cplusplus)
extern "C" {
#endif

void GenIO4HILinNetwork_functionInitialEquations_0(DATA *data, threadData_t *threadData);

/*
equation index: 1
type: SIMPLE_ASSIGN
G1.machine.Vt0.re = G1.machine.v_0 * cos(G1.machine.angle_0)
*/
void GenIO4HILinNetwork_eqFunction_1(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1};
  (data->simulationInfo->realParameter[57] /* G1.machine.Vt0.re PARAM */) = ((data->simulationInfo->realParameter[76] /* G1.machine.v_0 PARAM */)) * (cos((data->simulationInfo->realParameter[59] /* G1.machine.angle_0 PARAM */)));
  TRACE_POP
}

/*
equation index: 2
type: SIMPLE_ASSIGN
G1.machine.Vt0.im = G1.machine.v_0 * sin(G1.machine.angle_0)
*/
void GenIO4HILinNetwork_eqFunction_2(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,2};
  (data->simulationInfo->realParameter[56] /* G1.machine.Vt0.im PARAM */) = ((data->simulationInfo->realParameter[76] /* G1.machine.v_0 PARAM */)) * (sin((data->simulationInfo->realParameter[59] /* G1.machine.angle_0 PARAM */)));
  TRACE_POP
}

/*
equation index: 3
type: SIMPLE_ASSIGN
G1.machine.I0.im = (G1.machine.S0.im * G1.machine.Vt0.re + G1.machine.S0.re * G1.machine.Vt0.im) / (G1.machine.Vt0.re ^ 2.0 + G1.machine.Vt0.im ^ 2.0)
*/
void GenIO4HILinNetwork_eqFunction_3(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3};
  modelica_real tmp0;
  modelica_real tmp1;
  tmp0 = (data->simulationInfo->realParameter[57] /* G1.machine.Vt0.re PARAM */);
  tmp1 = (data->simulationInfo->realParameter[56] /* G1.machine.Vt0.im PARAM */);
  (data->simulationInfo->realParameter[31] /* G1.machine.I0.im PARAM */) = DIVISION_SIM(((data->simulationInfo->realParameter[41] /* G1.machine.S0.im PARAM */)) * ((data->simulationInfo->realParameter[57] /* G1.machine.Vt0.re PARAM */)) + ((data->simulationInfo->realParameter[42] /* G1.machine.S0.re PARAM */)) * ((data->simulationInfo->realParameter[56] /* G1.machine.Vt0.im PARAM */)),(tmp0 * tmp0) + (tmp1 * tmp1),"G1.machine.Vt0.re ^ 2.0 + G1.machine.Vt0.im ^ 2.0",equationIndexes);
  TRACE_POP
}

/*
equation index: 4
type: SIMPLE_ASSIGN
G1.machine.I0.re = (G1.machine.S0.re * G1.machine.Vt0.re - G1.machine.S0.im * G1.machine.Vt0.im) / (G1.machine.Vt0.re ^ 2.0 + G1.machine.Vt0.im ^ 2.0)
*/
void GenIO4HILinNetwork_eqFunction_4(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4};
  modelica_real tmp2;
  modelica_real tmp3;
  tmp2 = (data->simulationInfo->realParameter[57] /* G1.machine.Vt0.re PARAM */);
  tmp3 = (data->simulationInfo->realParameter[56] /* G1.machine.Vt0.im PARAM */);
  (data->simulationInfo->realParameter[32] /* G1.machine.I0.re PARAM */) = DIVISION_SIM(((data->simulationInfo->realParameter[42] /* G1.machine.S0.re PARAM */)) * ((data->simulationInfo->realParameter[57] /* G1.machine.Vt0.re PARAM */)) - (((data->simulationInfo->realParameter[41] /* G1.machine.S0.im PARAM */)) * ((data->simulationInfo->realParameter[56] /* G1.machine.Vt0.im PARAM */))),(tmp2 * tmp2) + (tmp3 * tmp3),"G1.machine.Vt0.re ^ 2.0 + G1.machine.Vt0.im ^ 2.0",equationIndexes);
  TRACE_POP
}

/*
equation index: 5
type: SIMPLE_ASSIGN
infiniteBus.p.vr = infiniteBus.v_0 * cos(infiniteBus.angle_0)
*/
void GenIO4HILinNetwork_eqFunction_5(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,5};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */) = ((data->simulationInfo->realParameter[101] /* infiniteBus.v_0 PARAM */)) * (cos((data->simulationInfo->realParameter[99] /* infiniteBus.angle_0 PARAM */)));
  TRACE_POP
}

/*
equation index: 6
type: SIMPLE_ASSIGN
infiniteBus.p.vi = infiniteBus.v_0 * sin(infiniteBus.angle_0)
*/
void GenIO4HILinNetwork_eqFunction_6(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */) = ((data->simulationInfo->realParameter[101] /* infiniteBus.v_0 PARAM */)) * (sin((data->simulationInfo->realParameter[99] /* infiniteBus.angle_0 PARAM */)));
  TRACE_POP
}

/*
equation index: 7
type: SIMPLE_ASSIGN
B3.v = sqrt(infiniteBus.p.vr ^ 2.0 + infiniteBus.p.vi ^ 2.0)
*/
void GenIO4HILinNetwork_eqFunction_7(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,7};
  modelica_real tmp4;
  modelica_real tmp5;
  modelica_real tmp6;
  tmp4 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */);
  tmp5 = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */);
  tmp6 = (tmp4 * tmp4) + (tmp5 * tmp5);
  if(!(tmp6 >= 0.0))
  {
    if (data->simulationInfo->noThrowAsserts) {
      FILE_INFO info = {"",0,0,0,0,0};
      infoStreamPrintWithEquationIndexes(OMC_LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f", initial() ? "during initialization " : "", data->localData[0]->timeValue);
      data->simulationInfo->needToReThrow = 1;
    } else {
      FILE_INFO info = {"",0,0,0,0,0};
      omc_assert_warning(info, "The following assertion has been violated %sat time %f", initial() ? "during initialization " : "", data->localData[0]->timeValue);
      throwStreamPrintWithEquationIndexes(threadData, info, equationIndexes, "Model error: Argument of sqrt(infiniteBus.p.vr ^ 2.0 + infiniteBus.p.vi ^ 2.0) was %g should be >= 0", tmp6);
    }
  }
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[28]] /* B3.v variable */) = sqrt(tmp6);
  TRACE_POP
}

/*
equation index: 8
type: SIMPLE_ASSIGN
B3.angle = atan2(infiniteBus.p.vi, infiniteBus.p.vr)
*/
void GenIO4HILinNetwork_eqFunction_8(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,8};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[24]] /* B3.angle variable */) = atan2((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[46]] /* infiniteBus.p.vi variable */), (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[47]] /* infiniteBus.p.vr variable */));
  TRACE_POP
}

/*
equation index: 9
type: SIMPLE_ASSIGN
B3.angleDisplay = 57.29577951308232 * B3.angle
*/
void GenIO4HILinNetwork_eqFunction_9(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,9};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[25]] /* B3.angleDisplay variable */) = (57.29577951308232) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[24]] /* B3.angle variable */));
  TRACE_POP
}

/*
equation index: 10
type: SIMPLE_ASSIGN
G1.machine.vr0 = G1.machine.Vt0.re
*/
void GenIO4HILinNetwork_eqFunction_10(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,10};
  (data->simulationInfo->realParameter[82] /* G1.machine.vr0 PARAM */) = (data->simulationInfo->realParameter[57] /* G1.machine.Vt0.re PARAM */);
  TRACE_POP
}

/*
equation index: 11
type: SIMPLE_ASSIGN
G1.machine.vi0 = G1.machine.Vt0.im
*/
void GenIO4HILinNetwork_eqFunction_11(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,11};
  (data->simulationInfo->realParameter[80] /* G1.machine.vi0 PARAM */) = (data->simulationInfo->realParameter[56] /* G1.machine.Vt0.im PARAM */);
  TRACE_POP
}

/*
equation index: 12
type: SIMPLE_ASSIGN
G1.machine.ir0 = -G1.machine.I0.re
*/
void GenIO4HILinNetwork_eqFunction_12(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,12};
  (data->simulationInfo->realParameter[69] /* G1.machine.ir0 PARAM */) = (-(data->simulationInfo->realParameter[32] /* G1.machine.I0.re PARAM */));
  TRACE_POP
}

/*
equation index: 13
type: SIMPLE_ASSIGN
G1.machine.ii0 = -G1.machine.I0.im
*/
void GenIO4HILinNetwork_eqFunction_13(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,13};
  (data->simulationInfo->realParameter[67] /* G1.machine.ii0 PARAM */) = (-(data->simulationInfo->realParameter[31] /* G1.machine.I0.im PARAM */));
  TRACE_POP
}

/*
equation index: 14
type: SIMPLE_ASSIGN
G1.machine.delta0 = Modelica.Math.atan3(G1.machine.Vt0.im + (G1.machine.ra * G1.machine.I0.im + G1.machine.xq0 * G1.machine.I0.re) * G1.machine.Z_MBtoSB, G1.machine.Vt0.re + (G1.machine.ra * G1.machine.I0.re - G1.machine.xq0 * G1.machine.I0.im) * G1.machine.Z_MBtoSB, 0.0)
*/
void GenIO4HILinNetwork_eqFunction_14(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,14};
  (data->simulationInfo->realParameter[60] /* G1.machine.delta0 PARAM */) = omc_Modelica_Math_atan3(threadData, (data->simulationInfo->realParameter[56] /* G1.machine.Vt0.im PARAM */) + (((data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */)) * ((data->simulationInfo->realParameter[31] /* G1.machine.I0.im PARAM */)) + ((data->simulationInfo->realParameter[90] /* G1.machine.xq0 PARAM */)) * ((data->simulationInfo->realParameter[32] /* G1.machine.I0.re PARAM */))) * ((data->simulationInfo->realParameter[58] /* G1.machine.Z_MBtoSB PARAM */)), (data->simulationInfo->realParameter[57] /* G1.machine.Vt0.re PARAM */) + (((data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */)) * ((data->simulationInfo->realParameter[32] /* G1.machine.I0.re PARAM */)) - (((data->simulationInfo->realParameter[90] /* G1.machine.xq0 PARAM */)) * ((data->simulationInfo->realParameter[31] /* G1.machine.I0.im PARAM */)))) * ((data->simulationInfo->realParameter[58] /* G1.machine.Z_MBtoSB PARAM */)), 0.0);
  TRACE_POP
}

/*
equation index: 15
type: SIMPLE_ASSIGN
G1.machine.Vdq0.im = G1.machine.Vt0.re * sin(1.5707963267948966 - G1.machine.delta0) / G1.machine.V_MBtoSB + G1.machine.Vt0.im * cos(1.5707963267948966 - G1.machine.delta0) / G1.machine.V_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_15(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,15};
  (data->simulationInfo->realParameter[53] /* G1.machine.Vdq0.im PARAM */) = ((data->simulationInfo->realParameter[57] /* G1.machine.Vt0.re PARAM */)) * (DIVISION_SIM(sin(1.5707963267948966 - (data->simulationInfo->realParameter[60] /* G1.machine.delta0 PARAM */)),(data->simulationInfo->realParameter[51] /* G1.machine.V_MBtoSB PARAM */),"G1.machine.V_MBtoSB",equationIndexes)) + ((data->simulationInfo->realParameter[56] /* G1.machine.Vt0.im PARAM */)) * (DIVISION_SIM(cos(1.5707963267948966 - (data->simulationInfo->realParameter[60] /* G1.machine.delta0 PARAM */)),(data->simulationInfo->realParameter[51] /* G1.machine.V_MBtoSB PARAM */),"G1.machine.V_MBtoSB",equationIndexes));
  TRACE_POP
}

/*
equation index: 16
type: SIMPLE_ASSIGN
G1.machine.Vdq0.re = G1.machine.Vt0.re * cos(1.5707963267948966 - G1.machine.delta0) / G1.machine.V_MBtoSB - G1.machine.Vt0.im * sin(1.5707963267948966 - G1.machine.delta0) / G1.machine.V_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_16(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,16};
  (data->simulationInfo->realParameter[54] /* G1.machine.Vdq0.re PARAM */) = ((data->simulationInfo->realParameter[57] /* G1.machine.Vt0.re PARAM */)) * (DIVISION_SIM(cos(1.5707963267948966 - (data->simulationInfo->realParameter[60] /* G1.machine.delta0 PARAM */)),(data->simulationInfo->realParameter[51] /* G1.machine.V_MBtoSB PARAM */),"G1.machine.V_MBtoSB",equationIndexes)) - (((data->simulationInfo->realParameter[56] /* G1.machine.Vt0.im PARAM */)) * (DIVISION_SIM(sin(1.5707963267948966 - (data->simulationInfo->realParameter[60] /* G1.machine.delta0 PARAM */)),(data->simulationInfo->realParameter[51] /* G1.machine.V_MBtoSB PARAM */),"G1.machine.V_MBtoSB",equationIndexes)));
  TRACE_POP
}

/*
equation index: 17
type: SIMPLE_ASSIGN
G1.machine.Idq0.im = G1.machine.I0.re * sin(1.5707963267948966 - G1.machine.delta0) / G1.machine.I_MBtoSB + G1.machine.I0.im * cos(1.5707963267948966 - G1.machine.delta0) / G1.machine.I_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_17(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,17};
  (data->simulationInfo->realParameter[34] /* G1.machine.Idq0.im PARAM */) = ((data->simulationInfo->realParameter[32] /* G1.machine.I0.re PARAM */)) * (DIVISION_SIM(sin(1.5707963267948966 - (data->simulationInfo->realParameter[60] /* G1.machine.delta0 PARAM */)),(data->simulationInfo->realParameter[33] /* G1.machine.I_MBtoSB PARAM */),"G1.machine.I_MBtoSB",equationIndexes)) + ((data->simulationInfo->realParameter[31] /* G1.machine.I0.im PARAM */)) * (DIVISION_SIM(cos(1.5707963267948966 - (data->simulationInfo->realParameter[60] /* G1.machine.delta0 PARAM */)),(data->simulationInfo->realParameter[33] /* G1.machine.I_MBtoSB PARAM */),"G1.machine.I_MBtoSB",equationIndexes));
  TRACE_POP
}

/*
equation index: 18
type: SIMPLE_ASSIGN
G1.machine.Idq0.re = G1.machine.I0.re * cos(1.5707963267948966 - G1.machine.delta0) / G1.machine.I_MBtoSB - G1.machine.I0.im * sin(1.5707963267948966 - G1.machine.delta0) / G1.machine.I_MBtoSB
*/
void GenIO4HILinNetwork_eqFunction_18(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,18};
  (data->simulationInfo->realParameter[35] /* G1.machine.Idq0.re PARAM */) = ((data->simulationInfo->realParameter[32] /* G1.machine.I0.re PARAM */)) * (DIVISION_SIM(cos(1.5707963267948966 - (data->simulationInfo->realParameter[60] /* G1.machine.delta0 PARAM */)),(data->simulationInfo->realParameter[33] /* G1.machine.I_MBtoSB PARAM */),"G1.machine.I_MBtoSB",equationIndexes)) - (((data->simulationInfo->realParameter[31] /* G1.machine.I0.im PARAM */)) * (DIVISION_SIM(sin(1.5707963267948966 - (data->simulationInfo->realParameter[60] /* G1.machine.delta0 PARAM */)),(data->simulationInfo->realParameter[33] /* G1.machine.I_MBtoSB PARAM */),"G1.machine.I_MBtoSB",equationIndexes)));
  TRACE_POP
}

/*
equation index: 19
type: SIMPLE_ASSIGN
G1.machine.iq0 = G1.machine.Idq0.im
*/
void GenIO4HILinNetwork_eqFunction_19(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,19};
  (data->simulationInfo->realParameter[68] /* G1.machine.iq0 PARAM */) = (data->simulationInfo->realParameter[34] /* G1.machine.Idq0.im PARAM */);
  TRACE_POP
}

/*
equation index: 20
type: SIMPLE_ASSIGN
G1.machine.e1d0 = (G1.machine.xq + (-G1.machine.x1q) - G1.machine.T2q0 * G1.machine.x2q * (G1.machine.xq - G1.machine.x1q) / (G1.machine.x1q * G1.machine.T1q0)) * G1.machine.iq0
*/
void GenIO4HILinNetwork_eqFunction_20(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,20};
  (data->simulationInfo->realParameter[61] /* G1.machine.e1d0 PARAM */) = ((data->simulationInfo->realParameter[89] /* G1.machine.xq PARAM */) + (-(data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */)) - (((data->simulationInfo->realParameter[49] /* G1.machine.T2q0 PARAM */)) * (((data->simulationInfo->realParameter[87] /* G1.machine.x2q PARAM */)) * (DIVISION_SIM((data->simulationInfo->realParameter[89] /* G1.machine.xq PARAM */) - (data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */),((data->simulationInfo->realParameter[85] /* G1.machine.x1q PARAM */)) * ((data->simulationInfo->realParameter[47] /* G1.machine.T1q0 PARAM */)),"G1.machine.x1q * G1.machine.T1q0",equationIndexes))))) * ((data->simulationInfo->realParameter[68] /* G1.machine.iq0 PARAM */));
  TRACE_POP
}

/*
equation index: 21
type: SIMPLE_ASSIGN
G1.machine.id0 = G1.machine.Idq0.re
*/
void GenIO4HILinNetwork_eqFunction_21(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,21};
  (data->simulationInfo->realParameter[66] /* G1.machine.id0 PARAM */) = (data->simulationInfo->realParameter[35] /* G1.machine.Idq0.re PARAM */);
  TRACE_POP
}

/*
equation index: 22
type: SIMPLE_ASSIGN
G1.machine.vq0 = G1.machine.Vdq0.im
*/
void GenIO4HILinNetwork_eqFunction_22(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,22};
  (data->simulationInfo->realParameter[81] /* G1.machine.vq0 PARAM */) = (data->simulationInfo->realParameter[53] /* G1.machine.Vdq0.im PARAM */);
  TRACE_POP
}

/*
equation index: 23
type: SIMPLE_ASSIGN
G1.machine.e2q0 = G1.machine.vq0 + G1.machine.ra * G1.machine.iq0 + G1.machine.x2d * G1.machine.id0
*/
void GenIO4HILinNetwork_eqFunction_23(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,23};
  (data->simulationInfo->realParameter[64] /* G1.machine.e2q0 PARAM */) = (data->simulationInfo->realParameter[81] /* G1.machine.vq0 PARAM */) + ((data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */)) * ((data->simulationInfo->realParameter[68] /* G1.machine.iq0 PARAM */)) + ((data->simulationInfo->realParameter[86] /* G1.machine.x2d PARAM */)) * ((data->simulationInfo->realParameter[66] /* G1.machine.id0 PARAM */));
  TRACE_POP
}

/*
equation index: 24
type: SIMPLE_ASSIGN
G1.machine.e1q0 = G1.machine.e2q0 + G1.machine.K2 * G1.machine.id0 - G1.machine.Taa * ((G1.machine.K1 + G1.machine.K2) * G1.machine.id0 + G1.machine.e2q0) / G1.machine.T1d0
*/
void GenIO4HILinNetwork_eqFunction_24(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,24};
  (data->simulationInfo->realParameter[62] /* G1.machine.e1q0 PARAM */) = (data->simulationInfo->realParameter[64] /* G1.machine.e2q0 PARAM */) + ((data->simulationInfo->realParameter[37] /* G1.machine.K2 PARAM */)) * ((data->simulationInfo->realParameter[66] /* G1.machine.id0 PARAM */)) - (((data->simulationInfo->realParameter[50] /* G1.machine.Taa PARAM */)) * (DIVISION_SIM(((data->simulationInfo->realParameter[36] /* G1.machine.K1 PARAM */) + (data->simulationInfo->realParameter[37] /* G1.machine.K2 PARAM */)) * ((data->simulationInfo->realParameter[66] /* G1.machine.id0 PARAM */)) + (data->simulationInfo->realParameter[64] /* G1.machine.e2q0 PARAM */),(data->simulationInfo->realParameter[46] /* G1.machine.T1d0 PARAM */),"G1.machine.T1d0",equationIndexes)));
  TRACE_POP
}

/*
equation index: 25
type: SIMPLE_ASSIGN
G1.machine.vf00 = G1.machine.V_MBtoSB * (G1.machine.K1 * G1.machine.id0 + G1.machine.e1q0) / (1.0 - G1.machine.Taa / G1.machine.T1d0)
*/
void GenIO4HILinNetwork_eqFunction_25(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,25};
  (data->simulationInfo->realParameter[79] /* G1.machine.vf00 PARAM */) = ((data->simulationInfo->realParameter[51] /* G1.machine.V_MBtoSB PARAM */)) * (DIVISION_SIM(((data->simulationInfo->realParameter[36] /* G1.machine.K1 PARAM */)) * ((data->simulationInfo->realParameter[66] /* G1.machine.id0 PARAM */)) + (data->simulationInfo->realParameter[62] /* G1.machine.e1q0 PARAM */),1.0 - (DIVISION_SIM((data->simulationInfo->realParameter[50] /* G1.machine.Taa PARAM */),(data->simulationInfo->realParameter[46] /* G1.machine.T1d0 PARAM */),"G1.machine.T1d0",equationIndexes)),"1.0 - G1.machine.Taa / G1.machine.T1d0",equationIndexes));
  TRACE_POP
}

/*
equation index: 26
type: SIMPLE_ASSIGN
$outputAlias_vf0OUT = G1.machine.vf00
*/
void GenIO4HILinNetwork_eqFunction_26(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,26};
  (data->simulationInfo->realParameter[0] /* $outputAlias_vf0OUT PARAM */) = (data->simulationInfo->realParameter[79] /* G1.machine.vf00 PARAM */);
  TRACE_POP
}

/*
equation index: 27
type: SIMPLE_ASSIGN
G1.vf0OUT = G1.machine.vf00
*/
void GenIO4HILinNetwork_eqFunction_27(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,27};
  (data->simulationInfo->realParameter[92] /* G1.vf0OUT PARAM */) = (data->simulationInfo->realParameter[79] /* G1.machine.vf00 PARAM */);
  TRACE_POP
}

/*
equation index: 28
type: SIMPLE_ASSIGN
G1.gainVf0.u = G1.machine.vf00
*/
void GenIO4HILinNetwork_eqFunction_28(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,28};
  (data->simulationInfo->realParameter[29] /* G1.gainVf0.u PARAM */) = (data->simulationInfo->realParameter[79] /* G1.machine.vf00 PARAM */);
  TRACE_POP
}

/*
equation index: 29
type: SIMPLE_ASSIGN
G1.machine.vf0 = G1.machine.vf00
*/
void GenIO4HILinNetwork_eqFunction_29(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,29};
  (data->simulationInfo->realParameter[78] /* G1.machine.vf0 PARAM */) = (data->simulationInfo->realParameter[79] /* G1.machine.vf00 PARAM */);
  TRACE_POP
}

/*
equation index: 30
type: SIMPLE_ASSIGN
G1.gainVf0.y = G1.gainVf0.k * G1.machine.vf00
*/
void GenIO4HILinNetwork_eqFunction_30(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,30};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[32]] /* G1.gainVf0.y variable */) = ((data->simulationInfo->realParameter[28] /* G1.gainVf0.k PARAM */)) * ((data->simulationInfo->realParameter[79] /* G1.machine.vf00 PARAM */));
  TRACE_POP
}
extern void GenIO4HILinNetwork_eqFunction_147(DATA *data, threadData_t *threadData);


/*
equation index: 32
type: SIMPLE_ASSIGN
G1.machine.vd0 = G1.machine.Vdq0.re
*/
void GenIO4HILinNetwork_eqFunction_32(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,32};
  (data->simulationInfo->realParameter[77] /* G1.machine.vd0 PARAM */) = (data->simulationInfo->realParameter[54] /* G1.machine.Vdq0.re PARAM */);
  TRACE_POP
}

/*
equation index: 33
type: SIMPLE_ASSIGN
G1.machine.pm00 = ((G1.machine.vq0 + G1.machine.ra * G1.machine.iq0) * G1.machine.iq0 + (G1.machine.vd0 + G1.machine.ra * G1.machine.id0) * G1.machine.id0) / G1.machine.S_SBtoMB
*/
void GenIO4HILinNetwork_eqFunction_33(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,33};
  (data->simulationInfo->realParameter[73] /* G1.machine.pm00 PARAM */) = DIVISION_SIM(((data->simulationInfo->realParameter[81] /* G1.machine.vq0 PARAM */) + ((data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */)) * ((data->simulationInfo->realParameter[68] /* G1.machine.iq0 PARAM */))) * ((data->simulationInfo->realParameter[68] /* G1.machine.iq0 PARAM */)) + ((data->simulationInfo->realParameter[77] /* G1.machine.vd0 PARAM */) + ((data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */)) * ((data->simulationInfo->realParameter[66] /* G1.machine.id0 PARAM */))) * ((data->simulationInfo->realParameter[66] /* G1.machine.id0 PARAM */)),(data->simulationInfo->realParameter[43] /* G1.machine.S_SBtoMB PARAM */),"G1.machine.S_SBtoMB",equationIndexes);
  TRACE_POP
}

/*
equation index: 34
type: SIMPLE_ASSIGN
G1.machine.pm = G1.machine.pm00
*/
void GenIO4HILinNetwork_eqFunction_34(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,34};
  (data->simulationInfo->realParameter[71] /* G1.machine.pm PARAM */) = (data->simulationInfo->realParameter[73] /* G1.machine.pm00 PARAM */);
  TRACE_POP
}

/*
equation index: 35
type: SIMPLE_ASSIGN
G1.machine.pm0 = G1.machine.pm00
*/
void GenIO4HILinNetwork_eqFunction_35(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,35};
  (data->simulationInfo->realParameter[72] /* G1.machine.pm0 PARAM */) = (data->simulationInfo->realParameter[73] /* G1.machine.pm00 PARAM */);
  TRACE_POP
}

/*
equation index: 36
type: SIMPLE_ASSIGN
G1.machine.e2d0 = G1.machine.vd0 + G1.machine.ra * G1.machine.id0 - G1.machine.x2q * G1.machine.iq0
*/
void GenIO4HILinNetwork_eqFunction_36(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,36};
  (data->simulationInfo->realParameter[63] /* G1.machine.e2d0 PARAM */) = (data->simulationInfo->realParameter[77] /* G1.machine.vd0 PARAM */) + ((data->simulationInfo->realParameter[75] /* G1.machine.ra PARAM */)) * ((data->simulationInfo->realParameter[66] /* G1.machine.id0 PARAM */)) - (((data->simulationInfo->realParameter[87] /* G1.machine.x2q PARAM */)) * ((data->simulationInfo->realParameter[68] /* G1.machine.iq0 PARAM */)));
  TRACE_POP
}

/*
equation index: 37
type: SIMPLE_ASSIGN
$START.G1.machine.delta = G1.machine.delta0
*/
void GenIO4HILinNetwork_eqFunction_37(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,37};
  (data->modelData->realVarsData[0] /* G1.machine.delta STATE(1) */).attribute .start = (data->simulationInfo->realParameter[60] /* G1.machine.delta0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* G1.machine.delta STATE(1) */) = (data->modelData->realVarsData[0] /* G1.machine.delta STATE(1) */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[0].info /* G1.machine.delta */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* G1.machine.delta STATE(1) */));
  TRACE_POP
}

/*
equation index: 38
type: SIMPLE_ASSIGN
G1.machine.delta = $START.G1.machine.delta
*/
void GenIO4HILinNetwork_eqFunction_38(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,38};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* G1.machine.delta STATE(1) */) = (data->modelData->realVarsData[0] /* G1.machine.delta STATE(1) */).attribute .start;
  TRACE_POP
}

/*
equation index: 39
type: SIMPLE_ASSIGN
$START.G1.machine.vd = G1.machine.vd0
*/
void GenIO4HILinNetwork_eqFunction_39(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,39};
  (data->modelData->realVarsData[37] /* G1.machine.vd variable */).attribute .start = (data->simulationInfo->realParameter[77] /* G1.machine.vd0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[37]] /* G1.machine.vd variable */) = (data->modelData->realVarsData[37] /* G1.machine.vd variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[37].info /* G1.machine.vd */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[37]] /* G1.machine.vd variable */));
  TRACE_POP
}

/*
equation index: 40
type: SIMPLE_ASSIGN
$START.G1.machine.vq = G1.machine.vq0
*/
void GenIO4HILinNetwork_eqFunction_40(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,40};
  (data->modelData->realVarsData[39] /* G1.machine.vq variable */).attribute .start = (data->simulationInfo->realParameter[81] /* G1.machine.vq0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[39]] /* G1.machine.vq variable */) = (data->modelData->realVarsData[39] /* G1.machine.vq variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[39].info /* G1.machine.vq */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[39]] /* G1.machine.vq variable */));
  TRACE_POP
}

/*
equation index: 41
type: SIMPLE_ASSIGN
$START.G1.machine.id = G1.machine.id0
*/
void GenIO4HILinNetwork_eqFunction_41(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,41};
  (data->modelData->realVarsData[34] /* G1.machine.id variable */).attribute .start = (data->simulationInfo->realParameter[66] /* G1.machine.id0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */) = (data->modelData->realVarsData[34] /* G1.machine.id variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[34].info /* G1.machine.id */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */));
  TRACE_POP
}

/*
equation index: 42
type: SIMPLE_ASSIGN
$START.G1.machine.iq = G1.machine.iq0
*/
void GenIO4HILinNetwork_eqFunction_42(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,42};
  (data->modelData->realVarsData[35] /* G1.machine.iq variable */).attribute .start = (data->simulationInfo->realParameter[68] /* G1.machine.iq0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */) = (data->modelData->realVarsData[35] /* G1.machine.iq variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[35].info /* G1.machine.iq */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */));
  TRACE_POP
}

/*
equation index: 43
type: SIMPLE_ASSIGN
$START.G1.machine.pe = G1.machine.pm00
*/
void GenIO4HILinNetwork_eqFunction_43(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,43};
  (data->modelData->realVarsData[36] /* G1.machine.pe variable */).attribute .start = (data->simulationInfo->realParameter[73] /* G1.machine.pm00 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[36]] /* G1.machine.pe variable */) = (data->modelData->realVarsData[36] /* G1.machine.pe variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[36].info /* G1.machine.pe */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[36]] /* G1.machine.pe variable */));
  TRACE_POP
}

/*
equation index: 44
type: SIMPLE_ASSIGN
$START.G1.machine.e1q = G1.machine.e1q0
*/
void GenIO4HILinNetwork_eqFunction_44(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,44};
  (data->modelData->realVarsData[2] /* G1.machine.e1q STATE(1) */).attribute .start = (data->simulationInfo->realParameter[62] /* G1.machine.e1q0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[2]] /* G1.machine.e1q STATE(1) */) = (data->modelData->realVarsData[2] /* G1.machine.e1q STATE(1) */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[2].info /* G1.machine.e1q */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[2]] /* G1.machine.e1q STATE(1) */));
  TRACE_POP
}

/*
equation index: 45
type: SIMPLE_ASSIGN
G1.machine.e1q = G1.machine.e1q0
*/
void GenIO4HILinNetwork_eqFunction_45(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,45};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[2]] /* G1.machine.e1q STATE(1) */) = (data->simulationInfo->realParameter[62] /* G1.machine.e1q0 PARAM */);
  TRACE_POP
}

/*
equation index: 46
type: SIMPLE_ASSIGN
$START.G1.machine.e1d = G1.machine.e1d0
*/
void GenIO4HILinNetwork_eqFunction_46(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,46};
  (data->modelData->realVarsData[1] /* G1.machine.e1d STATE(1) */).attribute .start = (data->simulationInfo->realParameter[61] /* G1.machine.e1d0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[1]] /* G1.machine.e1d STATE(1) */) = (data->modelData->realVarsData[1] /* G1.machine.e1d STATE(1) */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[1].info /* G1.machine.e1d */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[1]] /* G1.machine.e1d STATE(1) */));
  TRACE_POP
}

/*
equation index: 47
type: SIMPLE_ASSIGN
$START.G1.machine.e2q = G1.machine.e2q0
*/
void GenIO4HILinNetwork_eqFunction_47(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,47};
  (data->modelData->realVarsData[4] /* G1.machine.e2q STATE(1) */).attribute .start = (data->simulationInfo->realParameter[64] /* G1.machine.e2q0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[4]] /* G1.machine.e2q STATE(1) */) = (data->modelData->realVarsData[4] /* G1.machine.e2q STATE(1) */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[4].info /* G1.machine.e2q */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[4]] /* G1.machine.e2q STATE(1) */));
  TRACE_POP
}

/*
equation index: 48
type: SIMPLE_ASSIGN
G1.machine.e2q = G1.machine.e2q0
*/
void GenIO4HILinNetwork_eqFunction_48(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,48};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[4]] /* G1.machine.e2q STATE(1) */) = (data->simulationInfo->realParameter[64] /* G1.machine.e2q0 PARAM */);
  TRACE_POP
}

/*
equation index: 49
type: SIMPLE_ASSIGN
$START.G1.machine.e2d = G1.machine.e2d0
*/
void GenIO4HILinNetwork_eqFunction_49(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,49};
  (data->modelData->realVarsData[3] /* G1.machine.e2d STATE(1) */).attribute .start = (data->simulationInfo->realParameter[63] /* G1.machine.e2d0 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[3]] /* G1.machine.e2d STATE(1) */) = (data->modelData->realVarsData[3] /* G1.machine.e2d STATE(1) */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[3].info /* G1.machine.e2d */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[3]] /* G1.machine.e2d STATE(1) */));
  TRACE_POP
}

/*
equation index: 50
type: SIMPLE_ASSIGN
$START.G1.feedbackVf0.y = G1.machine.vf00
*/
void GenIO4HILinNetwork_eqFunction_50(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,50};
  (data->modelData->realVarsData[31] /* G1.feedbackVf0.y variable */).attribute .start = (data->simulationInfo->realParameter[79] /* G1.machine.vf00 PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[31]] /* G1.feedbackVf0.y variable */) = (data->modelData->realVarsData[31] /* G1.feedbackVf0.y variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[31].info /* G1.feedbackVf0.y */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[31]] /* G1.feedbackVf0.y variable */));
  TRACE_POP
}
extern void GenIO4HILinNetwork_eqFunction_144(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_145(DATA *data, threadData_t *threadData);


/*
equation index: 53
type: SIMPLE_ASSIGN
$START.transformer.is.re = -G1.machine.ir0
*/
void GenIO4HILinNetwork_eqFunction_53(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,53};
  (data->modelData->realVarsData[75] /* transformer.is.re variable */).attribute .start = (-(data->simulationInfo->realParameter[69] /* G1.machine.ir0 PARAM */));
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[75]] /* transformer.is.re variable */) = (data->modelData->realVarsData[75] /* transformer.is.re variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[75].info /* transformer.is.re */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[75]] /* transformer.is.re variable */));
  TRACE_POP
}

/*
equation index: 54
type: SIMPLE_ASSIGN
$START.transformer.is.im = -G1.machine.ii0
*/
void GenIO4HILinNetwork_eqFunction_54(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,54};
  (data->modelData->realVarsData[74] /* transformer.is.im variable */).attribute .start = (-(data->simulationInfo->realParameter[67] /* G1.machine.ii0 PARAM */));
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[74]] /* transformer.is.im variable */) = (data->modelData->realVarsData[74] /* transformer.is.im variable */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[74].info /* transformer.is.im */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[74]] /* transformer.is.im variable */));
  TRACE_POP
}

/*
equation index: 55
type: SIMPLE_ASSIGN
$DER.G1.machine.e2d = 0.0
*/
void GenIO4HILinNetwork_eqFunction_55(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,55};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[9]] /* der(G1.machine.e2d) STATE_DER */) = 0.0;
  TRACE_POP
}

/*
equation index: 56
type: SIMPLE_ASSIGN
$DER.G1.machine.e1d = 0.0
*/
void GenIO4HILinNetwork_eqFunction_56(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,56};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[7]] /* der(G1.machine.e1d) STATE_DER */) = 0.0;
  TRACE_POP
}

/*
equation index: 99
type: LINEAR

<var>pwLine1.is.im</var>
<var>pwLine2.is.im</var>
<var>pwLine1.is.re</var>
<var>pwLine2.is.re</var>
<var>transformer.ir.im</var>
<var>G1.machine.id</var>
<var>G1.machine.iq</var>
<row>

</row>
<matrix>
</matrix>
*/
OMC_DISABLE_OPT
void GenIO4HILinNetwork_eqFunction_99(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,99};
  /* Linear equation system */
  int retValue;
  double aux_x[7] = { (data->localData[1]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[72]] /* transformer.ir.im variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */) };
  if(OMC_ACTIVE_STREAM(OMC_LOG_DT))
  {
    infoStreamPrint(OMC_LOG_DT, 1, "Solving linear system 99 (STRICT TEARING SET if tearing enabled) at time = %18.10e", data->localData[0]->timeValue);
    messageClose(OMC_LOG_DT);
  }
  
  retValue = solve_linear_system(data, threadData, 0, &aux_x[0]);
  
  /* check if solution process was successful */
  if (retValue > 0){
    const int indexes[2] = {1,99};
    throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, indexes, "Solving linear system 99 failed at time=%.15g.\nFor more information please use -lv LOG_LS.", data->localData[0]->timeValue);
  }
  /* write solution */
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[56]] /* pwLine1.is.im variable */) = aux_x[0];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[64]] /* pwLine2.is.im variable */) = aux_x[1];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[57]] /* pwLine1.is.re variable */) = aux_x[2];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[65]] /* pwLine2.is.re variable */) = aux_x[3];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[72]] /* transformer.ir.im variable */) = aux_x[4];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[34]] /* G1.machine.id variable */) = aux_x[5];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[35]] /* G1.machine.iq variable */) = aux_x[6];

  TRACE_POP
}
extern void GenIO4HILinNetwork_eqFunction_222(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_221(DATA *data, threadData_t *threadData);


/*
equation index: 102
type: LINEAR

<var>pwLine2.ir.im</var>
<var>pwLine2.ir.re</var>
<row>
  <cell>if time >= pwLine2.t1 and time < pwLine2.t2 then 0.0 else infiniteBus.p.vr - pwLine2.vs.re - (pwLine2.Z.re * (infiniteBus.p.vi * pwLine2.Y.im - infiniteBus.p.vr * pwLine2.Y.re) - pwLine2.Z.im * ((-infiniteBus.p.vr) * pwLine2.Y.im - infiniteBus.p.vi * pwLine2.Y.re))</cell>
  <cell>if time >= pwLine2.t1 and time < pwLine2.t2 then 0.0 else infiniteBus.p.vi - pwLine2.vs.im - (pwLine2.Z.re * ((-infiniteBus.p.vr) * pwLine2.Y.im - infiniteBus.p.vi * pwLine2.Y.re) + pwLine2.Z.im * (infiniteBus.p.vi * pwLine2.Y.im - infiniteBus.p.vr * pwLine2.Y.re))</cell>
</row>
<matrix>
  <cell row="0" col="0">
    <residual>-(if time >= pwLine2.t1 and time < pwLine2.t2 then 0.0 else pwLine2.Z.im)</residual>
  </cell><cell row="0" col="1">
    <residual>-(if time >= pwLine2.t1 and time < pwLine2.t2 then 1.0 else -pwLine2.Z.re)</residual>
  </cell><cell row="1" col="0">
    <residual>-(if time >= pwLine2.t1 and time < pwLine2.t2 then 1.0 else -pwLine2.Z.re)</residual>
  </cell><cell row="1" col="1">
    <residual>-(if time >= pwLine2.t1 and time < pwLine2.t2 then 0.0 else -pwLine2.Z.im)</residual>
  </cell>
</matrix>
*/
OMC_DISABLE_OPT
void GenIO4HILinNetwork_eqFunction_102(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,102};
  /* Linear equation system */
  int retValue;
  double aux_x[2] = { (data->localData[1]->realVars[data->simulationInfo->realVarsIndex[62]] /* pwLine2.ir.im variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[63]] /* pwLine2.ir.re variable */) };
  if(OMC_ACTIVE_STREAM(OMC_LOG_DT))
  {
    infoStreamPrint(OMC_LOG_DT, 1, "Solving linear system 102 (STRICT TEARING SET if tearing enabled) at time = %18.10e", data->localData[0]->timeValue);
    messageClose(OMC_LOG_DT);
  }
  
  retValue = solve_linear_system(data, threadData, 1, &aux_x[0]);
  
  /* check if solution process was successful */
  if (retValue > 0){
    const int indexes[2] = {1,102};
    throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, indexes, "Solving linear system 102 failed at time=%.15g.\nFor more information please use -lv LOG_LS.", data->localData[0]->timeValue);
  }
  /* write solution */
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[62]] /* pwLine2.ir.im variable */) = aux_x[0];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[63]] /* pwLine2.ir.re variable */) = aux_x[1];

  TRACE_POP
}
extern void GenIO4HILinNetwork_eqFunction_199(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_198(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_201(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_200(DATA *data, threadData_t *threadData);


/*
equation index: 107
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
void GenIO4HILinNetwork_eqFunction_107(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,107};
  /* Linear equation system */
  int retValue;
  double aux_x[2] = { (data->localData[1]->realVars[data->simulationInfo->realVarsIndex[55]] /* pwLine1.ir.re variable */),(data->localData[1]->realVars[data->simulationInfo->realVarsIndex[54]] /* pwLine1.ir.im variable */) };
  if(OMC_ACTIVE_STREAM(OMC_LOG_DT))
  {
    infoStreamPrint(OMC_LOG_DT, 1, "Solving linear system 107 (STRICT TEARING SET if tearing enabled) at time = %18.10e", data->localData[0]->timeValue);
    messageClose(OMC_LOG_DT);
  }
  
  retValue = solve_linear_system(data, threadData, 2, &aux_x[0]);
  
  /* check if solution process was successful */
  if (retValue > 0){
    const int indexes[2] = {1,107};
    throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, indexes, "Solving linear system 107 failed at time=%.15g.\nFor more information please use -lv LOG_LS.", data->localData[0]->timeValue);
  }
  /* write solution */
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[55]] /* pwLine1.ir.re variable */) = aux_x[0];
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[54]] /* pwLine1.ir.im variable */) = aux_x[1];

  TRACE_POP
}
extern void GenIO4HILinNetwork_eqFunction_194(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_190(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_189(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_195(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_197(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_196(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_192(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_191(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_205(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_204(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_202(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_203(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_187(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_215(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_216(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_220(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_219(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_218(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_217(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_206(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_207(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_208(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_209(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_210(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_212(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_211(DATA *data, threadData_t *threadData);


/*
equation index: 134
type: SIMPLE_ASSIGN
B1.p.ir = 0.0
*/
void GenIO4HILinNetwork_eqFunction_134(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,134};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[17]] /* B1.p.ir variable */) = 0.0;
  TRACE_POP
}

/*
equation index: 135
type: SIMPLE_ASSIGN
B1.p.ii = 0.0
*/
void GenIO4HILinNetwork_eqFunction_135(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,135};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[16]] /* B1.p.ii variable */) = 0.0;
  TRACE_POP
}

/*
equation index: 136
type: SIMPLE_ASSIGN
B2.p.ir = 0.0
*/
void GenIO4HILinNetwork_eqFunction_136(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,136};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[22]] /* B2.p.ir variable */) = 0.0;
  TRACE_POP
}

/*
equation index: 137
type: SIMPLE_ASSIGN
B2.p.ii = 0.0
*/
void GenIO4HILinNetwork_eqFunction_137(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,137};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[21]] /* B2.p.ii variable */) = 0.0;
  TRACE_POP
}

/*
equation index: 138
type: SIMPLE_ASSIGN
B3.p.ir = 0.0
*/
void GenIO4HILinNetwork_eqFunction_138(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,138};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[27]] /* B3.p.ir variable */) = 0.0;
  TRACE_POP
}

/*
equation index: 139
type: SIMPLE_ASSIGN
B3.p.ii = 0.0
*/
void GenIO4HILinNetwork_eqFunction_139(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,139};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[26]] /* B3.p.ii variable */) = 0.0;
  TRACE_POP
}

/*
equation index: 140
type: SIMPLE_ASSIGN
G1.machine.w = $START.G1.machine.w
*/
void GenIO4HILinNetwork_eqFunction_140(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,140};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[5]] /* G1.machine.w STATE(1) */) = (data->modelData->realVarsData[5] /* G1.machine.w STATE(1) */).attribute .start;
  TRACE_POP
}
extern void GenIO4HILinNetwork_eqFunction_146(DATA *data, threadData_t *threadData);

extern void GenIO4HILinNetwork_eqFunction_143(DATA *data, threadData_t *threadData);

OMC_DISABLE_OPT
void GenIO4HILinNetwork_functionInitialEquations_0(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  GenIO4HILinNetwork_eqFunction_1(data, threadData);
  GenIO4HILinNetwork_eqFunction_2(data, threadData);
  GenIO4HILinNetwork_eqFunction_3(data, threadData);
  GenIO4HILinNetwork_eqFunction_4(data, threadData);
  GenIO4HILinNetwork_eqFunction_5(data, threadData);
  GenIO4HILinNetwork_eqFunction_6(data, threadData);
  GenIO4HILinNetwork_eqFunction_7(data, threadData);
  GenIO4HILinNetwork_eqFunction_8(data, threadData);
  GenIO4HILinNetwork_eqFunction_9(data, threadData);
  GenIO4HILinNetwork_eqFunction_10(data, threadData);
  GenIO4HILinNetwork_eqFunction_11(data, threadData);
  GenIO4HILinNetwork_eqFunction_12(data, threadData);
  GenIO4HILinNetwork_eqFunction_13(data, threadData);
  GenIO4HILinNetwork_eqFunction_14(data, threadData);
  GenIO4HILinNetwork_eqFunction_15(data, threadData);
  GenIO4HILinNetwork_eqFunction_16(data, threadData);
  GenIO4HILinNetwork_eqFunction_17(data, threadData);
  GenIO4HILinNetwork_eqFunction_18(data, threadData);
  GenIO4HILinNetwork_eqFunction_19(data, threadData);
  GenIO4HILinNetwork_eqFunction_20(data, threadData);
  GenIO4HILinNetwork_eqFunction_21(data, threadData);
  GenIO4HILinNetwork_eqFunction_22(data, threadData);
  GenIO4HILinNetwork_eqFunction_23(data, threadData);
  GenIO4HILinNetwork_eqFunction_24(data, threadData);
  GenIO4HILinNetwork_eqFunction_25(data, threadData);
  GenIO4HILinNetwork_eqFunction_26(data, threadData);
  GenIO4HILinNetwork_eqFunction_27(data, threadData);
  GenIO4HILinNetwork_eqFunction_28(data, threadData);
  GenIO4HILinNetwork_eqFunction_29(data, threadData);
  GenIO4HILinNetwork_eqFunction_30(data, threadData);
  GenIO4HILinNetwork_eqFunction_147(data, threadData);
  GenIO4HILinNetwork_eqFunction_32(data, threadData);
  GenIO4HILinNetwork_eqFunction_33(data, threadData);
  GenIO4HILinNetwork_eqFunction_34(data, threadData);
  GenIO4HILinNetwork_eqFunction_35(data, threadData);
  GenIO4HILinNetwork_eqFunction_36(data, threadData);
  GenIO4HILinNetwork_eqFunction_37(data, threadData);
  GenIO4HILinNetwork_eqFunction_38(data, threadData);
  GenIO4HILinNetwork_eqFunction_39(data, threadData);
  GenIO4HILinNetwork_eqFunction_40(data, threadData);
  GenIO4HILinNetwork_eqFunction_41(data, threadData);
  GenIO4HILinNetwork_eqFunction_42(data, threadData);
  GenIO4HILinNetwork_eqFunction_43(data, threadData);
  GenIO4HILinNetwork_eqFunction_44(data, threadData);
  GenIO4HILinNetwork_eqFunction_45(data, threadData);
  GenIO4HILinNetwork_eqFunction_46(data, threadData);
  GenIO4HILinNetwork_eqFunction_47(data, threadData);
  GenIO4HILinNetwork_eqFunction_48(data, threadData);
  GenIO4HILinNetwork_eqFunction_49(data, threadData);
  GenIO4HILinNetwork_eqFunction_50(data, threadData);
  GenIO4HILinNetwork_eqFunction_144(data, threadData);
  GenIO4HILinNetwork_eqFunction_145(data, threadData);
  GenIO4HILinNetwork_eqFunction_53(data, threadData);
  GenIO4HILinNetwork_eqFunction_54(data, threadData);
  GenIO4HILinNetwork_eqFunction_55(data, threadData);
  GenIO4HILinNetwork_eqFunction_56(data, threadData);
  GenIO4HILinNetwork_eqFunction_99(data, threadData);
  GenIO4HILinNetwork_eqFunction_222(data, threadData);
  GenIO4HILinNetwork_eqFunction_221(data, threadData);
  GenIO4HILinNetwork_eqFunction_102(data, threadData);
  GenIO4HILinNetwork_eqFunction_199(data, threadData);
  GenIO4HILinNetwork_eqFunction_198(data, threadData);
  GenIO4HILinNetwork_eqFunction_201(data, threadData);
  GenIO4HILinNetwork_eqFunction_200(data, threadData);
  GenIO4HILinNetwork_eqFunction_107(data, threadData);
  GenIO4HILinNetwork_eqFunction_194(data, threadData);
  GenIO4HILinNetwork_eqFunction_190(data, threadData);
  GenIO4HILinNetwork_eqFunction_189(data, threadData);
  GenIO4HILinNetwork_eqFunction_195(data, threadData);
  GenIO4HILinNetwork_eqFunction_197(data, threadData);
  GenIO4HILinNetwork_eqFunction_196(data, threadData);
  GenIO4HILinNetwork_eqFunction_192(data, threadData);
  GenIO4HILinNetwork_eqFunction_191(data, threadData);
  GenIO4HILinNetwork_eqFunction_205(data, threadData);
  GenIO4HILinNetwork_eqFunction_204(data, threadData);
  GenIO4HILinNetwork_eqFunction_202(data, threadData);
  GenIO4HILinNetwork_eqFunction_203(data, threadData);
  GenIO4HILinNetwork_eqFunction_187(data, threadData);
  GenIO4HILinNetwork_eqFunction_215(data, threadData);
  GenIO4HILinNetwork_eqFunction_216(data, threadData);
  GenIO4HILinNetwork_eqFunction_220(data, threadData);
  GenIO4HILinNetwork_eqFunction_219(data, threadData);
  GenIO4HILinNetwork_eqFunction_218(data, threadData);
  GenIO4HILinNetwork_eqFunction_217(data, threadData);
  GenIO4HILinNetwork_eqFunction_206(data, threadData);
  GenIO4HILinNetwork_eqFunction_207(data, threadData);
  GenIO4HILinNetwork_eqFunction_208(data, threadData);
  GenIO4HILinNetwork_eqFunction_209(data, threadData);
  GenIO4HILinNetwork_eqFunction_210(data, threadData);
  GenIO4HILinNetwork_eqFunction_212(data, threadData);
  GenIO4HILinNetwork_eqFunction_211(data, threadData);
  GenIO4HILinNetwork_eqFunction_134(data, threadData);
  GenIO4HILinNetwork_eqFunction_135(data, threadData);
  GenIO4HILinNetwork_eqFunction_136(data, threadData);
  GenIO4HILinNetwork_eqFunction_137(data, threadData);
  GenIO4HILinNetwork_eqFunction_138(data, threadData);
  GenIO4HILinNetwork_eqFunction_139(data, threadData);
  GenIO4HILinNetwork_eqFunction_140(data, threadData);
  GenIO4HILinNetwork_eqFunction_146(data, threadData);
  GenIO4HILinNetwork_eqFunction_143(data, threadData);
  TRACE_POP
}

int GenIO4HILinNetwork_functionInitialEquations(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->discreteCall = 1;
  GenIO4HILinNetwork_functionInitialEquations_0(data, threadData);
  data->simulationInfo->discreteCall = 0;
  
  TRACE_POP
  return 0;
}

/* No GenIO4HILinNetwork_functionInitialEquations_lambda0 function */

int GenIO4HILinNetwork_functionRemovedInitialEquations(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int *equationIndexes = NULL;
  double res = 0.0;

  
  TRACE_POP
  return 0;
}


#if defined(__cplusplus)
}
#endif

