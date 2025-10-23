within PSSDesign.Components;
model FaultTimerLogic
  "Enter fault on time and fault off time as thresholds"
  extends Modelica.Blocks.Interfaces.partialBooleanSO;
  Modelica.Blocks.Logical.LessEqualThreshold lessEqThrshld(threshold=toff)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,-30})));
  Modelica.Blocks.Sources.ContinuousClock clock "Provides the time signal"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,10})));
  Modelica.Blocks.Logical.GreaterEqualThreshold gEqThrshld(threshold=ton)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,10})));
  Modelica.Blocks.Logical.And and1
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  parameter Real ton=0.5 "Start time of the fault";
  parameter Real toff=0.57 "End time of the fault";

equation
  connect(clock.y, gEqThrshld.u)
    annotation (Line(points={{-59,10},{-42,10}}, color={0,0,127}));
  connect(lessEqThrshld.u, clock.y) annotation (Line(points={{-42,-30},{-52,-30},
          {-52,10},{-59,10}}, color={0,0,127}));
  connect(gEqThrshld.y, and1.u1) annotation (Line(points={{-19,10},{-10,10},{-10,
          0},{-2,0}}, color={255,0,255}));
  connect(lessEqThrshld.y, and1.u2) annotation (Line(points={{-19,-30},{-10,-30},
          {-10,-8},{-2,-8}}, color={255,0,255}));
  connect(and1.y, y)
    annotation (Line(points={{21,0},{110,0}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
      Polygon(lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{-80,80},{-88,58},{-72,58},{-80,80}}),
      Line(points={{-80,58},{-80,-90}},
        color={192,192,192}),
      Line(points={{-90,-80},{82,-80}},
        color={192,192,192}),
      Polygon(lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{90,-80},{68,-72},{68,-88},{90,-80}}),
        Line(points={{-80,-80},{-50,-80},{-50,60},{40,60},{40,-80},{80,-80}},
            color={255,0,255},
          thickness=1)}),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end FaultTimerLogic;
