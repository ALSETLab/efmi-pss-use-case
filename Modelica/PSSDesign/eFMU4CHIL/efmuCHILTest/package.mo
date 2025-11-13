within PSSDesign.eFMU4CHIL;
package efmuCHILTest "eFMI export configuration for CHIL Testing"
  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(model_name="PSSDesign.eFMU4CHIL.Grid4CHILTesting"),
    integrator_configuration(sample_period(displayUnit="s") = 0.0002,
                                                solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    code_configuration(obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
    efmu_configuration(name="CHILTest"),
    SPE_configurations(production_codes={
          DymolaEmbedded.BuildUtilities.ProductionCode.SPE_Configuration(
          float_precision=DymolaEmbedded.BuildUtilities.ProductionCode.FloatPrecision.x32),
          DymolaEmbedded.BuildUtilities.ProductionCode.SPE_Configuration(
          float_precision=DymolaEmbedded.BuildUtilities.ProductionCode.FloatPrecision.x64)},
        binary_codes={
          DymolaEmbedded.BuildUtilities.BinaryCode.SPE_Configuration(isa=
          DymolaEmbedded.BuildUtilities.BinaryCode.ISA.x86_32bit),
          DymolaEmbedded.BuildUtilities.BinaryCode.SPE_Configuration(
          isa=DymolaEmbedded.BuildUtilities.BinaryCode.ISA.x86_64bit)}));
end efmuCHILTest;
