within PSSDesign.Examples;
model Example_2_EM
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus B1 annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B2 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B3 annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Generator.GeneratorEM G1(P_0 = 1997999999.99364, Q_0 = 967924969.9065781, angle_0 = 0.4946771769891539) annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-30, -10}, {30, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
    Placement(visible = true, transformation(origin = {12, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.5*100/2220) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, 10}, {40, 30}}, rotation = 0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.93*100/2220) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -30}, {40, -10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(P_0 = -1998000000, Q_0 = 87066000, angle_0 = 0, v_0 = 0.90081) annotation(
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  OpenIPSL.Electrical.Events.PwFault pwFault(R = 0, X = 0.01*100/2220, t1 = 0.5, t2 = 0.57) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -60}, {40, -40}}, rotation = 0)));
equation
  connect(G1.pwPin, B1.p) annotation(
    Line(points = {{-69, 0}, {-60, 0}}, color = {0, 0, 255}));
  connect(B1.p, transformer.p) annotation(
    Line(points = {{-60, 0}, {-39, 0}}, color = {0, 0, 255}));
  connect(transformer.n, B2.p) annotation(
    Line(points = {{-17, 0}, {0, 0}}, color = {0, 0, 255}));
  connect(B2.p, pwLine1.p) annotation(
    Line(points = {{0, 0}, {10, 0}, {10, 20}, {21, 20}}, color = {0, 0, 255}));
  connect(pwLine2.p, B2.p) annotation(
    Line(points = {{21, -20}, {10, -20}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
  connect(pwFault.p, B2.p) annotation(
    Line(points = {{18.3333, -50}, {10, -50}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
  connect(B3.p, pwLine1.n) annotation(
    Line(points = {{60, 0}, {50, 0}, {50, 20}, {39, 20}}, color = {0, 0, 255}));
  connect(pwLine2.n, B3.p) annotation(
    Line(points = {{39, -20}, {50, -20}, {50, 0}, {60, 0}}, color = {0, 0, 255}));
  connect(infiniteBus.p, B3.p) annotation(
    Line(points = {{70, 0}, {60, 0}}, color = {0, 0, 255}));
  annotation(
    experiment(StopTime = 10, Interval = 0.0001, Tolerance = 1e-06, StartTime = 0));
end Example_2_EM;
