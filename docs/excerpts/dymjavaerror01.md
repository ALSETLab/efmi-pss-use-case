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
  error_message = "Failed to generate Production Code container [PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed].
  No Java installation found.
  A Java Runtime Environment of at least version 17 is required.
  The Java installation to use can be denoted via (in order of priority):
    1. Setting DYMOLA_JAVA_HOME to the root directory of your Java installation.
    2. Setting JAVA_HOME to the root directory of your Java installation.
    3. Having a suiteable Java installation in its default installation directory.
  In any case, the name of the root directory of the Java installation must start
  with either 'jdk-', 'jre-' or 'java-' followed by a version number.
  For details, please consult DymolaEmbedded.BuildUtilities.ExternalResources.resolve_JAVA_HOME().",
     
  succeeded = false
)

```