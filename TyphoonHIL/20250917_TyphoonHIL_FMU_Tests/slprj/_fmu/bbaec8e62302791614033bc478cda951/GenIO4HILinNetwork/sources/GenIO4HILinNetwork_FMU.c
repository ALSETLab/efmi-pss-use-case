// define class name and unique id
#define MODEL_IDENTIFIER GenIO4HILinNetwork
#define MODEL_GUID "{6cd37720-5980-4da2-a322-84951152fed5}"

// include fmu header files, typedefs and macros
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include "openmodelica.h"
#include "openmodelica_func.h"
#include "simulation_data.h"
#include "util/omc_error.h"
#include "GenIO4HILinNetwork_functions.h"
#include "simulation/solver/initialization/initialization.h"
#include "simulation/solver/events.h"
#define FMI2_FUNCTION_PREFIX GenIO4HILinNetwork_
#include "fmi2Functions.h"
#include "fmi-export/fmu2_model_interface.h"
#include "fmi-export/fmu_read_flags.h"

#ifdef __cplusplus
extern "C" {
#endif

void setStartValues(ModelInstance *comp);
void setDefaultStartValues(ModelInstance *comp);
void eventUpdate(ModelInstance* comp, fmi2EventInfo* eventInfo);
fmi2Real getReal(ModelInstance* comp, const fmi2ValueReference vr);
fmi2Status setReal(ModelInstance* comp, const fmi2ValueReference vr, const fmi2Real value);
fmi2Integer getInteger(ModelInstance* comp, const fmi2ValueReference vr);
fmi2Status setInteger(ModelInstance* comp, const fmi2ValueReference vr, const fmi2Integer value);
fmi2Boolean getBoolean(ModelInstance* comp, const fmi2ValueReference vr);
fmi2Status setBoolean(ModelInstance* comp, const fmi2ValueReference vr, const fmi2Boolean value);
fmi2String getString(ModelInstance* comp, const fmi2ValueReference vr);
fmi2Status setString(ModelInstance* comp, const fmi2ValueReference vr, fmi2String value);
fmi2Status setExternalFunction(ModelInstance* c, const fmi2ValueReference vr, const void* value);
fmi2ValueReference mapInputReference2InputNumber(const fmi2ValueReference vr);
fmi2ValueReference mapOutputReference2OutputNumber(const fmi2ValueReference vr);
fmi2ValueReference mapOutputReference2RealOutputDerivatives(const fmi2ValueReference vr);
fmi2ValueReference mapInitialUnknownsdependentIndex(const fmi2ValueReference vr);
fmi2ValueReference mapInitialUnknownsIndependentIndex(const fmi2ValueReference vr);

// define model size
#define NUMBER_OF_STATES 6
#define NUMBER_OF_EVENT_INDICATORS 9
#define NUMBER_OF_REALS 285
#define NUMBER_OF_REAL_INPUTS 1
#define NUMBER_OF_INTEGERS 2
#define NUMBER_OF_STRINGS 0
#define NUMBER_OF_BOOLEANS 59
#define NUMBER_OF_EXTERNALFUNCTIONS 0

// define initial state vector as vector of value references
#define STATES { 0, 1, 2, 3, 4, 5 }
#define STATESDERIVATIVES { 6, 7, 8, 9, 10, 11 }


// implementation of the Model Exchange functions
extern void GenIO4HILinNetwork_setupDataStruc(DATA *data, threadData_t *threadData);
#define fmu2_model_interface_setupDataStruc GenIO4HILinNetwork_setupDataStruc
#include "fmi-export/fmu2_model_interface.c.inc"
#include "fmi-export/fmu_read_flags.c.inc"

// Set values for all variables that define a start value
OMC_DISABLE_OPT
void setDefaultStartValues(ModelInstance *comp) {
  comp->fmuData->modelData->realVarsData[0].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[1].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[2].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[3].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[4].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[5].attribute.start = 1.0;
  comp->fmuData->modelData->realVarsData[6].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[7].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[8].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[9].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[10].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[11].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[12].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[13].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[14].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[15].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[16].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[17].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[18].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[19].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[20].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[21].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[22].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[23].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[24].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[25].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[26].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[27].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[28].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[29].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[30].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[31].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[32].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[33].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[34].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[35].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[36].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[37].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[38].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[39].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[40].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[41].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[42].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[43].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[44].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[45].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[46].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[47].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[48].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[49].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[50].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[51].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[52].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[53].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[54].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[55].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[56].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[57].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[58].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[59].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[60].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[61].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[62].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[63].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[64].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[65].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[66].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[67].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[68].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[69].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[70].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[71].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[72].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[73].attribute.start = 1e-15;
  comp->fmuData->modelData->realVarsData[74].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[75].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[76].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[77].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[78].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[79].attribute.start = 0.0;
  comp->fmuData->modelData->realVarsData[80].attribute.start = 0;
  comp->fmuData->modelData->realVarsData[81].attribute.start = 1.0;
  comp->fmuData->modelData->realParameterData[0].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[1].attribute.start = 1e6;
  comp->fmuData->modelData->realParameterData[2].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[3].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[4].attribute.start = 4e5;
  comp->fmuData->modelData->realParameterData[5].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[6].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[7].attribute.start = 1.0;
  comp->fmuData->modelData->realParameterData[8].attribute.start = 1e6;
  comp->fmuData->modelData->realParameterData[9].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[10].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[11].attribute.start = 4e5;
  comp->fmuData->modelData->realParameterData[12].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[13].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[14].attribute.start = 1.0;
  comp->fmuData->modelData->realParameterData[15].attribute.start = 1e6;
  comp->fmuData->modelData->realParameterData[16].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[17].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[18].attribute.start = 4e5;
  comp->fmuData->modelData->realParameterData[19].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[20].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[21].attribute.start = 1.0;
  comp->fmuData->modelData->realParameterData[22].attribute.start = 1.9979999999936e9;
  comp->fmuData->modelData->realParameterData[23].attribute.start = 9.6792496990658e8;
  comp->fmuData->modelData->realParameterData[24].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[25].attribute.start = 4e5;
  comp->fmuData->modelData->realParameterData[26].attribute.start = 0.49467717698916;
  comp->fmuData->modelData->realParameterData[27].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[28].attribute.start = -1.0;
  comp->fmuData->modelData->realParameterData[29].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[30].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[31].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[32].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[33].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[34].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[35].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[36].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[37].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[38].attribute.start = 7.0;
  comp->fmuData->modelData->realParameterData[39].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[40].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[41].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[42].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[43].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[44].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[45].attribute.start = 2.22e9;
  comp->fmuData->modelData->realParameterData[46].attribute.start = 8.0;
  comp->fmuData->modelData->realParameterData[47].attribute.start = 1.0;
  comp->fmuData->modelData->realParameterData[48].attribute.start = 0.03;
  comp->fmuData->modelData->realParameterData[49].attribute.start = 0.07;
  comp->fmuData->modelData->realParameterData[50].attribute.start = 0.002;
  comp->fmuData->modelData->realParameterData[51].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[52].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[53].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[54].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[55].attribute.start = 4e5;
  comp->fmuData->modelData->realParameterData[56].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[57].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[58].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[59].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[60].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[61].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[62].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[63].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[64].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[65].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[66].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[67].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[68].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[69].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[70].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[71].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[72].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[73].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[74].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[75].attribute.start = 0.003;
  comp->fmuData->modelData->realParameterData[76].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[77].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[78].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[79].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[80].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[81].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[82].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[83].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[84].attribute.start = 0.3;
  comp->fmuData->modelData->realParameterData[85].attribute.start = 0.65;
  comp->fmuData->modelData->realParameterData[86].attribute.start = 0.23;
  comp->fmuData->modelData->realParameterData[87].attribute.start = 0.25;
  comp->fmuData->modelData->realParameterData[88].attribute.start = 1.81;
  comp->fmuData->modelData->realParameterData[89].attribute.start = 1.76;
  comp->fmuData->modelData->realParameterData[90].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[91].attribute.start = 1.0;
  comp->fmuData->modelData->realParameterData[92].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[93].attribute.start = 1e8;
  comp->fmuData->modelData->realParameterData[94].attribute.start = 60.0;
  comp->fmuData->modelData->realParameterData[95].attribute.start = -1.998e9;
  comp->fmuData->modelData->realParameterData[96].attribute.start = 8.7066e7;
  comp->fmuData->modelData->realParameterData[97].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[98].attribute.start = 4e5;
  comp->fmuData->modelData->realParameterData[99].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[100].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[101].attribute.start = 0.90081;
  comp->fmuData->modelData->realParameterData[102].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[103].attribute.start = 4.5045045045045046e-4;
  comp->fmuData->modelData->realParameterData[104].attribute.start = 30.5;
  comp->fmuData->modelData->realParameterData[105].attribute.start = 30.57;
  comp->fmuData->modelData->realParameterData[106].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[107].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[108].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[109].attribute.start = 1e8;
  comp->fmuData->modelData->realParameterData[110].attribute.start = 0.02252252252252252;
  comp->fmuData->modelData->realParameterData[111].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[112].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[113].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[114].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[115].attribute.start = 1e60;
  comp->fmuData->modelData->realParameterData[116].attribute.start = 1e60;
  comp->fmuData->modelData->realParameterData[117].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[118].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[119].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[120].attribute.start = 1e8;
  comp->fmuData->modelData->realParameterData[121].attribute.start = 0.041891891891891894;
  comp->fmuData->modelData->realParameterData[122].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[123].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[124].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[125].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[126].attribute.start = 1e60;
  comp->fmuData->modelData->realParameterData[127].attribute.start = 1e60;
  comp->fmuData->modelData->realParameterData[128].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[129].attribute.start = 2.22e9;
  comp->fmuData->modelData->realParameterData[130].attribute.start = 4e5;
  comp->fmuData->modelData->realParameterData[131].attribute.start = 4e5;
  comp->fmuData->modelData->realParameterData[132].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[133].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[134].attribute.start = 1.0;
  comp->fmuData->modelData->realParameterData[135].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[136].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[137].attribute.start = 0.0;
  comp->fmuData->modelData->realParameterData[138].attribute.start = 0.15;
  comp->fmuData->modelData->integerParameterData[0].attribute.start = 1;
  comp->fmuData->modelData->integerParameterData[1].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[0].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[1].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[2].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[3].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[4].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[5].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[6].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[7].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[8].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[9].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[10].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[11].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[12].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[13].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[14].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[15].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[16].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[17].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[18].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[19].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[20].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[21].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[22].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[23].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[24].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[25].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[26].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[27].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[28].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[29].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[30].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[31].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[32].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[33].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[34].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[35].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[36].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[37].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[38].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[39].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[40].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[41].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[42].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[43].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[44].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[45].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[46].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[47].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[48].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[49].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[50].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[51].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[52].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[53].attribute.start = 1;
  comp->fmuData->modelData->booleanParameterData[54].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[55].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[56].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[57].attribute.start = 0;
  comp->fmuData->modelData->booleanParameterData[58].attribute.start = 0;
}
// Set values for all variables that define a start value
OMC_DISABLE_OPT
void setStartValues(ModelInstance *comp) {
  comp->fmuData->modelData->realVarsData[0].attribute.start =  comp->fmuData->localData[0]->realVars[0];
  comp->fmuData->modelData->realVarsData[1].attribute.start =  comp->fmuData->localData[0]->realVars[1];
  comp->fmuData->modelData->realVarsData[2].attribute.start =  comp->fmuData->localData[0]->realVars[2];
  comp->fmuData->modelData->realVarsData[3].attribute.start =  comp->fmuData->localData[0]->realVars[3];
  comp->fmuData->modelData->realVarsData[4].attribute.start =  comp->fmuData->localData[0]->realVars[4];
  comp->fmuData->modelData->realVarsData[5].attribute.start =  comp->fmuData->localData[0]->realVars[5];
  comp->fmuData->modelData->realVarsData[6].attribute.start =  comp->fmuData->localData[0]->realVars[6];
  comp->fmuData->modelData->realVarsData[7].attribute.start =  comp->fmuData->localData[0]->realVars[7];
  comp->fmuData->modelData->realVarsData[8].attribute.start =  comp->fmuData->localData[0]->realVars[8];
  comp->fmuData->modelData->realVarsData[9].attribute.start =  comp->fmuData->localData[0]->realVars[9];
  comp->fmuData->modelData->realVarsData[10].attribute.start =  comp->fmuData->localData[0]->realVars[10];
  comp->fmuData->modelData->realVarsData[11].attribute.start =  comp->fmuData->localData[0]->realVars[11];
  comp->fmuData->modelData->realVarsData[12].attribute.start =  comp->fmuData->localData[0]->realVars[12];
  comp->fmuData->modelData->realVarsData[13].attribute.start =  comp->fmuData->localData[0]->realVars[13];
  comp->fmuData->modelData->realVarsData[14].attribute.start =  comp->fmuData->localData[0]->realVars[14];
  comp->fmuData->modelData->realVarsData[15].attribute.start =  comp->fmuData->localData[0]->realVars[15];
  comp->fmuData->modelData->realVarsData[16].attribute.start =  comp->fmuData->localData[0]->realVars[16];
  comp->fmuData->modelData->realVarsData[17].attribute.start =  comp->fmuData->localData[0]->realVars[17];
  comp->fmuData->modelData->realVarsData[18].attribute.start =  comp->fmuData->localData[0]->realVars[18];
  comp->fmuData->modelData->realVarsData[19].attribute.start =  comp->fmuData->localData[0]->realVars[19];
  comp->fmuData->modelData->realVarsData[20].attribute.start =  comp->fmuData->localData[0]->realVars[20];
  comp->fmuData->modelData->realVarsData[21].attribute.start =  comp->fmuData->localData[0]->realVars[21];
  comp->fmuData->modelData->realVarsData[22].attribute.start =  comp->fmuData->localData[0]->realVars[22];
  comp->fmuData->modelData->realVarsData[23].attribute.start =  comp->fmuData->localData[0]->realVars[23];
  comp->fmuData->modelData->realVarsData[24].attribute.start =  comp->fmuData->localData[0]->realVars[24];
  comp->fmuData->modelData->realVarsData[25].attribute.start =  comp->fmuData->localData[0]->realVars[25];
  comp->fmuData->modelData->realVarsData[26].attribute.start =  comp->fmuData->localData[0]->realVars[26];
  comp->fmuData->modelData->realVarsData[27].attribute.start =  comp->fmuData->localData[0]->realVars[27];
  comp->fmuData->modelData->realVarsData[28].attribute.start =  comp->fmuData->localData[0]->realVars[28];
  comp->fmuData->modelData->realVarsData[29].attribute.start =  comp->fmuData->localData[0]->realVars[29];
  comp->fmuData->modelData->realVarsData[30].attribute.start =  comp->fmuData->localData[0]->realVars[30];
  comp->fmuData->modelData->realVarsData[31].attribute.start =  comp->fmuData->localData[0]->realVars[31];
  comp->fmuData->modelData->realVarsData[32].attribute.start =  comp->fmuData->localData[0]->realVars[32];
  comp->fmuData->modelData->realVarsData[33].attribute.start =  comp->fmuData->localData[0]->realVars[33];
  comp->fmuData->modelData->realVarsData[34].attribute.start =  comp->fmuData->localData[0]->realVars[34];
  comp->fmuData->modelData->realVarsData[35].attribute.start =  comp->fmuData->localData[0]->realVars[35];
  comp->fmuData->modelData->realVarsData[36].attribute.start =  comp->fmuData->localData[0]->realVars[36];
  comp->fmuData->modelData->realVarsData[37].attribute.start =  comp->fmuData->localData[0]->realVars[37];
  comp->fmuData->modelData->realVarsData[38].attribute.start =  comp->fmuData->localData[0]->realVars[38];
  comp->fmuData->modelData->realVarsData[39].attribute.start =  comp->fmuData->localData[0]->realVars[39];
  comp->fmuData->modelData->realVarsData[40].attribute.start =  comp->fmuData->localData[0]->realVars[40];
  comp->fmuData->modelData->realVarsData[41].attribute.start =  comp->fmuData->localData[0]->realVars[41];
  comp->fmuData->modelData->realVarsData[42].attribute.start =  comp->fmuData->localData[0]->realVars[42];
  comp->fmuData->modelData->realVarsData[43].attribute.start =  comp->fmuData->localData[0]->realVars[43];
  comp->fmuData->modelData->realVarsData[44].attribute.start =  comp->fmuData->localData[0]->realVars[44];
  comp->fmuData->modelData->realVarsData[45].attribute.start =  comp->fmuData->localData[0]->realVars[45];
  comp->fmuData->modelData->realVarsData[46].attribute.start =  comp->fmuData->localData[0]->realVars[46];
  comp->fmuData->modelData->realVarsData[47].attribute.start =  comp->fmuData->localData[0]->realVars[47];
  comp->fmuData->modelData->realVarsData[48].attribute.start =  comp->fmuData->localData[0]->realVars[48];
  comp->fmuData->modelData->realVarsData[49].attribute.start =  comp->fmuData->localData[0]->realVars[49];
  comp->fmuData->modelData->realVarsData[50].attribute.start =  comp->fmuData->localData[0]->realVars[50];
  comp->fmuData->modelData->realVarsData[51].attribute.start =  comp->fmuData->localData[0]->realVars[51];
  comp->fmuData->modelData->realVarsData[52].attribute.start =  comp->fmuData->localData[0]->realVars[52];
  comp->fmuData->modelData->realVarsData[53].attribute.start =  comp->fmuData->localData[0]->realVars[53];
  comp->fmuData->modelData->realVarsData[54].attribute.start =  comp->fmuData->localData[0]->realVars[54];
  comp->fmuData->modelData->realVarsData[55].attribute.start =  comp->fmuData->localData[0]->realVars[55];
  comp->fmuData->modelData->realVarsData[56].attribute.start =  comp->fmuData->localData[0]->realVars[56];
  comp->fmuData->modelData->realVarsData[57].attribute.start =  comp->fmuData->localData[0]->realVars[57];
  comp->fmuData->modelData->realVarsData[58].attribute.start =  comp->fmuData->localData[0]->realVars[58];
  comp->fmuData->modelData->realVarsData[59].attribute.start =  comp->fmuData->localData[0]->realVars[59];
  comp->fmuData->modelData->realVarsData[60].attribute.start =  comp->fmuData->localData[0]->realVars[60];
  comp->fmuData->modelData->realVarsData[61].attribute.start =  comp->fmuData->localData[0]->realVars[61];
  comp->fmuData->modelData->realVarsData[62].attribute.start =  comp->fmuData->localData[0]->realVars[62];
  comp->fmuData->modelData->realVarsData[63].attribute.start =  comp->fmuData->localData[0]->realVars[63];
  comp->fmuData->modelData->realVarsData[64].attribute.start =  comp->fmuData->localData[0]->realVars[64];
  comp->fmuData->modelData->realVarsData[65].attribute.start =  comp->fmuData->localData[0]->realVars[65];
  comp->fmuData->modelData->realVarsData[66].attribute.start =  comp->fmuData->localData[0]->realVars[66];
  comp->fmuData->modelData->realVarsData[67].attribute.start =  comp->fmuData->localData[0]->realVars[67];
  comp->fmuData->modelData->realVarsData[68].attribute.start =  comp->fmuData->localData[0]->realVars[68];
  comp->fmuData->modelData->realVarsData[69].attribute.start =  comp->fmuData->localData[0]->realVars[69];
  comp->fmuData->modelData->realVarsData[70].attribute.start =  comp->fmuData->localData[0]->realVars[70];
  comp->fmuData->modelData->realVarsData[71].attribute.start =  comp->fmuData->localData[0]->realVars[71];
  comp->fmuData->modelData->realVarsData[72].attribute.start =  comp->fmuData->localData[0]->realVars[72];
  comp->fmuData->modelData->realVarsData[73].attribute.start =  comp->fmuData->localData[0]->realVars[73];
  comp->fmuData->modelData->realVarsData[74].attribute.start =  comp->fmuData->localData[0]->realVars[74];
  comp->fmuData->modelData->realVarsData[75].attribute.start =  comp->fmuData->localData[0]->realVars[75];
  comp->fmuData->modelData->realVarsData[76].attribute.start =  comp->fmuData->localData[0]->realVars[76];
  comp->fmuData->modelData->realVarsData[77].attribute.start =  comp->fmuData->localData[0]->realVars[77];
  comp->fmuData->modelData->realVarsData[78].attribute.start =  comp->fmuData->localData[0]->realVars[78];
  comp->fmuData->modelData->realVarsData[79].attribute.start =  comp->fmuData->localData[0]->realVars[79];
  comp->fmuData->modelData->realVarsData[80].attribute.start =  comp->fmuData->localData[0]->realVars[80];
  comp->fmuData->modelData->realVarsData[81].attribute.start =  comp->fmuData->localData[0]->realVars[81];
  comp->fmuData->modelData->realParameterData[0].attribute.start = comp->fmuData->simulationInfo->realParameter[0];
  comp->fmuData->modelData->realParameterData[1].attribute.start = comp->fmuData->simulationInfo->realParameter[1];
  comp->fmuData->modelData->realParameterData[2].attribute.start = comp->fmuData->simulationInfo->realParameter[2];
  comp->fmuData->modelData->realParameterData[3].attribute.start = comp->fmuData->simulationInfo->realParameter[3];
  comp->fmuData->modelData->realParameterData[4].attribute.start = comp->fmuData->simulationInfo->realParameter[4];
  comp->fmuData->modelData->realParameterData[5].attribute.start = comp->fmuData->simulationInfo->realParameter[5];
  comp->fmuData->modelData->realParameterData[6].attribute.start = comp->fmuData->simulationInfo->realParameter[6];
  comp->fmuData->modelData->realParameterData[7].attribute.start = comp->fmuData->simulationInfo->realParameter[7];
  comp->fmuData->modelData->realParameterData[8].attribute.start = comp->fmuData->simulationInfo->realParameter[8];
  comp->fmuData->modelData->realParameterData[9].attribute.start = comp->fmuData->simulationInfo->realParameter[9];
  comp->fmuData->modelData->realParameterData[10].attribute.start = comp->fmuData->simulationInfo->realParameter[10];
  comp->fmuData->modelData->realParameterData[11].attribute.start = comp->fmuData->simulationInfo->realParameter[11];
  comp->fmuData->modelData->realParameterData[12].attribute.start = comp->fmuData->simulationInfo->realParameter[12];
  comp->fmuData->modelData->realParameterData[13].attribute.start = comp->fmuData->simulationInfo->realParameter[13];
  comp->fmuData->modelData->realParameterData[14].attribute.start = comp->fmuData->simulationInfo->realParameter[14];
  comp->fmuData->modelData->realParameterData[15].attribute.start = comp->fmuData->simulationInfo->realParameter[15];
  comp->fmuData->modelData->realParameterData[16].attribute.start = comp->fmuData->simulationInfo->realParameter[16];
  comp->fmuData->modelData->realParameterData[17].attribute.start = comp->fmuData->simulationInfo->realParameter[17];
  comp->fmuData->modelData->realParameterData[18].attribute.start = comp->fmuData->simulationInfo->realParameter[18];
  comp->fmuData->modelData->realParameterData[19].attribute.start = comp->fmuData->simulationInfo->realParameter[19];
  comp->fmuData->modelData->realParameterData[20].attribute.start = comp->fmuData->simulationInfo->realParameter[20];
  comp->fmuData->modelData->realParameterData[21].attribute.start = comp->fmuData->simulationInfo->realParameter[21];
  comp->fmuData->modelData->realParameterData[22].attribute.start = comp->fmuData->simulationInfo->realParameter[22];
  comp->fmuData->modelData->realParameterData[23].attribute.start = comp->fmuData->simulationInfo->realParameter[23];
  comp->fmuData->modelData->realParameterData[24].attribute.start = comp->fmuData->simulationInfo->realParameter[24];
  comp->fmuData->modelData->realParameterData[25].attribute.start = comp->fmuData->simulationInfo->realParameter[25];
  comp->fmuData->modelData->realParameterData[26].attribute.start = comp->fmuData->simulationInfo->realParameter[26];
  comp->fmuData->modelData->realParameterData[27].attribute.start = comp->fmuData->simulationInfo->realParameter[27];
  comp->fmuData->modelData->realParameterData[28].attribute.start = comp->fmuData->simulationInfo->realParameter[28];
  comp->fmuData->modelData->realParameterData[29].attribute.start = comp->fmuData->simulationInfo->realParameter[29];
  comp->fmuData->modelData->realParameterData[30].attribute.start = comp->fmuData->simulationInfo->realParameter[30];
  comp->fmuData->modelData->realParameterData[31].attribute.start = comp->fmuData->simulationInfo->realParameter[31];
  comp->fmuData->modelData->realParameterData[32].attribute.start = comp->fmuData->simulationInfo->realParameter[32];
  comp->fmuData->modelData->realParameterData[33].attribute.start = comp->fmuData->simulationInfo->realParameter[33];
  comp->fmuData->modelData->realParameterData[34].attribute.start = comp->fmuData->simulationInfo->realParameter[34];
  comp->fmuData->modelData->realParameterData[35].attribute.start = comp->fmuData->simulationInfo->realParameter[35];
  comp->fmuData->modelData->realParameterData[36].attribute.start = comp->fmuData->simulationInfo->realParameter[36];
  comp->fmuData->modelData->realParameterData[37].attribute.start = comp->fmuData->simulationInfo->realParameter[37];
  comp->fmuData->modelData->realParameterData[38].attribute.start = comp->fmuData->simulationInfo->realParameter[38];
  comp->fmuData->modelData->realParameterData[39].attribute.start = comp->fmuData->simulationInfo->realParameter[39];
  comp->fmuData->modelData->realParameterData[40].attribute.start = comp->fmuData->simulationInfo->realParameter[40];
  comp->fmuData->modelData->realParameterData[41].attribute.start = comp->fmuData->simulationInfo->realParameter[41];
  comp->fmuData->modelData->realParameterData[42].attribute.start = comp->fmuData->simulationInfo->realParameter[42];
  comp->fmuData->modelData->realParameterData[43].attribute.start = comp->fmuData->simulationInfo->realParameter[43];
  comp->fmuData->modelData->realParameterData[44].attribute.start = comp->fmuData->simulationInfo->realParameter[44];
  comp->fmuData->modelData->realParameterData[45].attribute.start = comp->fmuData->simulationInfo->realParameter[45];
  comp->fmuData->modelData->realParameterData[46].attribute.start = comp->fmuData->simulationInfo->realParameter[46];
  comp->fmuData->modelData->realParameterData[47].attribute.start = comp->fmuData->simulationInfo->realParameter[47];
  comp->fmuData->modelData->realParameterData[48].attribute.start = comp->fmuData->simulationInfo->realParameter[48];
  comp->fmuData->modelData->realParameterData[49].attribute.start = comp->fmuData->simulationInfo->realParameter[49];
  comp->fmuData->modelData->realParameterData[50].attribute.start = comp->fmuData->simulationInfo->realParameter[50];
  comp->fmuData->modelData->realParameterData[51].attribute.start = comp->fmuData->simulationInfo->realParameter[51];
  comp->fmuData->modelData->realParameterData[52].attribute.start = comp->fmuData->simulationInfo->realParameter[52];
  comp->fmuData->modelData->realParameterData[53].attribute.start = comp->fmuData->simulationInfo->realParameter[53];
  comp->fmuData->modelData->realParameterData[54].attribute.start = comp->fmuData->simulationInfo->realParameter[54];
  comp->fmuData->modelData->realParameterData[55].attribute.start = comp->fmuData->simulationInfo->realParameter[55];
  comp->fmuData->modelData->realParameterData[56].attribute.start = comp->fmuData->simulationInfo->realParameter[56];
  comp->fmuData->modelData->realParameterData[57].attribute.start = comp->fmuData->simulationInfo->realParameter[57];
  comp->fmuData->modelData->realParameterData[58].attribute.start = comp->fmuData->simulationInfo->realParameter[58];
  comp->fmuData->modelData->realParameterData[59].attribute.start = comp->fmuData->simulationInfo->realParameter[59];
  comp->fmuData->modelData->realParameterData[60].attribute.start = comp->fmuData->simulationInfo->realParameter[60];
  comp->fmuData->modelData->realParameterData[61].attribute.start = comp->fmuData->simulationInfo->realParameter[61];
  comp->fmuData->modelData->realParameterData[62].attribute.start = comp->fmuData->simulationInfo->realParameter[62];
  comp->fmuData->modelData->realParameterData[63].attribute.start = comp->fmuData->simulationInfo->realParameter[63];
  comp->fmuData->modelData->realParameterData[64].attribute.start = comp->fmuData->simulationInfo->realParameter[64];
  comp->fmuData->modelData->realParameterData[65].attribute.start = comp->fmuData->simulationInfo->realParameter[65];
  comp->fmuData->modelData->realParameterData[66].attribute.start = comp->fmuData->simulationInfo->realParameter[66];
  comp->fmuData->modelData->realParameterData[67].attribute.start = comp->fmuData->simulationInfo->realParameter[67];
  comp->fmuData->modelData->realParameterData[68].attribute.start = comp->fmuData->simulationInfo->realParameter[68];
  comp->fmuData->modelData->realParameterData[69].attribute.start = comp->fmuData->simulationInfo->realParameter[69];
  comp->fmuData->modelData->realParameterData[70].attribute.start = comp->fmuData->simulationInfo->realParameter[70];
  comp->fmuData->modelData->realParameterData[71].attribute.start = comp->fmuData->simulationInfo->realParameter[71];
  comp->fmuData->modelData->realParameterData[72].attribute.start = comp->fmuData->simulationInfo->realParameter[72];
  comp->fmuData->modelData->realParameterData[73].attribute.start = comp->fmuData->simulationInfo->realParameter[73];
  comp->fmuData->modelData->realParameterData[74].attribute.start = comp->fmuData->simulationInfo->realParameter[74];
  comp->fmuData->modelData->realParameterData[75].attribute.start = comp->fmuData->simulationInfo->realParameter[75];
  comp->fmuData->modelData->realParameterData[76].attribute.start = comp->fmuData->simulationInfo->realParameter[76];
  comp->fmuData->modelData->realParameterData[77].attribute.start = comp->fmuData->simulationInfo->realParameter[77];
  comp->fmuData->modelData->realParameterData[78].attribute.start = comp->fmuData->simulationInfo->realParameter[78];
  comp->fmuData->modelData->realParameterData[79].attribute.start = comp->fmuData->simulationInfo->realParameter[79];
  comp->fmuData->modelData->realParameterData[80].attribute.start = comp->fmuData->simulationInfo->realParameter[80];
  comp->fmuData->modelData->realParameterData[81].attribute.start = comp->fmuData->simulationInfo->realParameter[81];
  comp->fmuData->modelData->realParameterData[82].attribute.start = comp->fmuData->simulationInfo->realParameter[82];
  comp->fmuData->modelData->realParameterData[83].attribute.start = comp->fmuData->simulationInfo->realParameter[83];
  comp->fmuData->modelData->realParameterData[84].attribute.start = comp->fmuData->simulationInfo->realParameter[84];
  comp->fmuData->modelData->realParameterData[85].attribute.start = comp->fmuData->simulationInfo->realParameter[85];
  comp->fmuData->modelData->realParameterData[86].attribute.start = comp->fmuData->simulationInfo->realParameter[86];
  comp->fmuData->modelData->realParameterData[87].attribute.start = comp->fmuData->simulationInfo->realParameter[87];
  comp->fmuData->modelData->realParameterData[88].attribute.start = comp->fmuData->simulationInfo->realParameter[88];
  comp->fmuData->modelData->realParameterData[89].attribute.start = comp->fmuData->simulationInfo->realParameter[89];
  comp->fmuData->modelData->realParameterData[90].attribute.start = comp->fmuData->simulationInfo->realParameter[90];
  comp->fmuData->modelData->realParameterData[91].attribute.start = comp->fmuData->simulationInfo->realParameter[91];
  comp->fmuData->modelData->realParameterData[92].attribute.start = comp->fmuData->simulationInfo->realParameter[92];
  comp->fmuData->modelData->realParameterData[93].attribute.start = comp->fmuData->simulationInfo->realParameter[93];
  comp->fmuData->modelData->realParameterData[94].attribute.start = comp->fmuData->simulationInfo->realParameter[94];
  comp->fmuData->modelData->realParameterData[95].attribute.start = comp->fmuData->simulationInfo->realParameter[95];
  comp->fmuData->modelData->realParameterData[96].attribute.start = comp->fmuData->simulationInfo->realParameter[96];
  comp->fmuData->modelData->realParameterData[97].attribute.start = comp->fmuData->simulationInfo->realParameter[97];
  comp->fmuData->modelData->realParameterData[98].attribute.start = comp->fmuData->simulationInfo->realParameter[98];
  comp->fmuData->modelData->realParameterData[99].attribute.start = comp->fmuData->simulationInfo->realParameter[99];
  comp->fmuData->modelData->realParameterData[100].attribute.start = comp->fmuData->simulationInfo->realParameter[100];
  comp->fmuData->modelData->realParameterData[101].attribute.start = comp->fmuData->simulationInfo->realParameter[101];
  comp->fmuData->modelData->realParameterData[102].attribute.start = comp->fmuData->simulationInfo->realParameter[102];
  comp->fmuData->modelData->realParameterData[103].attribute.start = comp->fmuData->simulationInfo->realParameter[103];
  comp->fmuData->modelData->realParameterData[104].attribute.start = comp->fmuData->simulationInfo->realParameter[104];
  comp->fmuData->modelData->realParameterData[105].attribute.start = comp->fmuData->simulationInfo->realParameter[105];
  comp->fmuData->modelData->realParameterData[106].attribute.start = comp->fmuData->simulationInfo->realParameter[106];
  comp->fmuData->modelData->realParameterData[107].attribute.start = comp->fmuData->simulationInfo->realParameter[107];
  comp->fmuData->modelData->realParameterData[108].attribute.start = comp->fmuData->simulationInfo->realParameter[108];
  comp->fmuData->modelData->realParameterData[109].attribute.start = comp->fmuData->simulationInfo->realParameter[109];
  comp->fmuData->modelData->realParameterData[110].attribute.start = comp->fmuData->simulationInfo->realParameter[110];
  comp->fmuData->modelData->realParameterData[111].attribute.start = comp->fmuData->simulationInfo->realParameter[111];
  comp->fmuData->modelData->realParameterData[112].attribute.start = comp->fmuData->simulationInfo->realParameter[112];
  comp->fmuData->modelData->realParameterData[113].attribute.start = comp->fmuData->simulationInfo->realParameter[113];
  comp->fmuData->modelData->realParameterData[114].attribute.start = comp->fmuData->simulationInfo->realParameter[114];
  comp->fmuData->modelData->realParameterData[115].attribute.start = comp->fmuData->simulationInfo->realParameter[115];
  comp->fmuData->modelData->realParameterData[116].attribute.start = comp->fmuData->simulationInfo->realParameter[116];
  comp->fmuData->modelData->realParameterData[117].attribute.start = comp->fmuData->simulationInfo->realParameter[117];
  comp->fmuData->modelData->realParameterData[118].attribute.start = comp->fmuData->simulationInfo->realParameter[118];
  comp->fmuData->modelData->realParameterData[119].attribute.start = comp->fmuData->simulationInfo->realParameter[119];
  comp->fmuData->modelData->realParameterData[120].attribute.start = comp->fmuData->simulationInfo->realParameter[120];
  comp->fmuData->modelData->realParameterData[121].attribute.start = comp->fmuData->simulationInfo->realParameter[121];
  comp->fmuData->modelData->realParameterData[122].attribute.start = comp->fmuData->simulationInfo->realParameter[122];
  comp->fmuData->modelData->realParameterData[123].attribute.start = comp->fmuData->simulationInfo->realParameter[123];
  comp->fmuData->modelData->realParameterData[124].attribute.start = comp->fmuData->simulationInfo->realParameter[124];
  comp->fmuData->modelData->realParameterData[125].attribute.start = comp->fmuData->simulationInfo->realParameter[125];
  comp->fmuData->modelData->realParameterData[126].attribute.start = comp->fmuData->simulationInfo->realParameter[126];
  comp->fmuData->modelData->realParameterData[127].attribute.start = comp->fmuData->simulationInfo->realParameter[127];
  comp->fmuData->modelData->realParameterData[128].attribute.start = comp->fmuData->simulationInfo->realParameter[128];
  comp->fmuData->modelData->realParameterData[129].attribute.start = comp->fmuData->simulationInfo->realParameter[129];
  comp->fmuData->modelData->realParameterData[130].attribute.start = comp->fmuData->simulationInfo->realParameter[130];
  comp->fmuData->modelData->realParameterData[131].attribute.start = comp->fmuData->simulationInfo->realParameter[131];
  comp->fmuData->modelData->realParameterData[132].attribute.start = comp->fmuData->simulationInfo->realParameter[132];
  comp->fmuData->modelData->realParameterData[133].attribute.start = comp->fmuData->simulationInfo->realParameter[133];
  comp->fmuData->modelData->realParameterData[134].attribute.start = comp->fmuData->simulationInfo->realParameter[134];
  comp->fmuData->modelData->realParameterData[135].attribute.start = comp->fmuData->simulationInfo->realParameter[135];
  comp->fmuData->modelData->realParameterData[136].attribute.start = comp->fmuData->simulationInfo->realParameter[136];
  comp->fmuData->modelData->realParameterData[137].attribute.start = comp->fmuData->simulationInfo->realParameter[137];
  comp->fmuData->modelData->realParameterData[138].attribute.start = comp->fmuData->simulationInfo->realParameter[138];
  comp->fmuData->modelData->integerParameterData[0].attribute.start = comp->fmuData->simulationInfo->integerParameter[0];
  comp->fmuData->modelData->integerParameterData[1].attribute.start = comp->fmuData->simulationInfo->integerParameter[1];
  comp->fmuData->modelData->booleanParameterData[0].attribute.start = comp->fmuData->simulationInfo->booleanParameter[0];
  comp->fmuData->modelData->booleanParameterData[1].attribute.start = comp->fmuData->simulationInfo->booleanParameter[1];
  comp->fmuData->modelData->booleanParameterData[2].attribute.start = comp->fmuData->simulationInfo->booleanParameter[2];
  comp->fmuData->modelData->booleanParameterData[3].attribute.start = comp->fmuData->simulationInfo->booleanParameter[3];
  comp->fmuData->modelData->booleanParameterData[4].attribute.start = comp->fmuData->simulationInfo->booleanParameter[4];
  comp->fmuData->modelData->booleanParameterData[5].attribute.start = comp->fmuData->simulationInfo->booleanParameter[5];
  comp->fmuData->modelData->booleanParameterData[6].attribute.start = comp->fmuData->simulationInfo->booleanParameter[6];
  comp->fmuData->modelData->booleanParameterData[7].attribute.start = comp->fmuData->simulationInfo->booleanParameter[7];
  comp->fmuData->modelData->booleanParameterData[8].attribute.start = comp->fmuData->simulationInfo->booleanParameter[8];
  comp->fmuData->modelData->booleanParameterData[9].attribute.start = comp->fmuData->simulationInfo->booleanParameter[9];
  comp->fmuData->modelData->booleanParameterData[10].attribute.start = comp->fmuData->simulationInfo->booleanParameter[10];
  comp->fmuData->modelData->booleanParameterData[11].attribute.start = comp->fmuData->simulationInfo->booleanParameter[11];
  comp->fmuData->modelData->booleanParameterData[12].attribute.start = comp->fmuData->simulationInfo->booleanParameter[12];
  comp->fmuData->modelData->booleanParameterData[13].attribute.start = comp->fmuData->simulationInfo->booleanParameter[13];
  comp->fmuData->modelData->booleanParameterData[14].attribute.start = comp->fmuData->simulationInfo->booleanParameter[14];
  comp->fmuData->modelData->booleanParameterData[15].attribute.start = comp->fmuData->simulationInfo->booleanParameter[15];
  comp->fmuData->modelData->booleanParameterData[16].attribute.start = comp->fmuData->simulationInfo->booleanParameter[16];
  comp->fmuData->modelData->booleanParameterData[17].attribute.start = comp->fmuData->simulationInfo->booleanParameter[17];
  comp->fmuData->modelData->booleanParameterData[18].attribute.start = comp->fmuData->simulationInfo->booleanParameter[18];
  comp->fmuData->modelData->booleanParameterData[19].attribute.start = comp->fmuData->simulationInfo->booleanParameter[19];
  comp->fmuData->modelData->booleanParameterData[20].attribute.start = comp->fmuData->simulationInfo->booleanParameter[20];
  comp->fmuData->modelData->booleanParameterData[21].attribute.start = comp->fmuData->simulationInfo->booleanParameter[21];
  comp->fmuData->modelData->booleanParameterData[22].attribute.start = comp->fmuData->simulationInfo->booleanParameter[22];
  comp->fmuData->modelData->booleanParameterData[23].attribute.start = comp->fmuData->simulationInfo->booleanParameter[23];
  comp->fmuData->modelData->booleanParameterData[24].attribute.start = comp->fmuData->simulationInfo->booleanParameter[24];
  comp->fmuData->modelData->booleanParameterData[25].attribute.start = comp->fmuData->simulationInfo->booleanParameter[25];
  comp->fmuData->modelData->booleanParameterData[26].attribute.start = comp->fmuData->simulationInfo->booleanParameter[26];
  comp->fmuData->modelData->booleanParameterData[27].attribute.start = comp->fmuData->simulationInfo->booleanParameter[27];
  comp->fmuData->modelData->booleanParameterData[28].attribute.start = comp->fmuData->simulationInfo->booleanParameter[28];
  comp->fmuData->modelData->booleanParameterData[29].attribute.start = comp->fmuData->simulationInfo->booleanParameter[29];
  comp->fmuData->modelData->booleanParameterData[30].attribute.start = comp->fmuData->simulationInfo->booleanParameter[30];
  comp->fmuData->modelData->booleanParameterData[31].attribute.start = comp->fmuData->simulationInfo->booleanParameter[31];
  comp->fmuData->modelData->booleanParameterData[32].attribute.start = comp->fmuData->simulationInfo->booleanParameter[32];
  comp->fmuData->modelData->booleanParameterData[33].attribute.start = comp->fmuData->simulationInfo->booleanParameter[33];
  comp->fmuData->modelData->booleanParameterData[34].attribute.start = comp->fmuData->simulationInfo->booleanParameter[34];
  comp->fmuData->modelData->booleanParameterData[35].attribute.start = comp->fmuData->simulationInfo->booleanParameter[35];
  comp->fmuData->modelData->booleanParameterData[36].attribute.start = comp->fmuData->simulationInfo->booleanParameter[36];
  comp->fmuData->modelData->booleanParameterData[37].attribute.start = comp->fmuData->simulationInfo->booleanParameter[37];
  comp->fmuData->modelData->booleanParameterData[38].attribute.start = comp->fmuData->simulationInfo->booleanParameter[38];
  comp->fmuData->modelData->booleanParameterData[39].attribute.start = comp->fmuData->simulationInfo->booleanParameter[39];
  comp->fmuData->modelData->booleanParameterData[40].attribute.start = comp->fmuData->simulationInfo->booleanParameter[40];
  comp->fmuData->modelData->booleanParameterData[41].attribute.start = comp->fmuData->simulationInfo->booleanParameter[41];
  comp->fmuData->modelData->booleanParameterData[42].attribute.start = comp->fmuData->simulationInfo->booleanParameter[42];
  comp->fmuData->modelData->booleanParameterData[43].attribute.start = comp->fmuData->simulationInfo->booleanParameter[43];
  comp->fmuData->modelData->booleanParameterData[44].attribute.start = comp->fmuData->simulationInfo->booleanParameter[44];
  comp->fmuData->modelData->booleanParameterData[45].attribute.start = comp->fmuData->simulationInfo->booleanParameter[45];
  comp->fmuData->modelData->booleanParameterData[46].attribute.start = comp->fmuData->simulationInfo->booleanParameter[46];
  comp->fmuData->modelData->booleanParameterData[47].attribute.start = comp->fmuData->simulationInfo->booleanParameter[47];
  comp->fmuData->modelData->booleanParameterData[48].attribute.start = comp->fmuData->simulationInfo->booleanParameter[48];
  comp->fmuData->modelData->booleanParameterData[49].attribute.start = comp->fmuData->simulationInfo->booleanParameter[49];
  comp->fmuData->modelData->booleanParameterData[50].attribute.start = comp->fmuData->simulationInfo->booleanParameter[50];
  comp->fmuData->modelData->booleanParameterData[51].attribute.start = comp->fmuData->simulationInfo->booleanParameter[51];
  comp->fmuData->modelData->booleanParameterData[52].attribute.start = comp->fmuData->simulationInfo->booleanParameter[52];
  comp->fmuData->modelData->booleanParameterData[53].attribute.start = comp->fmuData->simulationInfo->booleanParameter[53];
  comp->fmuData->modelData->booleanParameterData[54].attribute.start = comp->fmuData->simulationInfo->booleanParameter[54];
  comp->fmuData->modelData->booleanParameterData[55].attribute.start = comp->fmuData->simulationInfo->booleanParameter[55];
  comp->fmuData->modelData->booleanParameterData[56].attribute.start = comp->fmuData->simulationInfo->booleanParameter[56];
  comp->fmuData->modelData->booleanParameterData[57].attribute.start = comp->fmuData->simulationInfo->booleanParameter[57];
  comp->fmuData->modelData->booleanParameterData[58].attribute.start = comp->fmuData->simulationInfo->booleanParameter[58];
}

// Used to set the next time event, if any.
void eventUpdate(ModelInstance* comp, fmi2EventInfo* eventInfo) {
}

static const int realAliasIndexes[64] = {
  40, 41, 78, 5, 76, 77, 66, 67, 46, 47, 40, 41, 0, 79, 32, 40, 41, -75, -76, 76,
  77, 78, 31, -75, -76, 76, 77, 79, 78, 5, 66, 67, 54, 55, 46, 47, 56, 57, 66, 67,
  46, 47, 66, 67, 62, 63, 46, 47, 64, 65, 66, 67, 46, 47, 72, 73, 66, 67, 74, 75,
  76, 77, 66, 67
};

fmi2Real getReal(ModelInstance* comp, const fmi2ValueReference vr) {
  if (vr < 82) {
    return comp->fmuData->localData[0]->realVars[vr];
  }
  if (vr < 221) {
    return comp->fmuData->simulationInfo->realParameter[vr-82];
  }
  if (vr < 285) {
    int ix = realAliasIndexes[vr-221];
    return ix>=0 ? getReal(comp, ix) : -getReal(comp, -(ix+1));
  }
  return NAN;
}

fmi2Status setReal(ModelInstance* comp, const fmi2ValueReference vr, const fmi2Real value) {
  // set start value attribute for all variable that has start value, till initialization mode
  if (vr < 82 && (comp->state == model_state_instantiated || comp->state == model_state_initialization_mode)) {
    comp->fmuData->modelData->realVarsData[vr].attribute.start = value;
  }
  if (vr < 82) {
    comp->fmuData->localData[0]->realVars[vr] = value;
    return fmi2OK;
  }
  if (vr < 221) {
    comp->fmuData->simulationInfo->realParameter[vr-82] = value;
    return fmi2OK;
  }
  if (vr < 285) {
    int ix = realAliasIndexes[vr-221];
    return ix >= 0 ? setReal(comp, ix, value) : setReal(comp, -(ix+1), -value);
  }
  return fmi2Error;
}

fmi2Integer getInteger(ModelInstance* comp, const fmi2ValueReference vr) {
  if (vr < 0) {
    return comp->fmuData->localData[0]->integerVars[vr];
  }
  if (vr < 2) {
    return comp->fmuData->simulationInfo->integerParameter[vr-0];
  }
  return 0;
}

fmi2Status setInteger(ModelInstance* comp, const fmi2ValueReference vr, const fmi2Integer value) {
  // set start value attribute for all variable that has start value, till initialization mode
  if (vr < 0 && (comp->state == model_state_instantiated || comp->state == model_state_initialization_mode)) {
    comp->fmuData->modelData->integerVarsData[vr].attribute.start = value;
  }
  if (vr < 0) {
    comp->fmuData->localData[0]->integerVars[vr] = value;
    return fmi2OK;
  }
  if (vr < 2) {
    comp->fmuData->simulationInfo->integerParameter[vr-0] = value;
    return fmi2OK;
  }
  return fmi2Error;
}
fmi2Boolean getBoolean(ModelInstance* comp, const fmi2ValueReference vr) {
  switch (vr) {
    case 0 : return comp->fmuData->simulationInfo->booleanParameter[0]; break;
    case 1 : return comp->fmuData->simulationInfo->booleanParameter[1]; break;
    case 2 : return comp->fmuData->simulationInfo->booleanParameter[2]; break;
    case 3 : return comp->fmuData->simulationInfo->booleanParameter[3]; break;
    case 4 : return comp->fmuData->simulationInfo->booleanParameter[4]; break;
    case 5 : return comp->fmuData->simulationInfo->booleanParameter[5]; break;
    case 6 : return comp->fmuData->simulationInfo->booleanParameter[6]; break;
    case 7 : return comp->fmuData->simulationInfo->booleanParameter[7]; break;
    case 8 : return comp->fmuData->simulationInfo->booleanParameter[8]; break;
    case 9 : return comp->fmuData->simulationInfo->booleanParameter[9]; break;
    case 10 : return comp->fmuData->simulationInfo->booleanParameter[10]; break;
    case 11 : return comp->fmuData->simulationInfo->booleanParameter[11]; break;
    case 12 : return comp->fmuData->simulationInfo->booleanParameter[12]; break;
    case 13 : return comp->fmuData->simulationInfo->booleanParameter[13]; break;
    case 14 : return comp->fmuData->simulationInfo->booleanParameter[14]; break;
    case 15 : return comp->fmuData->simulationInfo->booleanParameter[15]; break;
    case 16 : return comp->fmuData->simulationInfo->booleanParameter[16]; break;
    case 17 : return comp->fmuData->simulationInfo->booleanParameter[17]; break;
    case 18 : return comp->fmuData->simulationInfo->booleanParameter[18]; break;
    case 19 : return comp->fmuData->simulationInfo->booleanParameter[19]; break;
    case 20 : return comp->fmuData->simulationInfo->booleanParameter[20]; break;
    case 21 : return comp->fmuData->simulationInfo->booleanParameter[21]; break;
    case 22 : return comp->fmuData->simulationInfo->booleanParameter[22]; break;
    case 23 : return comp->fmuData->simulationInfo->booleanParameter[23]; break;
    case 24 : return comp->fmuData->simulationInfo->booleanParameter[24]; break;
    case 25 : return comp->fmuData->simulationInfo->booleanParameter[25]; break;
    case 26 : return comp->fmuData->simulationInfo->booleanParameter[26]; break;
    case 27 : return comp->fmuData->simulationInfo->booleanParameter[27]; break;
    case 28 : return comp->fmuData->simulationInfo->booleanParameter[28]; break;
    case 29 : return comp->fmuData->simulationInfo->booleanParameter[29]; break;
    case 30 : return comp->fmuData->simulationInfo->booleanParameter[30]; break;
    case 31 : return comp->fmuData->simulationInfo->booleanParameter[31]; break;
    case 32 : return comp->fmuData->simulationInfo->booleanParameter[32]; break;
    case 33 : return comp->fmuData->simulationInfo->booleanParameter[33]; break;
    case 34 : return comp->fmuData->simulationInfo->booleanParameter[34]; break;
    case 35 : return comp->fmuData->simulationInfo->booleanParameter[35]; break;
    case 36 : return comp->fmuData->simulationInfo->booleanParameter[36]; break;
    case 37 : return comp->fmuData->simulationInfo->booleanParameter[37]; break;
    case 38 : return comp->fmuData->simulationInfo->booleanParameter[38]; break;
    case 39 : return comp->fmuData->simulationInfo->booleanParameter[39]; break;
    case 40 : return comp->fmuData->simulationInfo->booleanParameter[40]; break;
    case 41 : return comp->fmuData->simulationInfo->booleanParameter[41]; break;
    case 42 : return comp->fmuData->simulationInfo->booleanParameter[42]; break;
    case 43 : return comp->fmuData->simulationInfo->booleanParameter[43]; break;
    case 44 : return comp->fmuData->simulationInfo->booleanParameter[44]; break;
    case 45 : return comp->fmuData->simulationInfo->booleanParameter[45]; break;
    case 46 : return comp->fmuData->simulationInfo->booleanParameter[46]; break;
    case 47 : return comp->fmuData->simulationInfo->booleanParameter[47]; break;
    case 48 : return comp->fmuData->simulationInfo->booleanParameter[48]; break;
    case 49 : return comp->fmuData->simulationInfo->booleanParameter[49]; break;
    case 50 : return comp->fmuData->simulationInfo->booleanParameter[50]; break;
    case 51 : return comp->fmuData->simulationInfo->booleanParameter[51]; break;
    case 52 : return comp->fmuData->simulationInfo->booleanParameter[52]; break;
    case 53 : return comp->fmuData->simulationInfo->booleanParameter[53]; break;
    case 54 : return comp->fmuData->simulationInfo->booleanParameter[54]; break;
    case 55 : return comp->fmuData->simulationInfo->booleanParameter[55]; break;
    case 56 : return comp->fmuData->simulationInfo->booleanParameter[56]; break;
    case 57 : return comp->fmuData->simulationInfo->booleanParameter[57]; break;
    case 58 : return comp->fmuData->simulationInfo->booleanParameter[58]; break;
    default:
      return fmi2False;
  }
}

fmi2Status setBoolean(ModelInstance* comp, const fmi2ValueReference vr, const fmi2Boolean value) {
  switch (vr) {
    case 0 : comp->fmuData->simulationInfo->booleanParameter[0] = value; break;
    case 1 : comp->fmuData->simulationInfo->booleanParameter[1] = value; break;
    case 2 : comp->fmuData->simulationInfo->booleanParameter[2] = value; break;
    case 3 : comp->fmuData->simulationInfo->booleanParameter[3] = value; break;
    case 4 : comp->fmuData->simulationInfo->booleanParameter[4] = value; break;
    case 5 : comp->fmuData->simulationInfo->booleanParameter[5] = value; break;
    case 6 : comp->fmuData->simulationInfo->booleanParameter[6] = value; break;
    case 7 : comp->fmuData->simulationInfo->booleanParameter[7] = value; break;
    case 8 : comp->fmuData->simulationInfo->booleanParameter[8] = value; break;
    case 9 : comp->fmuData->simulationInfo->booleanParameter[9] = value; break;
    case 10 : comp->fmuData->simulationInfo->booleanParameter[10] = value; break;
    case 11 : comp->fmuData->simulationInfo->booleanParameter[11] = value; break;
    case 12 : comp->fmuData->simulationInfo->booleanParameter[12] = value; break;
    case 13 : comp->fmuData->simulationInfo->booleanParameter[13] = value; break;
    case 14 : comp->fmuData->simulationInfo->booleanParameter[14] = value; break;
    case 15 : comp->fmuData->simulationInfo->booleanParameter[15] = value; break;
    case 16 : comp->fmuData->simulationInfo->booleanParameter[16] = value; break;
    case 17 : comp->fmuData->simulationInfo->booleanParameter[17] = value; break;
    case 18 : comp->fmuData->simulationInfo->booleanParameter[18] = value; break;
    case 19 : comp->fmuData->simulationInfo->booleanParameter[19] = value; break;
    case 20 : comp->fmuData->simulationInfo->booleanParameter[20] = value; break;
    case 21 : comp->fmuData->simulationInfo->booleanParameter[21] = value; break;
    case 22 : comp->fmuData->simulationInfo->booleanParameter[22] = value; break;
    case 23 : comp->fmuData->simulationInfo->booleanParameter[23] = value; break;
    case 24 : comp->fmuData->simulationInfo->booleanParameter[24] = value; break;
    case 25 : comp->fmuData->simulationInfo->booleanParameter[25] = value; break;
    case 26 : comp->fmuData->simulationInfo->booleanParameter[26] = value; break;
    case 27 : comp->fmuData->simulationInfo->booleanParameter[27] = value; break;
    case 28 : comp->fmuData->simulationInfo->booleanParameter[28] = value; break;
    case 29 : comp->fmuData->simulationInfo->booleanParameter[29] = value; break;
    case 30 : comp->fmuData->simulationInfo->booleanParameter[30] = value; break;
    case 31 : comp->fmuData->simulationInfo->booleanParameter[31] = value; break;
    case 32 : comp->fmuData->simulationInfo->booleanParameter[32] = value; break;
    case 33 : comp->fmuData->simulationInfo->booleanParameter[33] = value; break;
    case 34 : comp->fmuData->simulationInfo->booleanParameter[34] = value; break;
    case 35 : comp->fmuData->simulationInfo->booleanParameter[35] = value; break;
    case 36 : comp->fmuData->simulationInfo->booleanParameter[36] = value; break;
    case 37 : comp->fmuData->simulationInfo->booleanParameter[37] = value; break;
    case 38 : comp->fmuData->simulationInfo->booleanParameter[38] = value; break;
    case 39 : comp->fmuData->simulationInfo->booleanParameter[39] = value; break;
    case 40 : comp->fmuData->simulationInfo->booleanParameter[40] = value; break;
    case 41 : comp->fmuData->simulationInfo->booleanParameter[41] = value; break;
    case 42 : comp->fmuData->simulationInfo->booleanParameter[42] = value; break;
    case 43 : comp->fmuData->simulationInfo->booleanParameter[43] = value; break;
    case 44 : comp->fmuData->simulationInfo->booleanParameter[44] = value; break;
    case 45 : comp->fmuData->simulationInfo->booleanParameter[45] = value; break;
    case 46 : comp->fmuData->simulationInfo->booleanParameter[46] = value; break;
    case 47 : comp->fmuData->simulationInfo->booleanParameter[47] = value; break;
    case 48 : comp->fmuData->simulationInfo->booleanParameter[48] = value; break;
    case 49 : comp->fmuData->simulationInfo->booleanParameter[49] = value; break;
    case 50 : comp->fmuData->simulationInfo->booleanParameter[50] = value; break;
    case 51 : comp->fmuData->simulationInfo->booleanParameter[51] = value; break;
    case 52 : comp->fmuData->simulationInfo->booleanParameter[52] = value; break;
    case 53 : comp->fmuData->simulationInfo->booleanParameter[53] = value; break;
    case 54 : comp->fmuData->simulationInfo->booleanParameter[54] = value; break;
    case 55 : comp->fmuData->simulationInfo->booleanParameter[55] = value; break;
    case 56 : comp->fmuData->simulationInfo->booleanParameter[56] = value; break;
    case 57 : comp->fmuData->simulationInfo->booleanParameter[57] = value; break;
    case 58 : comp->fmuData->simulationInfo->booleanParameter[58] = value; break;
    default:
      return fmi2Error;
  }
  return fmi2OK;
}

fmi2String getString(ModelInstance* comp, const fmi2ValueReference vr) {
  switch (vr) {
    default:
      return "";
  }
}

fmi2Status setString(ModelInstance* comp, const fmi2ValueReference vr, fmi2String value) {
  switch (vr) {
    default:
      return fmi2Error;
  }
  return fmi2OK;
}

fmi2Status setExternalFunction(ModelInstance* c, const fmi2ValueReference vr, const void* value){
  switch (vr) {
    default:
      return fmi2Error;
  }
  return fmi2OK;
}

/* function maps input references to a input index used in partialDerivatives */
fmi2ValueReference mapInputReference2InputNumber(const fmi2ValueReference vr) {
    switch (vr) {
      case 79: return 0; break;
      default:
        return -1;
    }
}
/* function maps output references to a input index used in partialDerivatives */
fmi2ValueReference mapOutputReference2OutputNumber(const fmi2ValueReference vr) {
    switch (vr) {
      case 40: return 0; break;
      case 41: return 1; break;
      case 78: return 2; break;
      case 80: return 3; break;
      case 81: return 4; break;
      default:
        return -1;
    }
}
/* function maps output references to an internal output Real derivatives */
fmi2ValueReference mapOutputReference2RealOutputDerivatives(const fmi2ValueReference vr) {
    switch (vr) {
      case 40: return -1; break;
      case 41: return -1; break;
      case 78: return -1; break;
      case 80: return -1; break;
      case 81: return -1; break;
      default:
        return -1;
    }
}
/* function maps initialUnknowns UnknownVars ValueReferences to an internal partial derivatives index */
fmi2ValueReference mapInitialUnknownsdependentIndex(const fmi2ValueReference vr) {
    switch (vr) {
      case 165: return 0; break;
      case 115: return 1; break;
      case 124: return 2; break;
      case 152: return 3; break;
      case 123: return 4; break;
      case 156: return 5; break;
      case 172: return 6; break;
      case 140: return 7; break;
      case 217: return 8; break;
      case 219: return 9; break;
      case 214: return 10; break;
      case 215: return 11; break;
      case 194: return 12; break;
      case 193: return 13; break;
      case 196: return 14; break;
      case 195: return 15; break;
      case 205: return 16; break;
      case 204: return 17; break;
      case 207: return 18; break;
      case 206: return 19; break;
      case 119: return 20; break;
      case 118: return 21; break;
      case 133: return 22; break;
      case 125: return 23; break;
      case 136: return 24; break;
      case 159: return 25; break;
      case 135: return 26; break;
      case 163: return 27; break;
      case 117: return 28; break;
      case 148: return 29; break;
      case 116: return 30; break;
      case 150: return 31; break;
      case 155: return 32; break;
      case 146: return 33; break;
      case 144: return 34; break;
      case 161: return 35; break;
      case 82: return 36; break;
      case 143: return 37; break;
      case 145: return 38; break;
      case 139: return 39; break;
      case 138: return 40; break;
      case 114: return 41; break;
      case 113: return 42; break;
      case 142: return 43; break;
      case 149: return 44; break;
      case 151: return 45; break;
      case 162: return 46; break;
      case 164: return 47; break;
      case 0: return 48; break;
      case 1: return 49; break;
      case 2: return 50; break;
      case 3: return 51; break;
      case 4: return 52; break;
      case 6: return 53; break;
      case 7: return 54; break;
      case 8: return 55; break;
      case 9: return 56; break;
      case 10: return 57; break;
      case 11: return 58; break;
      case 40: return 59; break;
      case 41: return 60; break;
      case 78: return 61; break;
      case 80: return 62; break;
      case 81: return 63; break;
      case 85: return 64; break;
      case 88: return 65; break;
      case 92: return 66; break;
      case 95: return 67; break;
      case 99: return 68; break;
      case 102: return 69; break;
      case 106: return 70; break;
      case 109: return 71; break;
      case 111: return 72; break;
      case 112: return 73; break;
      case 121: return 74; break;
      case 122: return 75; break;
      case 126: return 76; break;
      case 134: return 77; break;
      case 141: return 78; break;
      case 147: return 79; break;
      case 153: return 80; break;
      case 154: return 81; break;
      case 158: return 82; break;
      case 160: return 83; break;
      case 174: return 84; break;
      case 179: return 85; break;
      case 182: return 86; break;
      case 210: return 87; break;
      default:
        return -1;
    }
}
/* function maps initialUnknowns knownVars ValueReferences to an internal partial derivatives index */
fmi2ValueReference mapInitialUnknownsIndependentIndex(const fmi2ValueReference vr) {
    switch (vr) {
      case 5: return 0; break;
      case 79: return 1; break;
      case 104: return 2; break;
      case 105: return 3; break;
      case 107: return 4; break;
      case 108: return 5; break;
      case 110: return 6; break;
      case 120: return 7; break;
      case 127: return 8; break;
      case 128: return 9; break;
      case 129: return 10; break;
      case 130: return 11; break;
      case 131: return 12; break;
      case 132: return 13; break;
      case 137: return 14; break;
      case 157: return 15; break;
      case 166: return 16; break;
      case 167: return 17; break;
      case 168: return 18; break;
      case 169: return 19; break;
      case 170: return 20; break;
      case 171: return 21; break;
      case 173: return 22; break;
      case 175: return 23; break;
      case 176: return 24; break;
      case 181: return 25; break;
      case 183: return 26; break;
      case 184: return 27; break;
      case 185: return 28; break;
      case 186: return 29; break;
      case 187: return 30; break;
      case 188: return 31; break;
      case 189: return 32; break;
      case 190: return 33; break;
      case 192: return 34; break;
      case 197: return 35; break;
      case 198: return 36; break;
      case 199: return 37; break;
      case 200: return 38; break;
      case 201: return 39; break;
      case 203: return 40; break;
      case 208: return 41; break;
      case 209: return 42; break;
      case 211: return 43; break;
      case 212: return 44; break;
      case 213: return 45; break;
      case 216: return 46; break;
      case 218: return 47; break;
      case 220: return 48; break;
      default:
        return -1;
    }
}

#ifdef __cplusplus
}
#endif

