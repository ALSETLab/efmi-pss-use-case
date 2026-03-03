within OpenIPSL_CHIL.Components.PSS.eFMUs;
package PSSTypeIIHPFilter
  "eFMU Configuration by extending from DymolaEmbedded.EmbeddedConfiguration"
  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(model_name=
          "OpenIPSL_CHIL.Components.PSS.PSSTypeIIHPFilter"),
    integrator_configuration(sample_period=0.001, solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    code_configuration(
      obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
    efmu_configuration(name="PSSTypeIIHPFilter")
                                      );
end PSSTypeIIHPFilter;
