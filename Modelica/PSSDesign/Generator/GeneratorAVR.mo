within PSSDesign.Generator;
model GeneratorAVR "Generator with AVR (no PSS)"
  extends PSSDesign.Generator.GeneratorTemplate;
  OpenIPSL.Electrical.Machines.PSAT.Order6 machine(D = 0, M = 7, P_0 = P_0, Q_0 = Q_0, Sn = 2220000000, T1d0 = 8, T1q0 = 1, T2d0 = 0.03, T2q0 = 0.07, Taa = 0.002, V_b = V_b, Vn = 400000, angle_0 = angle_0, ra = 0.003, v_0 = v_0, x1d = 0.3, x1q = 0.65, x2d = 0.23, x2q = 0.25, xd = 1.81, xq = 1.76) annotation(
    Placement(visible = true, transformation(origin = {49, 5}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(K0 = 200, T1 = 1, T2 = 1, Te = 0.0001, Tr = 0.015, vfmax = 7, vfmin = -6.40) annotation(
    Placement(visible = true, transformation(origin = {8, 46}, extent = {{-54, -46}, {-14, -6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant pss_off(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(avr.vf, machine.vf) annotation(
    Line(points = {{-4.33333, 20}, {4, 20}, {4, 20.5}, {11.8, 20.5}}, color = {0, 0, 127}));
  connect(machine.p, pwPin) annotation(
    Line(points = {{80, 5}, {110, 5}, {110, 0}}, color = {0, 0, 255}));
  connect(machine.v, avr.v) annotation(
    Line(points = {{83.1, 14.3}, {98, 14.3}, {98, 80}, {-70, 80}, {-70, 30}, {-44.3333, 30}}, color = {0, 0, 127}));
  connect(machine.pm0, machine.pm) annotation(
    Line(points = {{24.2, -29.1}, {24.2, -32}, {-6, -32}, {-6, -10.5}, {11.8, -10.5}}, color = {0, 0, 127}));
  connect(pss_off.y, avr.vs) annotation(
    Line(points = {{-59, 10}, {-44.3333, 10}}, color = {0, 0, 127}));
  connect(machine.vf0, avr.vf0) annotation(
    Line(points = {{24.2, 39.1}, {24.2, 60}, {-26, 60}, {-26, 38.3333}}, color = {0, 0, 127}));
end GeneratorAVR;
