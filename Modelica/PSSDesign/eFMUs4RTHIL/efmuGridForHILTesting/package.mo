within PSSDesign.eFMUs4RTHIL;
package efmuGridForHILTesting "eFMI export configuration"
  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(model_name="PSSDesign.eFMUs4RTHIL.GridForHILTesting"),
    integrator_configuration(sample_period(displayUnit="ms") = 0.001,
        solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    code_configuration(obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
    SPE_configurations(production_codes={
          DymolaEmbedded.BuildUtilities.ProductionCode.SPE_Configuration(
          float_precision=DymolaEmbedded.BuildUtilities.ProductionCode.FloatPrecision.x32),
          DymolaEmbedded.BuildUtilities.ProductionCode.SPE_Configuration(
          float_precision=DymolaEmbedded.BuildUtilities.ProductionCode.FloatPrecision.x64)},
        binary_codes={
          DymolaEmbedded.BuildUtilities.BinaryCode.SPE_Configuration(isa=
          DymolaEmbedded.BuildUtilities.BinaryCode.ISA.x86_32bit),
          DymolaEmbedded.BuildUtilities.BinaryCode.SPE_Configuration(
          isa=DymolaEmbedded.BuildUtilities.BinaryCode.ISA.x86_64bit)}),
    efmu_configuration(name="Grid4HIL"));
end efmuGridForHILTesting;
