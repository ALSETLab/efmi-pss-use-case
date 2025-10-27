within efmuPSSeBlockDymolaEmbedded;
expandable connector TuningBus
  "Expandable connector type for provisioning runtime values used for
     recalibration."

  extends .DymolaEmbedded.Icons.TuningBus;
  extends __Tuning;

  annotation(preferredView = "info");
end TuningBus;
