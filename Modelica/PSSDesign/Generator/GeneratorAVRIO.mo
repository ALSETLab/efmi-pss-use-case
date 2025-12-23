within PSSDesign.Generator;
model GeneratorAVRIO "Generator with AVR and I/O for linearization"
  extends PSSDesign.Generator.GeneratorTemplate;
  replaceable
  PSSDesign.Components.Machines.Order6 machine(D = 0, M = 7, P_0 = P_0, Q_0 = Q_0,
    Sn=2220000000,                                                                                      T1d0 = 8, T1q0 = 1, T2d0 = 0.03, T2q0 = 0.07, Taa = 0.002, V_b = V_b,
    Vn=400000,                                                                                                                                                                             angle_0 = angle_0, ra = 0.003, v_0 = v_0, x1d = 0.3, x1q = 0.65, x2d = 0.23, x2q = 0.25, xd = 1.81, xq = 1.76)
    constrainedby Components.Machines.Base.baseMachine                                                                                                                                                                                                         annotation(
    Placement(visible = true, transformation(origin = {49, 5}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    K0=K0,                                                       T1 = 1, T2 = 1,
    Te=0.3,                                                                                   Tr = 0.015, vfmax = 7, vfmin = -6.40) annotation(
    Placement(visible = true, transformation(origin = {8, 46}, extent = {{-54, -46}, {-14, -6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u(start=0.0)
                                         annotation(
    Placement(transformation(origin = {-120, 10}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput vf0OUT "Initial field voltage [pu]"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,110})));
  Modelica.Blocks.Interfaces.RealOutput w annotation(
    Placement(transformation(origin={110,80},    extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput delta "Rotor angle"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput v "Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput Pgen "Active power [pu]"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
  Modelica.Blocks.Interfaces.RealOutput Qgen "Reactive power [pu]"
    annotation (Placement(transformation(extent={{100,-90},{120,-70}})));
  parameter OpenIPSL.Types.PerUnit K0=200 "regulator gain"
    annotation (Dialog(group="AVR Parameters"));
equation
  connect(avr.vf, machine.vf) annotation(
    Line(points = {{-4.33333, 20}, {4, 20}, {4, 20.5}, {11.8, 20.5}}, color = {0, 0, 127}));
  connect(machine.p, pwPin) annotation(
    Line(points = {{80, 5}, {110, 5}, {110, 0}}, color = {0, 0, 255}));
  connect(machine.v, avr.v) annotation(
    Line(points={{83.1,14.3},{92,14.3},{92,68},{-70,68},{-70,30},{-44.3333,30}},              color = {0, 0, 127}));
  connect(machine.pm0, machine.pm) annotation(
    Line(points = {{24.2, -29.1}, {24.2, -32}, {-6, -32}, {-6, -10.5}, {11.8, -10.5}}, color = {0, 0, 127}));
  connect(machine.vf0, avr.vf0) annotation(
    Line(points={{24.2,39.1},{24.2,60},{-26,60},{-26,38.3333}},          color = {0, 0, 127}));
  connect(u, avr.vs) annotation(
    Line(points={{-120,10},{-44.3333,10}}, color = {0, 0, 127}));
  connect(vf0OUT, machine.vf0) annotation (Line(points={{0,110},{0,72},{24,72},
          {24,60},{24.2,60},{24.2,39.1}}, color={0,0,127}));
  connect(v, machine.v) annotation (Line(points={{110,40},{92,40},{92,14.3},{
          83.1,14.3}}, color={0,0,127}));
  connect(machine.delta, delta) annotation (Line(points={{83.1,23.6},{96,23.6},
          {96,60},{110,60}}, color={0,0,127}));
  connect(machine.w, w) annotation (Line(points={{83.1,32.9},{88,32.9},{88,80},
          {110,80}}, color={0,0,127}));
  connect(machine.P, Pgen) annotation (Line(points={{83.1,-4.3},{94,-4.3},{94,
          -40},{110,-40}}, color={0,0,127}));
  connect(machine.Q, Qgen) annotation (Line(points={{83.1,-16.7},{90,-16.7},{90,
          -80},{110,-80}}, color={0,0,127}));
  annotation (Icon(graphics={Text(
          extent={{-62,-60},{60,-100}},
          textColor={238,46,47},
          textString="AVR IO")}));
end GeneratorAVRIO;
