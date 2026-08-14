within OpenIPSL_CHIL.Components.PSS.Blocks.WashoutFilter.HPFSimple;
model DLandSimpleHPF
  "Model to compare the frequency domain response of the derivative filter and the simple high pass filter"
  parameter Real Kw = 10.5;
  parameter Real Tw = 5.0;
  parameter Integer order = 1;
  WashoutFilter.HPFSimple.HighPassSimple HPSimple(Kw=Kw, Tw=Tw)
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  OpenIPSL.NonElectrical.Continuous.DerivativeLag
                                         derivativeLag(
    K=Kw*Tw,
    T=Tw,
    y_start=0,
    x_start=0)
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Modelica.Blocks.Interfaces.RealOutput yDL "Derivative lag output"
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Interfaces.RealOutput yHPFSimple "HPF variant output"
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
  Modelica.Blocks.Interfaces.RealInput u "Input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
equation
  connect(derivativeLag.y, yDL)
    annotation (Line(points={{11,20},{110,20}}, color={0,0,127}));
  connect(HPSimple.y, yHPFSimple)
    annotation (Line(points={{11,-20},{110,-20}}, color={0,0,127}));
  connect(HPSimple.u, u) annotation (Line(points={{-12,-20},{-80,-20},{-80,0},{
          -120,0}}, color={0,0,127}));
  connect(derivativeLag.u, u) annotation (Line(points={{-12,20},{-80,20},{-80,0},
          {-120,0}}, color={0,0,127}));
  annotation (Icon(graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={213,255,170},
          fillPattern=FillPattern.Solid),
        Polygon(lineColor={0,0,255},
                fillColor={28,108,200},
                pattern = LinePattern.None,
                fillPattern=FillPattern.Solid,
                points={{92,-10},{112,-20},{92,-30},{92,-10}}),
      Rectangle(lineColor={160,160,164},
        fillColor={255,255,255},
        fillPattern=FillPattern.Backward,
        extent={{-80,-80},{22,8}}),
      Line(origin={3.333,-8.667},   points = {{-83.333,34.667},{24.667,34.667},{42.667,-71.333}}, color={0,0,255},   smooth = Smooth.Bezier,
          thickness=1),
      Line(points={{-80,78},{-80,-90}},
        color={0,0,255},
          thickness=1),
      Polygon(lineColor={0,0,255},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineThickness=1),
      Polygon(lineColor={0,0,255},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{90,-80},{68,-72},{68,-88},{90,-80}},
          lineThickness=1),
      Line(points={{-90,-80},{82,-80}},
        color={0,0,255},
          thickness=1),
        Polygon(lineColor={0,0,255},
                fillColor={28,108,200},
                pattern = LinePattern.None,
                fillPattern=FillPattern.Solid,
                points={{94,30},{114,20},{94,10},{94,30}}),
        Text(
          extent={{-100,142},{100,100}},
          textColor={0,0,255},
          textString="%name")}));
end DLandSimpleHPF;
