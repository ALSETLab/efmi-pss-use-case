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
end PSSTypeII4eFMIwHPFilter_eFMU;
