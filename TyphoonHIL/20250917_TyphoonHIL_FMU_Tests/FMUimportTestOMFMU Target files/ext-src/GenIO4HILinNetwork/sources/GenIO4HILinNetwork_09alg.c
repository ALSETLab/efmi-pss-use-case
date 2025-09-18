/* Algebraic */
#include "GenIO4HILinNetwork_model.h"

#ifdef __cplusplus
extern "C" {
#endif

/* forwarded equations */
extern void GenIO4HILinNetwork_eqFunction_146(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_147(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_187(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_188(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_189(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_190(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_191(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_192(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_193(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_194(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_195(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_196(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_197(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_198(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_199(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_200(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_201(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_202(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_203(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_204(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_205(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_206(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_207(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_208(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_209(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_210(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_217(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_218(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_219(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_220(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_221(DATA* data, threadData_t *threadData);
extern void GenIO4HILinNetwork_eqFunction_222(DATA* data, threadData_t *threadData);

static void functionAlg_system0(DATA *data, threadData_t *threadData)
{
  int id;

  static void (*const eqFunctions[32])(DATA*, threadData_t*) = {
    GenIO4HILinNetwork_eqFunction_146,
    GenIO4HILinNetwork_eqFunction_147,
    GenIO4HILinNetwork_eqFunction_187,
    GenIO4HILinNetwork_eqFunction_188,
    GenIO4HILinNetwork_eqFunction_189,
    GenIO4HILinNetwork_eqFunction_190,
    GenIO4HILinNetwork_eqFunction_191,
    GenIO4HILinNetwork_eqFunction_192,
    GenIO4HILinNetwork_eqFunction_193,
    GenIO4HILinNetwork_eqFunction_194,
    GenIO4HILinNetwork_eqFunction_195,
    GenIO4HILinNetwork_eqFunction_196,
    GenIO4HILinNetwork_eqFunction_197,
    GenIO4HILinNetwork_eqFunction_198,
    GenIO4HILinNetwork_eqFunction_199,
    GenIO4HILinNetwork_eqFunction_200,
    GenIO4HILinNetwork_eqFunction_201,
    GenIO4HILinNetwork_eqFunction_202,
    GenIO4HILinNetwork_eqFunction_203,
    GenIO4HILinNetwork_eqFunction_204,
    GenIO4HILinNetwork_eqFunction_205,
    GenIO4HILinNetwork_eqFunction_206,
    GenIO4HILinNetwork_eqFunction_207,
    GenIO4HILinNetwork_eqFunction_208,
    GenIO4HILinNetwork_eqFunction_209,
    GenIO4HILinNetwork_eqFunction_210,
    GenIO4HILinNetwork_eqFunction_217,
    GenIO4HILinNetwork_eqFunction_218,
    GenIO4HILinNetwork_eqFunction_219,
    GenIO4HILinNetwork_eqFunction_220,
    GenIO4HILinNetwork_eqFunction_221,
    GenIO4HILinNetwork_eqFunction_222
  };
  
  static const int eqIndices[32] = {
    146,
    147,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    208,
    209,
    210,
    217,
    218,
    219,
    220,
    221,
    222
  };
  
  for (id = 0; id < 32; id++) {
    eqFunctions[id](data, threadData);
    threadData->lastEquationSolved = eqIndices[id];
  }
}
/* for continuous time variables */
int GenIO4HILinNetwork_functionAlgebraics(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_ALGEBRAICS);
#endif
  data->simulationInfo->callStatistics.functionAlgebraics++;

  GenIO4HILinNetwork_function_savePreSynchronous(data, threadData);
  
  functionAlg_system0(data, threadData);

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_ALGEBRAICS);
#endif

  TRACE_POP
  return 0;
}

#ifdef __cplusplus
}
#endif
