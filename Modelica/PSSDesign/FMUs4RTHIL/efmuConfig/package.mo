within PSSDesign.FMUs4RTHIL;
package efmuConfig "Configures the model for efmu code generation (export)"
  extends DymolaEmbedded.EmbeddedConfiguration(model_configuration(model_name=
          "PSSDesign.FMUs4RTHIL.GridForHILTesting"),  integrator_configuration(
        sample_period(displayUnit="ms") = 0.001, solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler));
end efmuConfig;
