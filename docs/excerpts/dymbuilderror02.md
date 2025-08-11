Executing:
`` efmiPSSusecase.eBlockDymolaEmbedded.build()``

Gives the following error:


```
 = DymolaEmbedded.BuildUtilities.BuildResult(
  efmu = DymolaEmbedded.BuildUtilities.eFMU(
    name = "PSSefmu"
  ), 
  modelica_model = DymolaEmbedded.BuildUtilities.AlgorithmCode.Model(
    not_yet_supported = "", 
    model_name = "efmiPSSusecase.Components.PSSTypeIImod4efmi", 
    only_clocked = false
  ), 
  integrator = DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator(
    not_yet_supported = "", 
    sample_period = 0.001, 
    solver_method = DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.
      Explicit_Euler
  ), 
  code = DymolaEmbedded.BuildUtilities.AlgorithmCode.Code(
    obfuscate = DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.
      None, 
    fold_parameters = false
  ), 
  SPE = DymolaEmbedded.BuildUtilities.SPE_Configurations(
    production_codes = {DymolaEmbedded.BuildUtilities.ProductionCode.SPE_Configuration(
      not_yet_supported = "", 
      active = true, 
      float_precision = DymolaEmbedded.BuildUtilities.ProductionCode.FloatPrecision.
        x32
    ), DymolaEmbedded.BuildUtilities.ProductionCode.SPE_Configuration(
      not_yet_supported = "", 
      active = true, 
      float_precision = DymolaEmbedded.BuildUtilities.ProductionCode.FloatPrecision.
        x64
    )}, 
    binary_codes = {DymolaEmbedded.BuildUtilities.BinaryCode.SPE_Configuration(
      not_yet_supported = "", 
      active = true, 
      isa = DymolaEmbedded.BuildUtilities.BinaryCode.ISA.x86_32bit
    ), DymolaEmbedded.BuildUtilities.BinaryCode.SPE_Configuration(
      not_yet_supported = "", 
      active = true, 
      isa = DymolaEmbedded.BuildUtilities.BinaryCode.ISA.x86_64bit
    )}
  ), 
  error_message = "Failed to generate Algorithm Code container.", 
  succeeded = false
)
```