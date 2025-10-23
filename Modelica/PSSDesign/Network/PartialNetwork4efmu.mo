within PSSDesign.Network;
model PartialNetwork4efmu
  "Partial network model using components with modifications for eFMU export"
  OpenIPSL.Electrical.Buses.Bus B1 annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B2 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B3 annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-30, -10}, {30, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
    Placement(visible = true, transformation(origin = {12, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
  Components.PwLine4efmi L1(
    B=0,
    G=0,
    R=0,
    S_b(displayUnit="V.A") = 100000000,
    X=0.5*100/2220) annotation (Placement(visible=true, transformation(
        origin={0,0},
        extent={{20,10},{40,30}},
        rotation=0)));
  Components.PwLine4efmi L2(
    B=0,
    G=0,
    R=0,
    S_b(displayUnit="V.A") = 100000000,
    X=0.93*100/2220) annotation (Placement(visible=true, transformation(
        origin={0,0},
        extent={{20,-30},{40,-10}},
        rotation=0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(P_0 = -1998000000, Q_0 = 87066000, angle_0 = 0, v_0 = 0.90081) annotation(
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Components.PwFault4efmi            pwFault4efmi(
                                             R = 0, X = 0.01*100/2220)                      annotation(
    Placement(visible = true, transformation(origin={0,-20},  extent = {{20, -60}, {40, -40}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression tripL2(y=false)
    "Default false = off" annotation (Placement(transformation(
        extent={{-6,-7},{6,7}},
        rotation=0,
        origin={18,-33})));
  Modelica.Blocks.Sources.BooleanExpression tripL1(y=false)
    "Default false = off" annotation (Placement(transformation(
        extent={{-6,-7},{6,7}},
        rotation=0,
        origin={18,7})));
equation
  connect(B1.p, transformer.p) annotation(
    Line(points = {{-60, 0}, {-39, 0}}, color = {0, 0, 255}));
  connect(transformer.n, B2.p) annotation(
    Line(points = {{-17, 0}, {0, 0}}, color = {0, 0, 255}));
  connect(B2.p, L1.p)
    annotation (Line(points={{0,0},{10,0},{10,20},{21,20}}, color={0,0,255}));
  connect(L2.p, B2.p) annotation (Line(points={{21,-20},{10,-20},{10,0},{0,0}},
        color={0,0,255}));
  connect(pwFault4efmi.p, B2.p)
    annotation (Line(points={{18.3333,-70},{0,-70},{0,0}}, color={0,0,255}));
  connect(B3.p, L1.n)
    annotation (Line(points={{60,0},{50,0},{50,20},{39,20}}, color={0,0,255}));
  connect(L2.n, B3.p) annotation (Line(points={{39,-20},{50,-20},{50,0},{60,0}},
        color={0,0,255}));
  connect(infiniteBus.p, B3.p) annotation(
    Line(points = {{70, 0}, {60, 0}}, color = {0, 0, 255}));
  connect(tripL2.y, L2.trip) annotation (Line(points={{24.6,-33},{30,-33},{30,
          -26}}, color={255,0,255}));
  connect(tripL1.y, L1.trip)
    annotation (Line(points={{24.6,7},{30,7},{30,14}}, color={255,0,255}));
  annotation (Icon(graphics={
        Ellipse(lineColor={28,108,200},
                extent={{-100,-100},{100,100}},
          lineThickness=1),
        Rectangle(
          extent={{-94,-92},{6,-52}},
          lineColor={95,95,95},
          pattern=LinePattern.None,
          fillColor={100,187,75},
          fillPattern=FillPattern.Solid,
          radius=10),
        Rectangle(
          extent={{-78,-88},{-74,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-68,-88},{-64,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-58,-88},{-54,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-48,-88},{-44,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-38,-88},{-34,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-78,-44},{-74,-56}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-68,-44},{-64,-56}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-58,-44},{-54,-56}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-48,-44},{-44,-56}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-38,-44},{-34,-56}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-28,-44},{-24,-56}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-18,-44},{-14,-56}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={6,-56},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={6,-66},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={6,-76},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={6,-86},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-94,-86},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-94,-76},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-94,-66},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-94,-56},
          rotation=90),
        Rectangle(
          extent={{-86,-86},{-4,-58}},
          lineColor={95,95,95},
          pattern=LinePattern.None,
          fillColor={130,238,94},
          fillPattern=FillPattern.Solid,
          radius=10),    Text(
          extent={{-86,-52},{-6,-92}},
          lineColor={0,140,72},
          textString="eFMI"),
        Rectangle(
          extent={{-38,-88},{-34,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-28,-88},{-24,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-18,-88},{-14,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0})}),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.0001),
    Diagram(coordinateSystem(grid={2,2})));
end PartialNetwork4efmu;
