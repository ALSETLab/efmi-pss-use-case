/* Main Simulation File */

#if defined(__cplusplus)
extern "C" {
#endif

#include "SimplePI_model.h"
#include "simulation/solver/events.h"



/* dummy VARINFO and FILEINFO */
const VAR_INFO dummyVAR_INFO = omc_dummyVarInfo;

int SimplePI_input_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[2]] /* u variable */) = data->simulationInfo->inputVars[0];
  
  TRACE_POP
  return 0;
}

int SimplePI_input_function_init(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->inputVars[0] = data->modelData->realVarsData[2].attribute.start;
  
  TRACE_POP
  return 0;
}

int SimplePI_input_function_updateStartValues(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->modelData->realVarsData[2].attribute.start = data->simulationInfo->inputVars[0];
  
  TRACE_POP
  return 0;
}

int SimplePI_inputNames(DATA *data, char ** names){
  TRACE_PUSH

  names[0] = (char *) data->modelData->realVarsData[2].info.name;
  
  TRACE_POP
  return 0;
}

int SimplePI_data_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  TRACE_POP
  return 0;
}

int SimplePI_dataReconciliationInputNames(DATA *data, char ** names){
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int SimplePI_dataReconciliationUnmeasuredVariables(DATA *data, char ** names)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int SimplePI_output_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->outputVars[0] = (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[3]] /* y variable */);
  
  TRACE_POP
  return 0;
}

int SimplePI_setc_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int SimplePI_setb_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}


/*
equation index: 4
type: SIMPLE_ASSIGN
$DER.PI.x = u / PI.T
*/
void SimplePI_eqFunction_4(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[1]] /* der(PI.x) STATE_DER */) = DIVISION_SIM((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[2]] /* u variable */),(data->simulationInfo->realParameter[0] /* PI.T PARAM */),"PI.T",equationIndexes);
  TRACE_POP
}
/*
equation index: 5
type: SIMPLE_ASSIGN
y = PI.k * (PI.x + u)
*/
void SimplePI_eqFunction_5(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,5};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[3]] /* y variable */) = ((data->simulationInfo->realParameter[1] /* PI.k PARAM */)) * ((data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* PI.x STATE(1) */) + (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[2]] /* u variable */));
  TRACE_POP
}

OMC_DISABLE_OPT
int SimplePI_functionDAE(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  int equationIndexes[1] = {0};
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_DAE);
#endif

  data->simulationInfo->needToIterate = 0;
  data->simulationInfo->discreteCall = 1;
  SimplePI_functionLocalKnownVars(data, threadData);
  SimplePI_eqFunction_4(data, threadData);

  SimplePI_eqFunction_5(data, threadData);
  data->simulationInfo->discreteCall = 0;
  
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_DAE);
#endif
  TRACE_POP
  return 0;
}


int SimplePI_functionLocalKnownVars(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

/* forwarded equations */
extern void SimplePI_eqFunction_4(DATA* data, threadData_t *threadData);

static void functionODE_system0(DATA *data, threadData_t *threadData)
{
  int id;

  static void (*const eqFunctions[1])(DATA*, threadData_t*) = {
    SimplePI_eqFunction_4
  };
  
  static const int eqIndices[1] = {
    4
  };
  
  for (id = 0; id < 1; id++) {
    eqFunctions[id](data, threadData);
    threadData->lastEquationSolved = eqIndices[id];
  }
}

int SimplePI_functionODE(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_FUNCTION_ODE);
#endif

  
  data->simulationInfo->callStatistics.functionODE++;
  
  SimplePI_functionLocalKnownVars(data, threadData);
  functionODE_system0(data, threadData);

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_FUNCTION_ODE);
#endif

  TRACE_POP
  return 0;
}

void SimplePI_computeVarIndices(size_t* realIndex, size_t* integerIndex, size_t* booleanIndex, size_t* stringIndex)
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
  realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* PI.x STATE(1) */
  
  /* derivativeVars */
  realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* der(PI.x) STATE_DER */
  
  /* algVars */
  realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* u variable */realIndex[i_real+1] = realIndex[i_real] + ((modelica_integer) 1); i_real++;  /* y variable */
  
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

#include "SimplePI_12jac.h"
#include "SimplePI_13opt.h"

struct OpenModelicaGeneratedFunctionCallbacks SimplePI_callback = {
   NULL,    /* performSimulation */
   NULL,    /* performQSSSimulation */
   NULL,    /* updateContinuousSystem */
   SimplePI_callExternalObjectDestructors,    /* callExternalObjectDestructors */
   NULL,    /* initialNonLinearSystem */
   NULL,    /* initialLinearSystem */
   NULL,    /* initialMixedSystem */
   #if !defined(OMC_NO_STATESELECTION)
   SimplePI_initializeStateSets,
   #else
   NULL,
   #endif    /* initializeStateSets */
   SimplePI_initializeDAEmodeData,
   SimplePI_computeVarIndices,
   SimplePI_functionODE,
   SimplePI_functionAlgebraics,
   SimplePI_functionDAE,
   SimplePI_functionLocalKnownVars,
   SimplePI_input_function,
   SimplePI_input_function_init,
   SimplePI_input_function_updateStartValues,
   SimplePI_data_function,
   SimplePI_output_function,
   SimplePI_setc_function,
   SimplePI_setb_function,
   SimplePI_function_storeDelayed,
   SimplePI_function_storeSpatialDistribution,
   SimplePI_function_initSpatialDistribution,
   SimplePI_updateBoundVariableAttributes,
   SimplePI_functionInitialEquations,
   1, /* useHomotopy - 0: local homotopy (equidistant lambda), 1: global homotopy (equidistant lambda), 2: new global homotopy approach (adaptive lambda), 3: new local homotopy approach (adaptive lambda)*/
   NULL,
   SimplePI_functionRemovedInitialEquations,
   SimplePI_updateBoundParameters,
   SimplePI_checkForAsserts,
   SimplePI_function_ZeroCrossingsEquations,
   SimplePI_function_ZeroCrossings,
   SimplePI_function_updateRelations,
   SimplePI_zeroCrossingDescription,
   SimplePI_relationDescription,
   SimplePI_function_initSample,
   SimplePI_INDEX_JAC_A,
   SimplePI_INDEX_JAC_B,
   SimplePI_INDEX_JAC_C,
   SimplePI_INDEX_JAC_D,
   SimplePI_INDEX_JAC_F,
   SimplePI_INDEX_JAC_H,
   SimplePI_initialAnalyticJacobianA,
   SimplePI_initialAnalyticJacobianB,
   SimplePI_initialAnalyticJacobianC,
   SimplePI_initialAnalyticJacobianD,
   SimplePI_initialAnalyticJacobianF,
   SimplePI_initialAnalyticJacobianH,
   SimplePI_functionJacA_column,
   SimplePI_functionJacB_column,
   SimplePI_functionJacC_column,
   SimplePI_functionJacD_column,
   SimplePI_functionJacF_column,
   SimplePI_functionJacH_column,
   SimplePI_linear_model_frame,
   SimplePI_linear_model_datarecovery_frame,
   SimplePI_mayer,
   SimplePI_lagrange,
   SimplePI_pickUpBoundsForInputsInOptimization,
   SimplePI_setInputData,
   SimplePI_getTimeGrid,
   SimplePI_symbolicInlineSystem,
   SimplePI_function_initSynchronous,
   SimplePI_function_updateSynchronous,
   SimplePI_function_equationsSynchronous,
   SimplePI_inputNames,
   SimplePI_dataReconciliationInputNames,
   SimplePI_dataReconciliationUnmeasuredVariables,
   SimplePI_read_simulation_info,
   SimplePI_read_input_fmu,
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

#define _OMC_LIT_RESOURCE_3_name_data "PSSDesign"
#define _OMC_LIT_RESOURCE_3_dir_data "C:/Users/Luigi/Documents/Github/efmi-pss-use-case/Modelica/PSSDesign"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_3_name,9,_OMC_LIT_RESOURCE_3_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_3_dir,68,_OMC_LIT_RESOURCE_3_dir_data);

static const MMC_DEFSTRUCTLIT(_OMC_LIT_RESOURCES,8,MMC_ARRAY_TAG) {MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_0_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_0_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_1_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_1_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_2_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_2_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_3_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_3_dir)}};
void SimplePI_setupDataStruc(DATA *data, threadData_t *threadData)
{
  assertStreamPrint(threadData,0!=data, "Error while initialize Data");
  threadData->localRoots[LOCAL_ROOT_SIMULATION_DATA] = data;
  data->callback = &SimplePI_callback;
  OpenModelica_updateUriMapping(threadData, MMC_REFSTRUCTLIT(_OMC_LIT_RESOURCES));
  data->modelData->modelName = "PSSDesign.FMUs4RTHIL.SimplePI";
  data->modelData->modelFilePrefix = "SimplePI";
  data->modelData->resultFileName = NULL;
  data->modelData->modelDir = "C:/Users/Luigi/Documents/Github/efmi-pss-use-case/Modelica/PSSDesign/FMUs4RTHIL";
  data->modelData->modelGUID = "{4976243b-afc1-4e5f-b898-1ee0f43d8734}";
  data->modelData->initXMLData = NULL;
  data->modelData->modelDataXml.infoXMLData = NULL;
  GC_asprintf(&data->modelData->modelDataXml.fileName, "%s/SimplePI_info.json", data->modelData->resourcesDir);
  data->modelData->runTestsuite = 0;
  data->modelData->nStates = 1;
  data->modelData->nVariablesRealArray = 4;
  data->modelData->nDiscreteReal = 0;
  data->modelData->nVariablesIntegerArray = 0;
  data->modelData->nVariablesBooleanArray = 0;
  data->modelData->nVariablesStringArray = 0;
  data->modelData->nParametersReal = 4;
  data->modelData->nParametersInteger = 1;
  data->modelData->nParametersBoolean = 0;
  data->modelData->nParametersString = 0;
  data->modelData->nInputVars = 1;
  data->modelData->nOutputVars = 1;
  data->modelData->nAliasReal = 3;
  data->modelData->nAliasInteger = 0;
  data->modelData->nAliasBoolean = 0;
  data->modelData->nAliasString = 0;
  data->modelData->nZeroCrossings = 0;
  data->modelData->nSamples = 0;
  data->modelData->nRelations = 0;
  data->modelData->nMathEvents = 0;
  data->modelData->nExtObjs = 0;
  data->modelData->modelDataXml.modelInfoXmlLength = 0;
  data->modelData->modelDataXml.nFunctions = 0;
  data->modelData->modelDataXml.nProfileBlocks = 0;
  data->modelData->modelDataXml.nEquations = 10;
  data->modelData->nMixedSystems = 0;
  data->modelData->nLinearSystems = 0;
  data->modelData->nNonLinearSystems = 0;
  data->modelData->nStateSets = 0;
  data->modelData->nJacobians = 6;
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

