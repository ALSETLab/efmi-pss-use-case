within PSSDesign.Components;
package PSSTypeII4eFMIwHPFilter_eFMU
  "eFMU Configuration by extending from DymolaEmbedded.EmbeddedConfiguration"
  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(model_name=
          "PSSDesign.Components.PSSTypeII4eFMIwHPFilter"),
    integrator_configuration(sample_period=0.001, solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    code_configuration(
      obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
    efmu_configuration(name="PSSTypeII4eFMIwHPF")
                                      );
  package SiLTest
    extends PSSTypeII4eFMIwHPF_SiLTest_generated(
      tolerances_default(
        absolute_x32(vs=1.0e-3),
        relative_x32(vs=1.0e-4),
        absolute_x64(vs=1.0e-6),
        relative_x64(vs=1.0e-8)),
      Test_SiL_Scenario_1_PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed(
          eBlock(
          Kw=10.8,
          T1=0.278203917593164,
          T2=0.0551479681529786,
          T3=0.278203917593164,
          T4=0.0551479681529786,
          vsmax=0.2,
          vsmin=-0.2)),
      Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c(
          eBlock(
          Kw=10.8,
          T1=0.278203917593164,
          T2=0.0551479681529786,
          T3=0.278203917593164,
          T4=0.0551479681529786,
          vsmax=0.2,
          vsmin=-0.2)));
  end SiLTest;
end PSSTypeII4eFMIwHPFilter_eFMU;
