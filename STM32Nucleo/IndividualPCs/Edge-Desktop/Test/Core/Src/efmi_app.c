#include "efmi_app.h"
#include "block.h"
#include <string.h>

typedef BlockState_H283cd02180511b024b59731032fd3290f8675b29_cb4a8a449b4ada864625ee5a4355578a3aaf08ed efmiType;
static efmiType efmi;

#define EFMI_TS (0.001) // example: 1 ms; keep equal to model discrete_stepSize



//static void EFMI_LoadParameters(model_t *s) {
//  s->discrete_stepSize = (Real)EFMI_TS;
//  /* TODO: set all required constants/params from your manifest/config */
//  s->SysData_fn = (Real)50.0;
//  s->SysData_S_b = (Real)100e6;
//  /* ... fill in transformer_*, G1_machine_*, L1_*, L2_* as required ... */
//}
//
//static void EFMI_LoadInitialStates(model_t *s) {
//  /* Set initial states if your model expects them, else leave zeroed */
//  s->G1_machine_w = (Real)(2.0*3.141592653589793*50.0);
//}

static struct {
  Boolean fault;
  Real v, vf, w, Pgen, Qgen;
} efmi_cache;



void EFMI_SetInputs(bool fault, double vf) {
	efmi_cache.fault = fault ? 1 : 0;
	efmi_cache.vf = (Real)vf;
}

void EFMI_GetOutputs(double *vf0OUT, double *w, double *v, double *pgen, double *qgen)
{
    if (vf0OUT) *vf0OUT = (double)efmi.vf0OUT;   // model output
    if (w)      *w      = (double)efmi.w;        // port/state (electrical speed)
    if (v)      *v      = (double)efmi.v;        // terminal voltage (model port)
    if (pgen)   *pgen   = (double)efmi.Pgen;     // active power (model port)
    if (qgen)   *qgen   = (double)efmi.Qgen;     // reactive power (model port)
}

void EFMI_App_Init(void) {
	memset(&efmi, 0, sizeof(efmi));
	memset(&efmi_cache, 0, sizeof(efmi_cache));

	Startup_H283cd02180511b024b59731032fd3290f8675b29_cb4a8a449b4ada864625ee5a4355578a3aaf08ed(&efmi);
}

void EFMI_App_Step(void) {
	efmi.fault = efmi_cache.fault;
	efmi.vf    = efmi_cache.vf;
	DoStep_H283cd02180511b024b59731032fd3290f8675b29_cb4a8a449b4ada864625ee5a4355578a3aaf08ed(&efmi);
}
