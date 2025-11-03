within efmiPSSusecase;
package efmuPSS
  "eFMU Configuration by extending from DymolaEmbedded.EmbeddedConfiguration"
  extends DymolaEmbedded.EmbeddedConfiguration(
    model_configuration(model_name=
          "efmiPSSusecase.Components.PSSTypeIImod4efmi"),
    integrator_configuration(sample_period=0.001, solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
    code_configuration(
      obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
    efmu_configuration(name="efmuPSS"),
    SPE_configurations(production_codes={
          DymolaEmbedded.BuildUtilities.ProductionCode.SPE_Configuration(
          float_precision=DymolaEmbedded.BuildUtilities.ProductionCode.FloatPrecision.x32),
          DymolaEmbedded.BuildUtilities.ProductionCode.SPE_Configuration(
          float_precision=DymolaEmbedded.BuildUtilities.ProductionCode.FloatPrecision.x64)},
        binary_codes={
          DymolaEmbedded.BuildUtilities.BinaryCode.SPE_Configuration(isa=
          DymolaEmbedded.BuildUtilities.BinaryCode.ISA.x86_32bit),
          DymolaEmbedded.BuildUtilities.BinaryCode.SPE_Configuration(
          isa=DymolaEmbedded.BuildUtilities.BinaryCode.ISA.x86_64bit)})
                              );
end efmuPSS;
