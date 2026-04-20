within OpenIPSL_CHIL.Examples.CHIL_Configuration.SiL_Tests;
package Grid4CHIL_IOplus
  extends Grid4CHIL_IOplus_CL_SiLTest_generated(
    tolerances_default(
      absolute_x32(
        Pgen=2.0e-2,
        Qgen=5.0e-3,
        v=1.0e-3,
        vf0OUT=1.0e-3,
        w=1.0e-3),
      relative_x32(
        Pgen=1.0e-4,
        Qgen=1.0e-4,
        v=1.0e-4,
        vf0OUT=1.0e-4,
        w=1.0e-4),
      absolute_x64(
        Pgen=1.0e-6,
        Qgen=1.0e-6,
        v=1.0e-6,
        vf0OUT=1.0e-6,
        w=1.0e-6),
      relative_x64(
        Pgen=1.0e-8,
        Qgen=1.0e-8,
        v=1.0e-8,
        vf0OUT=1.0e-8,
        w=1.0e-8)));
end Grid4CHIL_IOplus;
