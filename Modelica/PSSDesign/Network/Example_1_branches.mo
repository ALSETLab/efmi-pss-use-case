within PSSDesign.Network;
model Example_1_branches
  OpenIPSL.Electrical.Buses.Bus B1 annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B2 annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B3 annotation(
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PSSDesign.Generator.Generator G1 annotation (Placement(visible=true,
        transformation(
        origin={-72,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-30, -10}, {30, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
    Placement(visible = true, transformation(origin = {32, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.5*100/2220) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{20, 10}, {40, 30}}, rotation = 0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.93*100/2220) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{20, -30}, {40, -10}}, rotation = 0)));
end Example_1_branches;
