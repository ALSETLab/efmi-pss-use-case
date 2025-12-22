within PSSDesign.eFMU4CHIL;
package efmuCHILTestSPE
  "eFMI export configuration for CHIL Testing exported from SPE"
  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(model_name="PSSDesign.eFMU4CHIL.Grid4CHILTesting"),
    integrator_configuration(sample_period(displayUnit="ms") = 0.0001,
                                                solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    code_configuration(obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
    efmu_configuration(name="CHILTestSPE"),
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
end efmuCHILTestSPE;
