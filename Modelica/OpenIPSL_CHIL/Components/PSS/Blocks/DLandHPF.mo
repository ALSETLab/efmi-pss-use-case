within OpenIPSL_CHIL.Components.PSS.Blocks;
model DLandHPF
  "Model to compare the frequency domain response of the derivative filter and high pass filter"
  parameter Real Kw = 10.5;
  parameter Real Tw = 5.0;
  parameter Integer order = 1;
  Blocks.DerivativeLagHighPass HPvariant(
    order=order,
    Kw=Kw,
    Tw=Tw)
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
  Modelica.Blocks.Interfaces.RealOutput yHP "HPF variant output"
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
  Modelica.Blocks.Interfaces.RealInput u "Input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
equation
  connect(derivativeLag.y, yDL)
    annotation (Line(points={{11,20},{110,20}}, color={0,0,127}));
  connect(HPvariant.y, yHP)
    annotation (Line(points={{11,-20},{110,-20}}, color={0,0,127}));
  connect(HPvariant.u, u) annotation (Line(points={{-12,-20},{-80,-20},{-80,0},{
          -120,0}}, color={0,0,127}));
  connect(derivativeLag.u, u) annotation (Line(points={{-12,20},{-80,20},{-80,0},
          {-120,0}}, color={0,0,127}));
  annotation (Icon(graphics={             Text(
          extent={{-100,-100},{100,-140}},
          textColor={28,108,200},
          textString="Der. Lag Block and HP Filter
"),     Polygon(lineColor={0,0,255},
                fillColor={28,108,200},
                pattern = LinePattern.None,
                fillPattern=FillPattern.Solid,
                points={{92,-10},{112,-20},{92,-30},{92,-10}}),
      Rectangle(lineColor={160,160,164},
        fillColor={255,255,255},
        fillPattern=FillPattern.Backward,
        extent={{-80,-80},{22,8}}),
      Line(origin={3.333,-8.667},   points = {{-83.333,34.667},{24.667,34.667},{42.667,-71.333}}, color = {0,0,127}, smooth = Smooth.Bezier),
      Line(points={{-80,78},{-80,-90}},
        color={192,192,192}),
      Polygon(lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{-80,90},{-88,68},{-72,68},{-80,90}}),
      Polygon(lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{90,-80},{68,-72},{68,-88},{90,-80}}),
      Line(points={{-90,-80},{82,-80}},
        color={192,192,192}),
        Polygon(lineColor={0,0,255},
                fillColor={28,108,200},
                pattern = LinePattern.None,
                fillPattern=FillPattern.Solid,
                points={{94,30},{114,20},{94,10},{94,30}})}));
end DLandHPF;
