within OpenIPSL_CHIL.RTS.CHIL.eFMUs;
package Grid4CHIL "eFMI export configuration for [Grid4CHILTesting]"

  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(model_name="OpenIPSL_CHIL.RTS.CHIL.Grid4CHIL"),
    integrator_configuration(sample_period(displayUnit="s") = 0.0002,
                                                solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    code_configuration(obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
    efmu_configuration(name="Grid4CHIL"));
end Grid4CHIL;
