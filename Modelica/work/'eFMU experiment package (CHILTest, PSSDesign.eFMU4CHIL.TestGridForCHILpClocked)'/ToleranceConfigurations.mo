within 'eFMU experiment package (CHILTest, PSSDesign.eFMU4CHIL.TestGridForCHILpClocked)';
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
