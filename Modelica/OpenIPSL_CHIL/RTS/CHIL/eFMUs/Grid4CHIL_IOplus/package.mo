within OpenIPSL_CHIL.RTS.CHIL.eFMUs;
package Grid4CHIL_IOplus "eFMI export configuration for [G4CHILTestMoreIO]]"

  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(model_name="OpenIPSL_CHIL.RTS.CHIL.Grid4CHIL_IOplus"),
    integrator_configuration(sample_period(displayUnit="s") = 0.0002,
                                                solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    code_configuration(obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
    efmu_configuration(name="Grid4CHIL_IOplus"));
end Grid4CHIL_IOplus;
