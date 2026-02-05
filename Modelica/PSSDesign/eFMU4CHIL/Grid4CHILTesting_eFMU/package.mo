within PSSDesign.eFMU4CHIL;
package Grid4CHILTesting_eFMU
  "eFMI export configuration for [Grid4CHILTesting]"

  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(model_name="PSSDesign.eFMU4CHIL.Grid4CHILTesting"),
    integrator_configuration(sample_period(displayUnit="s") = 0.0002,
                                                solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    code_configuration(obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
    efmu_configuration(name="Grid4CHILTesting"));
end Grid4CHILTesting_eFMU;
