within 'eFMU experiment package (efmuPSS, efmiPSSusecase.Experiments.Example_3_PSSDesign4PSSVariantClocked)';
record ToleranceConfigurations "Configuration of absolute and relative tolerances for varying
     floating-point precisions."

  extends .DymolaEmbedded.Icons.eFMI_ExperimentConfiguration;

  parameter ToleranceConfiguration absolute_x32
    "Absolute tolerances (x32-bit floating-point precision).";
  parameter ToleranceConfiguration relative_x32
    "Relative tolerances (x32-bit floating-point precision).";

  parameter ToleranceConfiguration absolute_x64
    "Absolute tolerances (x64-bit floating-point precision).";
  parameter ToleranceConfiguration relative_x64
    "Relative tolerances (x64-bit floating-point precision).";

  annotation (preferredView="info", Protection(hideFromBrowser=true));
end ToleranceConfigurations;
