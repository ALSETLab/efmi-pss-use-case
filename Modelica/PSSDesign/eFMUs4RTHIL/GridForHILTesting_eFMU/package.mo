within PSSDesign.eFMUs4RTHIL;
package GridForHILTesting_eFMU "eFMI export configuration"
  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(
      model_name="PSSDesign.eFMUs4RTHIL.GridForHILTesting"),
    integrator_configuration(
      sample_period(displayUnit="ms") = 0.001,
      solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    code_configuration(
      obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
    efmu_configuration(
      name="GridForHILTesting"));
end GridForHILTesting_eFMU;
