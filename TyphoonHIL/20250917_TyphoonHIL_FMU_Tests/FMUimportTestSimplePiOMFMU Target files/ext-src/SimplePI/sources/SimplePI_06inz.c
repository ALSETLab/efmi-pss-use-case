/* Initialization */
#include "SimplePI_model.h"
#include "SimplePI_11mix.h"
#include "SimplePI_12jac.h"
#if defined(__cplusplus)
extern "C" {
#endif

void SimplePI_functionInitialEquations_0(DATA *data, threadData_t *threadData);

/*
equation index: 1
type: SIMPLE_ASSIGN
PI.x = $START.PI.x
*/
void SimplePI_eqFunction_1(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1};
  (data->localData[0]->realVars[data->simulationInfo->realVarsIndex[0]] /* PI.x STATE(1) */) = (data->modelData->realVarsData[0] /* PI.x STATE(1) */).attribute .start;
  TRACE_POP
}
extern void SimplePI_eqFunction_5(DATA *data, threadData_t *threadData);

extern void SimplePI_eqFunction_4(DATA *data, threadData_t *threadData);

OMC_DISABLE_OPT
void SimplePI_functionInitialEquations_0(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  SimplePI_eqFunction_1(data, threadData);
  SimplePI_eqFunction_5(data, threadData);
  SimplePI_eqFunction_4(data, threadData);
  TRACE_POP
}

int SimplePI_functionInitialEquations(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->discreteCall = 1;
  SimplePI_functionInitialEquations_0(data, threadData);
  data->simulationInfo->discreteCall = 0;
  
  TRACE_POP
  return 0;
}

/* No SimplePI_functionInitialEquations_lambda0 function */

int SimplePI_functionRemovedInitialEquations(DATA *data, threadData_t *threadData)
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

