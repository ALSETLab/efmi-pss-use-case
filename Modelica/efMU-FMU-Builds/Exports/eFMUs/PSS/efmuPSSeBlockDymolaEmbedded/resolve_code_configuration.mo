within efmuPSSeBlockDymolaEmbedded;
function resolve_code_configuration
  "Retrieve the original Software Production Engineering configuration used
     to build one of the stub's production codes."
  extends .Modelica.Units.Icons.Conversion;

  input ProductionCodes code
    "Production code for which to lookup its build configuration.";

  output .DymolaEmbedded.BuildUtilities.ProductionCode.SPE_Configuration configuration
    "Software Production Engineering configuration used to build the respective
       production code.";

algorithm
  configuration := code_configurations[code];

  annotation (preferredView = "info");
end resolve_code_configuration;
