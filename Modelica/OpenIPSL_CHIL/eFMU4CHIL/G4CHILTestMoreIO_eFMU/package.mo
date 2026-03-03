within OpenIPSL_CHIL.eFMU4CHIL;
package G4CHILTestMoreIO_eFMU
  "eFMI export configuration for [G4CHILTestMoreIO]]"

  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(model_name="PSSDesign.eFMU4CHIL.G4CHILTestMoreIO"),
    integrator_configuration(sample_period(displayUnit="s") = 0.0002,
                                                solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    code_configuration(obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
    efmu_configuration(name="G4CHILTestMoreIO"));
end G4CHILTestMoreIO_eFMU;
