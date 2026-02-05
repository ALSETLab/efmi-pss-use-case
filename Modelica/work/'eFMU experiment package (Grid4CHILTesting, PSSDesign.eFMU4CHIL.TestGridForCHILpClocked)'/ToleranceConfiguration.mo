within 'eFMU experiment package (Grid4CHILTesting, PSSDesign.eFMU4CHIL.TestGridForCHILpClocked)';
record ToleranceConfiguration
  "Configuration of tolerances (absolute or relative)."

  extends .DymolaEmbedded.Icons.eFMI_ExperimentConfiguration;

  parameter Real Pgen=0 "Active power [pu]";
  parameter Real Qgen=0 "Reactive power [pu]";
  parameter Real v=0 "Generator terminal voltage [pu]";
  parameter Real vf0OUT=0 "Initial field voltage [pu]";
  parameter Real w=0 "Speed [pu]";

  annotation (preferredView="info", Protection(hideFromBrowser=true));
end ToleranceConfiguration;
