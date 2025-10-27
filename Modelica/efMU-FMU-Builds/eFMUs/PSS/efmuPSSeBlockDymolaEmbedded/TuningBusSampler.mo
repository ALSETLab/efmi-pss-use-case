within efmuPSSeBlockDymolaEmbedded;
model TuningBusSampler
  "Sampler for sampling a tuning bus with the clock of the clocked-partition
     the outgoing bus is part of."

  extends .DymolaEmbedded.Icons.TuningBusSampler;

  TuningBus ingoing
    annotation (
      Placement(
        transformation(extent={{-140,-50},{-40,50}}),
        iconTransformation(extent={{-140,-50},{-40,50}})));
  TuningBus outgoing
    annotation (
      Placement(
        transformation(extent={{40,-50},{140,50}}),
        iconTransformation(extent={{40,-50},{140,50}})));

protected
  __TuningBusDecoder decoder;
  __TuningBusEncoder encoder;

equation
  connect(ingoing, decoder.__bus);

  encoder.Kw = sample(decoder.Kw);
  encoder.T1 = sample(decoder.T1);
  encoder.T2 = sample(decoder.T2);
  encoder.T3 = sample(decoder.T3);
  encoder.T4 = sample(decoder.T4);
  encoder.Tw = sample(decoder.Tw);
  encoder.vSI_start = sample(decoder.vSI_start);
  encoder.vsmax = sample(decoder.vsmax);
  encoder.vsmin = sample(decoder.vsmin);

  connect(encoder.__bus, outgoing);

  annotation (preferredView = "info");
end TuningBusSampler;
