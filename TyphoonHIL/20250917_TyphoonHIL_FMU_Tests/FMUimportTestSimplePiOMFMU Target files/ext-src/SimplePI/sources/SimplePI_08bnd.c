/* update bound parameters and variable attributes (start, nominal, min, max) */
#include "SimplePI_model.h"
#if defined(__cplusplus)
extern "C" {
#endif


/*
equation index: 6
type: SIMPLE_ASSIGN
$START.PI.x = PI.x_start
*/
static void SimplePI_eqFunction_6(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6};
  (data->modelData->realVarsData[0] /* PI.x STATE(1) */).attribute .start = (data->simulationInfo->realParameter[2] /* PI.x_start PARAM */);
    (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* PI.x STATE(1) */) = (data->modelData->realVarsData[0] /* PI.x STATE(1) */).attribute .start;
    infoStreamPrint(OMC_LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[0].info /* PI.x */.name, (modelica_real) (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* PI.x STATE(1) */));
  TRACE_POP
}
OMC_DISABLE_OPT
int SimplePI_updateBoundVariableAttributes(DATA *data, threadData_t *threadData)
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
  SimplePI_eqFunction_6(data, threadData);
  if (OMC_ACTIVE_STREAM(OMC_LOG_INIT)) messageClose(OMC_LOG_INIT);
  
  TRACE_POP
  return 0;
}

void SimplePI_updateBoundParameters_0(DATA *data, threadData_t *threadData);

/*
equation index: 8
type: ALGORITHM

  assert(PI.initType >= Modelica.Blocks.Types.Init.NoInit and PI.initType <= Modelica.Blocks.Types.Init.InitialOutput, "Variable violating min/max constraint: Modelica.Blocks.Types.Init.NoInit <= PI.initType <= Modelica.Blocks.Types.Init.InitialOutput, has value: " + String(PI.initType, "d"));
*/
OMC_DISABLE_OPT
static void SimplePI_eqFunction_8(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,8};
  modelica_boolean tmp0;
  modelica_boolean tmp1;
  static const MMC_DEFSTRINGLIT(tmp2,144,"Variable violating min/max constraint: Modelica.Blocks.Types.Init.NoInit <= PI.initType <= Modelica.Blocks.Types.Init.InitialOutput, has value: ");
  modelica_string tmp3;
  modelica_metatype tmpMeta4;
  static int tmp5 = 0;
  if(!tmp5)
  {
    tmp0 = GreaterEq((data->simulationInfo->integerParameter[0] /* PI.initType PARAM */),1);
    tmp1 = LessEq((data->simulationInfo->integerParameter[0] /* PI.initType PARAM */),4);
    if(!(tmp0 && tmp1))
    {
      tmp3 = modelica_integer_to_modelica_string_format((data->simulationInfo->integerParameter[0] /* PI.initType PARAM */), (modelica_string) mmc_strings_len1[100]);
      tmpMeta4 = stringAppend(MMC_REFSTRINGLIT(tmp2),tmp3);
      {
        const char* assert_cond = "(PI.initType >= Modelica.Blocks.Types.Init.NoInit and PI.initType <= Modelica.Blocks.Types.Init.InitialOutput)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/Luigi/AppData/Roaming/.openmodelica/libraries/Modelica 4.0.0+maint.om/Blocks/Continuous.mo",513,5,516,40,0};
          infoStreamPrintWithEquationIndexes(OMC_LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta4));
        } else {
          FILE_INFO info = {"C:/Users/Luigi/AppData/Roaming/.openmodelica/libraries/Modelica 4.0.0+maint.om/Blocks/Continuous.mo",513,5,516,40,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta4));
        }
      }
      tmp5 = 1;
    }
  }
  TRACE_POP
}

/*
equation index: 9
type: ALGORITHM

  assert(PI.T >= 1e-60, "Variable violating min constraint: 1e-60 <= PI.T, has value: " + String(PI.T, "g"));
*/
OMC_DISABLE_OPT
static void SimplePI_eqFunction_9(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,9};
  modelica_boolean tmp6;
  static const MMC_DEFSTRINGLIT(tmp7,61,"Variable violating min constraint: 1e-60 <= PI.T, has value: ");
  modelica_string tmp8;
  modelica_metatype tmpMeta9;
  static int tmp10 = 0;
  if(!tmp10)
  {
    tmp6 = GreaterEq((data->simulationInfo->realParameter[0] /* PI.T PARAM */),1e-60);
    if(!tmp6)
    {
      tmp8 = modelica_real_to_modelica_string_format((data->simulationInfo->realParameter[0] /* PI.T PARAM */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta9 = stringAppend(MMC_REFSTRINGLIT(tmp7),tmp8);
      {
        const char* assert_cond = "(PI.T >= 1e-60)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/Luigi/AppData/Roaming/.openmodelica/libraries/Modelica 4.0.0+maint.om/Blocks/Continuous.mo",511,5,512,37,0};
          infoStreamPrintWithEquationIndexes(OMC_LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta9));
        } else {
          FILE_INFO info = {"C:/Users/Luigi/AppData/Roaming/.openmodelica/libraries/Modelica 4.0.0+maint.om/Blocks/Continuous.mo",511,5,512,37,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta9));
        }
      }
      tmp10 = 1;
    }
  }
  TRACE_POP
}
OMC_DISABLE_OPT
void SimplePI_updateBoundParameters_0(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  SimplePI_eqFunction_8(data, threadData);
  SimplePI_eqFunction_9(data, threadData);
  TRACE_POP
}
OMC_DISABLE_OPT
int SimplePI_updateBoundParameters(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  (data->simulationInfo->integerParameter[0] /* PI.initType PARAM */) = 1;
  data->modelData->integerParameterData[0].time_unvarying = 1;
  SimplePI_updateBoundParameters_0(data, threadData);
  TRACE_POP
  return 0;
}

#if defined(__cplusplus)
}
#endif

