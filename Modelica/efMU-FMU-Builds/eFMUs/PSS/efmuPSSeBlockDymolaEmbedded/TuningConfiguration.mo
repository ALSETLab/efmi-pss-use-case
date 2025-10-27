within efmuPSSeBlockDymolaEmbedded;
encapsulated record TuningConfiguration
  "Record type for selecting tuneable parameters to tune/recalibrate at runtime."

  extends .DymolaEmbedded.Icons.TuningBus;
  extends .DymolaEmbedded.Icons.Configuration;

  parameter Boolean Kw = false;
  parameter Boolean T1 = false;
  parameter Boolean T2 = false;
  parameter Boolean T3 = false;
  parameter Boolean T4 = false;
  parameter Boolean Tw = false;
  parameter Boolean vSI_start = false;
  parameter Boolean vsmax = false;
  parameter Boolean vsmin = false;

  annotation(preferredView = "info");
end TuningConfiguration;
