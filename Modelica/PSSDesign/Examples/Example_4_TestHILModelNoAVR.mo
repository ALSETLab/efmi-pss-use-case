within PSSDesign.Examples;
model Example_4_TestHILModelNoAVR "Tests model for HIL without AVR"
  extends Modelica.Icons.Example;
  FMUs4RTHIL.GenIO4HILinNetwork genIO4HILinNetwork
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Step step(height=0.05, startTime=5)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Interfaces.RealOutput w "Speed [pu]"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput v "Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Interfaces.RealOutput Pgen "Active power [pu]"
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
  Modelica.Blocks.Interfaces.RealOutput Qgen "Reactive power [pu]"
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
equation
  connect(step.y, genIO4HILinNetwork.vf)
    annotation (Line(points={{-59,0},{-24,0}}, color={0,0,127}));
  connect(genIO4HILinNetwork.w, w) annotation (Line(points={{22,16},{40,16},{40,
          40},{110,40}}, color={0,0,127}));
  connect(genIO4HILinNetwork.v, v) annotation (Line(points={{22,0},{96,0},{96,
          20},{110,20}}, color={0,0,127}));
  connect(genIO4HILinNetwork.Pgen, Pgen) annotation (Line(points={{22,-8},{40,
          -8},{40,-20},{110,-20}}, color={0,0,127}));
  connect(genIO4HILinNetwork.Qgen, Qgen) annotation (Line(points={{22,-16},{32,
          -16},{32,-60},{110,-60}}, color={0,0,127}));
  annotation (experiment(
      StopTime=30,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end Example_4_TestHILModelNoAVR;
