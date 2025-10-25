within PSSDesign.Components.PSS;
package PSSeFMUConfiguration
  "Extends from Dymola's EmbeddedConfiguration block to setup and build the eFMU"
  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(model_name="PSSDesign.Components.PSSTypeIImod4efmi"),
    integrator_configuration(sample_period(displayUnit="ms") = 0.001,
        solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    dymola_production_code_configuration(active=true),
    efmu_configuration(name="ePSS"));
end PSSeFMUConfiguration;
