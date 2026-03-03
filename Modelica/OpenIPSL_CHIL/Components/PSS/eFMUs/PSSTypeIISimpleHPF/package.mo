within OpenIPSL_CHIL.Components.PSS.eFMUs;
package PSSTypeIISimpleHPF
  "eFMU Configuration by extending from DymolaEmbedded.EmbeddedConfiguration"
  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(model_name=
          "OpenIPSL_CHIL.Components.PSS.PSSTypeIISimpleHPF"),
    integrator_configuration(sample_period=0.001, solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    code_configuration(
      obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
    efmu_configuration(name="PSSTypeIISimpleHPF")
                                      );
end PSSTypeIISimpleHPF;
