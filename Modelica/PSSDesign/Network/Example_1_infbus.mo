within PSSDesign.Network;
model Example_1_infbus
  OpenIPSL.Electrical.Buses.Bus B1 annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B2 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B3 annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PSSDesign.Generator.Generator G1 annotation (Placement(visible=true,
        transformation(
        origin={-80,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-30, -10}, {30, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
    Placement(visible = true, transformation(origin = {12, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.5*100/2220) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, 10}, {40, 30}}, rotation = 0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.93*100/2220) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -30}, {40, -10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(angle_0 = 0, v_0 = 0.90081, P_0 = -1998.0e6, Q_0 = 87.066e6) annotation(
    Placement(transformation(origin = {91, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
end Example_1_infbus;
