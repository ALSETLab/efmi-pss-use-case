within OpenIPSL_CHIL.Components.PSS.eFMUs;
package PSSTypeIIParam
  "eFMU Configuration by extending from DymolaEmbedded.EmbeddedConfiguration"
  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(model_name=
          "OpenIPSL_CHIL.Components.PSS.PSSTypeIIParam"),
    integrator_configuration(sample_period(displayUnit="ms") = 0.0002,
                                                  solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    code_configuration(
      obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
    efmu_configuration(name="PSSTypeIIParam")
                                      );
end PSSTypeIIParam;
