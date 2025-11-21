#ifndef EFMI_APP_H
#define EFMI_APP_H
#include <stdbool.h>

void EFMI_App_Init(void);
void EFMI_App_Step(void);


void EFMI_SetInputs(bool fault, double vf);
void EFMI_GetOutputs(double *vf0OUT, double *w, double *v, double *pgen, double *qgen);


#endif
