/* Linearization */
#include "SimplePI_model.h"
#if defined(__cplusplus)
extern "C" {
#endif
const char *SimplePI_linear_model_frame()
{
  return "model linearized_model \"SimplePI\"\n"
  "  parameter Integer n = 1 \"number of states\";\n"
  "  parameter Integer m = 1 \"number of inputs\";\n"
  "  parameter Integer p = 1 \"number of outputs\";\n"
  "\n"
  "  parameter Real x0[n] = %s;\n"
  "  parameter Real u0[m] = %s;\n"
  "\n"
  "  parameter Real A[n, n] =\n\t[%s];\n\n"
  "  parameter Real B[n, m] =\n\t[%s];\n\n"
  "  parameter Real C[p, n] =\n\t[%s];\n\n"
  "  parameter Real D[p, m] =\n\t[%s];\n\n"
  "\n"
  "  Real x[n](start=x0);\n"
  "  input Real u[m](start=u0);\n"
  "  output Real y[p];\n"
  "\n"
  "  Real 'x_PI.x' = x[1];\n"
  "  Real 'u_u' = u[1];\n"
  "  Real 'y_y' = y[1];\n"
  "equation\n"
  "  der(x) = A * x + B * u;\n"
  "  y = C * x + D * u;\n"
  "end linearized_model;\n";
}
const char *SimplePI_linear_model_datarecovery_frame()
{
  return "model linearized_model \"SimplePI\"\n"
  "  parameter Integer n = 1 \"number of states\";\n"
  "  parameter Integer m = 1 \"number of inputs\";\n"
  "  parameter Integer p = 1 \"number of outputs\";\n"
  "  parameter Integer nz = 2 \"data recovery variables\";\n"
  "\n"
  "  parameter Real x0[n] = %s;\n"
  "  parameter Real u0[m] = %s;\n"
  "  parameter Real z0[nz] = %s;\n"
  "\n"
  "  parameter Real A[n, n] =\n\t[%s];\n\n"
  "  parameter Real B[n, m] =\n\t[%s];\n\n"
  "  parameter Real C[p, n] =\n\t[%s];\n\n"
  "  parameter Real D[p, m] =\n\t[%s];\n\n"
  "  parameter Real Cz[nz, n] =\n\t[%s];\n\n"
  "  parameter Real Dz[nz, m] =\n\t[%s];\n\n"
  "\n"
  "  Real x[n](start=x0);\n"
  "  input Real u[m](start=u0);\n"
  "  output Real y[p];\n"
  "  output Real z[nz];\n"
  "\n"
  "  Real 'x_PI.x' = x[1];\n"
  "  Real 'u_u' = u[1];\n"
  "  Real 'y_y' = y[1];\n"
  "  Real 'z_u' = z[1];\n"
  "  Real 'z_y' = z[2];\n"
  "equation\n"
  "  der(x) = A * x + B * u;\n"
  "  y = C * x + D * u;\n"
  "  z = Cz * x + Dz * u;\n"
  "end linearized_model;\n";
}
#if defined(__cplusplus)
}
#endif

