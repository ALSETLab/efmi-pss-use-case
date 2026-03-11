within OpenIPSL_CHIL.Components.PSS.eFMUs.PSSTypeIISimpleHPF;
package SiLTest
  extends PSSTypeIISimpleHPF_SiLTest_generated(
    tolerances_default(
      absolute_x32(vs=3.0e-2),
      relative_x32(vs=3.0e-3),
      absolute_x64(vs=3.0e-2),
      relative_x64(vs=3.0e-3)),
    Test_SiL_Scenario_1_PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed(
        eBlock),
    Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c(
        eBlock));
end SiLTest;
