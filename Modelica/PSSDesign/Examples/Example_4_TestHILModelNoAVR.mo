within PSSDesign.Examples;
model Example_4_TestHILModelNoAVR "Tests model for HIL without AVR"
  extends Modelica.Icons.Example;
  FMUs4RTHIL.GenIO4HILinNetwork genIO4HILinNetwork
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Step step(height=0.05, startTime=5)
    annotation (Placement(transformation(extent={{-62,-10},{-42,10}})));
equation
  connect(step.y, genIO4HILinNetwork.vf)
    annotation (Line(points={{-41,0},{-24,0}}, color={0,0,127}));
  annotation (experiment(StopTime=30, __Dymola_Algorithm="Dassl"));
end Example_4_TestHILModelNoAVR;
