within OpenIPSL_CHIL.Components.PSS.Blocks;
model CompareDLandHPF
  "Compares the derivative filter and the high pass filter responses"
  extends Modelica.Icons.Example;
  DLandHPF testHPFdevlagReplacementLin(order=1)
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
  Modelica.Blocks.Interfaces.RealOutput yDL "Derivative lag output"
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Interfaces.RealOutput yHP "HPF variant output"
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
  Modelica.Blocks.Sources.Step step(startTime=5)
    "Ramps the frequency from smallest to largest value"
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
equation
  connect(testHPFdevlagReplacementLin.yDL, yDL) annotation (Line(points={{13,
          2},{20,2},{20,20},{110,20}}, color={0,0,127}));
  connect(testHPFdevlagReplacementLin.yHP, yHP) annotation (Line(points={{13,
          -2},{20,-2},{20,-20},{110,-20}}, color={0,0,127}));
  connect(step.y, testHPFdevlagReplacementLin.u)
    annotation (Line(points={{-59,0},{-10,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=100,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end CompareDLandHPF;
