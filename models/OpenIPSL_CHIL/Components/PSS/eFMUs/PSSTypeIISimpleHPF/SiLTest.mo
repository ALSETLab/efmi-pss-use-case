within OpenIPSL_CHIL.Components.PSS.eFMUs.PSSTypeIISimpleHPF;
package SiLTest
  extends PSSTypeIISimpleHPF_SiLTest_generated(
    tolerances_default(
      absolute_x32(vs=3.0e-2),
      relative_x32(vs=3.0e-3),
      absolute_x64(vs=3.0e-2),
      relative_x64(vs=3.0e-3)));
end SiLTest;
