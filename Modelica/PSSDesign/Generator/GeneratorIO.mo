within PSSDesign.Generator;
model GeneratorIO
  "Generator, only synchronous machine with IO for linearization (no AVR, no PSS)"
  extends PSSDesign.Generator.GeneratorTemplate;
  OpenIPSL.Electrical.Machines.PSAT.Order6 machine(D = 0, M = 7, P_0 = P_0, Q_0 = Q_0, Sn = 2220000000, T1d0 = 8, T1q0 = 1, T2d0 = 0.03, T2q0 = 0.07, Taa = 0.002, V_b = V_b, Vn = 400000, angle_0 = angle_0, ra = 0.003, v_0 = v_0, x1d = 0.3, x1q = 0.65, x2d = 0.23, x2q = 0.25, xd = 1.81, xq = 1.76) annotation(
    Placement(visible = true, transformation(origin = {49, 5}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(transformation(origin = {-120, 10}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput w annotation(
    Placement(transformation(origin={110,80},    extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput vf0OUT "Initial field voltage [pu]"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,110})));
  Modelica.Blocks.Interfaces.RealOutput Pgen "Active power [pu]"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
  Modelica.Blocks.Interfaces.RealOutput Qgen "Reactive power [pu]"
    annotation (Placement(transformation(extent={{100,-90},{120,-70}})));
  Modelica.Blocks.Math.Feedback feedbackVf0 annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-30,20})));
  Modelica.Blocks.Math.Gain gainVf0(k=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,46})));
  Modelica.Blocks.Interfaces.RealOutput delta "Rotor angle"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput v "Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
equation
  connect(machine.p, pwPin) annotation(
    Line(points = {{80, 5}, {110, 5}, {110, 0}}, color = {0, 0, 255}));
  connect(machine.pm0, machine.pm) annotation(
    Line(points = {{24.2, -29.1}, {24.2, -32}, {-6, -32}, {-6, -10.5}, {11.8, -10.5}}, color = {0, 0, 127}));
  connect(machine.w, w) annotation(
    Line(points={{83.1,32.9},{83.1,80},{110,80}},            color = {0, 0, 127}));
  connect(machine.vf0, vf0OUT) annotation (Line(points={{24.2,39.1},{24.2,96},{
          0,96},{0,110}}, color={0,0,127}));
  connect(machine.P, Pgen) annotation (Line(points={{83.1,-4.3},{94,-4.3},{94,
          -40},{110,-40}}, color={0,0,127}));
  connect(machine.Q, Qgen) annotation (Line(points={{83.1,-16.7},{92,-16.7},{92,
          -80},{110,-80}}, color={0,0,127}));
  connect(gainVf0.y, feedbackVf0.u2)
    annotation (Line(points={{-30,35},{-30,28}}, color={0,0,127}));
  connect(gainVf0.u, machine.vf0) annotation (Line(points={{-30,58},{-30,64},{
          24.2,64},{24.2,39.1}}, color={0,0,127}));
  connect(u, feedbackVf0.u1) annotation (Line(points={{-120,10},{-74,10},{-74,
          20},{-38,20}}, color={0,0,127}));
  connect(feedbackVf0.y, machine.vf) annotation (Line(points={{-21,20},{-4.6,20},
          {-4.6,20.5},{11.8,20.5}}, color={0,0,127}));
  connect(machine.delta, delta) annotation (Line(points={{83.1,23.6},{94,23.6},
          {94,60},{110,60}}, color={0,0,127}));
  connect(machine.v, v) annotation (Line(points={{83.1,14.3},{96,14.3},{96,40},
          {110,40}}, color={0,0,127}));
end GeneratorIO;
