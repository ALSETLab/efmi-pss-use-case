within PSSDesign.Generator;
model GeneratorEMClassical
  "Generator, simplified synchronous machine (no AVR, no PSS)"
  extends PSSDesign.Generator.GeneratorTemplate;
  OpenIPSL.Electrical.Machines.PSAT.Order2 machine(D = 0, M = 7, P_0 = P_0, Q_0 = Q_0, Sn = 2220000000, V_b = V_b, Vn = 400000, angle_0 = angle_0, ra = 0, v_0 = v_0, x1d = 0.3) annotation(
    Placement(visible = true, transformation(origin = {49, 5}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
equation
  connect(machine.p, pwPin) annotation(
    Line(points = {{80, 5}, {110, 5}, {110, 0}}, color = {0, 0, 255}));
  connect(machine.pm0, machine.pm) annotation(
    Line(points = {{24.2, -29.1}, {24.2, -32}, {-6, -32}, {-6, -10.5}, {11.8, -10.5}}, color = {0, 0, 127}));
  connect(machine.vf0, machine.vf) annotation(
    Line(points = {{24, 40}, {24, 48}, {-4, 48}, {-4, 20}, {12, 20}}, color = {0, 0, 127}));
end GeneratorEMClassical;
