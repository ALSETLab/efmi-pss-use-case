within OpenIPSL_CHIL.Components.PSS.eFMUs.PSSTypeIIParam;
package SiLTest
  extends
    PSSTypeIIParam_SiLTest_generated(
      tolerances_default(
        absolute_x32(vs=1.0e-3),
        relative_x32(vs=1.0e-4),
        absolute_x64(vs=1.0e-6),
        relative_x64(vs=1.0e-8)));
end SiLTest;
