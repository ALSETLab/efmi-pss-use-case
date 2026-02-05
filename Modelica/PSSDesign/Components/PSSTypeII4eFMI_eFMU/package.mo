within PSSDesign.Components;
package PSSTypeII4eFMI_eFMU
  "eFMU Configuration by extending from DymolaEmbedded.EmbeddedConfiguration"
  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(model_name=
          "PSSDesign.Components.PSSTypeII4eFMI"),
    integrator_configuration(sample_period=0.001, solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    code_configuration(
      obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
    efmu_configuration(name="PSSTypeII4eFMI")
                                      );
end PSSTypeII4eFMI_eFMU;
