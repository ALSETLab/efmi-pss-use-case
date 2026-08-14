within OpenIPSL_CHIL.Components.PSS.eFMUs.PSSTypeIIHPFilter;
package SiLTest
  extends PSSTypeIIHPFilter_SiLTest_generated(
    tolerances_default(
      absolute_x32(vs=2.0e-2),
      relative_x32(vs=2.0e-3),
      absolute_x64(vs=5.0e-2),
      relative_x64(vs=5.0e-3)));
end SiLTest;
