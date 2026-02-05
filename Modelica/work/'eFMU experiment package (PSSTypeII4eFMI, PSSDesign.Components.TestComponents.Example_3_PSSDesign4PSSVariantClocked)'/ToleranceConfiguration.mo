within 'eFMU experiment package (PSSTypeII4eFMI, PSSDesign.Components.TestComponents.Example_3_PSSDesign4PSSVariantClocked)';
record ToleranceConfiguration
  "Configuration of tolerances (absolute or relative)."

  extends .DymolaEmbedded.Icons.eFMI_ExperimentConfiguration;

  parameter Real vs=0 "PSS output signal";

  annotation (preferredView="info", Protection(hideFromBrowser=true));
end ToleranceConfiguration;
