within PSSDesign.eFMUs4RTHIL.UnderDevelopment.fmuConfig;
function fmuExportPSS "Function to generate the FMU of the PSS"
  input String modelToOpen = "PSSDesign.Components.PSSTypeIImod4efmi" "Model to open";
  input String modelName = "fmuPSSv2Cvode" "User-selected FMU modelIdentifier (also used as modelName)";
  input String fmiVersion = "2" "FMI version, 1, 2 or 3.";
  input String fmiType = "all" "FMI type, me (model exchange), cs (co-simulation), all or csSolver (using Dymola solver).
                             Only affects modelDescription.xml; binary and source code always contain both.";
  input Boolean includeSource = true "Whether to include source code in FMU";
  input Integer includeImage = 2 "Whether to include the model image (0 - no image, 1 icon, 2 diagram)";
  input String includeVariables[:] = fill("", 0) "Variables in model to be included in the xml, if empty all that passes selected filters will be used";
  output String FMUname "FMI model identifier on success, empty string on failure";

algorithm
  Advanced.FMI.FMUIncludeSource :=true;
  Advanced.FMI.SourceCodeImport :=true;
  Advanced.Translation.Log.ExternalResources :=true;
  Advanced.EnableCodeExport :=true;

  FMUname :=translateModelFMU(
  modelToOpen,
  false,
  "fmuPSSv2",
  "2",
  "all",
  true,
  2,
  fill("", 0));
end fmuExportPSS;
