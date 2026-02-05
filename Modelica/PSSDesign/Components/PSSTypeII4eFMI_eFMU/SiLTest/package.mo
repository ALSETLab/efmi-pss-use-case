within PSSDesign.Components.PSSTypeII4eFMI_eFMU;
package SiLTest
  extends
    'eFMU experiment package (PSSTypeII4eFMI, PSSDesign.Components.TestComponents.Example_3_PSSDesign4PSSVariantClocked)'
    (tolerances_default(
      absolute_x32(vs=1.0e-3),
      relative_x32(vs=1.0e-4),
      absolute_x64(vs=1.0e-6),
      relative_x64(vs=1.0e-8)),
    Test_SiL_Scenario_1_PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed(eBlock(Kw = 10.8, T1 = 0.278203917593164, T2 = 0.0551479681529786, T3 = 0.278203917593164, T4 = 0.0551479681529786, Tw = 5.0, vsmax = 0.2, vsmin = -0.2)),
    Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c(eBlock(Kw = 10.8, T1 = 0.278203917593164, T2 = 0.0551479681529786, T3 = 0.278203917593164, T4 = 0.0551479681529786, Tw = 5.0, vsmax = 0.2, vsmin = -0.2)));
end SiLTest;
