within OpenIPSL_CHIL.Components.PSS.Blocks.NoiseSupressionFilters;
model PSSCompareSimulate "Compares the PSSTypeIIParam model vs the PSSTypeIISimpleHPF models."
  extends Modelica.Icons.Example;
  PSSCompare pSSCompare(pssHPF(freqLow=15))
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Interfaces.RealOutput vsOUT_pssDL "PSS output signal"
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Interfaces.RealOutput vsOUT_pssHPF "PSS output signal"
    annotation (Placement(transformation(extent={{98,-30},{118,-10}})));
  Modelica.Blocks.Sources.SineVariableFrequencyAndAmplitude
                               sine(
    useConstantAmplitude=true,
    constantAmplitude=0.1,
    useConstantFrequency=false)
    "Ramps the frequency from smallest to largest value"
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=1,
    duration=20,
    offset=0.0,
    startTime=0)
    annotation (Placement(transformation(extent={{-94,-26},{-74,-6}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false)
    annotation (Placement(transformation(extent={{-94,20},{-74,40}})));
  Modelica.Blocks.Noise.UniformNoise uniformNoise(
    samplePeriod(displayUnit="ms") = 0.001,
    y_min=-0.03,
    y_max=0.03)
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
equation
  connect(pSSCompare.vsOUT_pssDL, vsOUT_pssDL) annotation (Line(points={{41,6},
          {94,6},{94,20},{110,20}}, color={0,0,127}));
  connect(pSSCompare.vsOUT_pssHPF, vsOUT_pssHPF) annotation (Line(points={{41,
          -4},{94,-4},{94,-20},{108,-20}}, color={0,0,127}));
  connect(ramp.y, sine.f)
    annotation (Line(points={{-73,-16},{-62,-16}}, color={0,0,127}));
  connect(pSSCompare.vSI, add.y)
    annotation (Line(points={{18,0},{1,0}}, color={0,0,127}));
  connect(uniformNoise.y, add.u1) annotation (Line(points={{-39,30},{-30,30},{
          -30,6},{-22,6}}, color={0,0,127}));
  connect(sine.y, add.u2) annotation (Line(points={{-39,-10},{-28,-10},{-28,-6},
          {-22,-6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=20,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end PSSCompareSimulate;
