within OpenIPSL_CHIL.RTS.HIL.eFMUs;
package Grid4HIL "eFMI export configuration"
  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(model_name="OpenIPSL_CHIL.RTS.HIL.Grid4HIL"),
    integrator_configuration(
      sample_period(displayUnit="ms") = 0.001,
      solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    code_configuration(
      obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
    efmu_configuration(name="Grid4HIL")
                               );
end Grid4HIL;
