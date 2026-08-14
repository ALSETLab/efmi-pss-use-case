within OpenIPSL_CHIL.Examples.CHIL_Configuration.SiL_Tests;
package PSSTypeIISimpleHPF
  extends PSSTypeIISimpleHPF_CL_SiLTest_generated(
    tolerances_default(
      absolute_x32(vs=3.0e-2),
      relative_x32(vs=3.0e-3),
      absolute_x64(vs=3.0e-2),
      relative_x64(vs=3.0e-3)));
end PSSTypeIISimpleHPF;
