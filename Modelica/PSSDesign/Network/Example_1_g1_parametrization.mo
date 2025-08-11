within PSSDesign.Network;
model Example_1_g1_parametrization
  OpenIPSL.Electrical.Buses.Bus B1 annotation(
    Placement(transformation(origin = {-60, -1}, extent = {{-10, -10}, {10, 10}})));
  OpenIPSL.Electrical.Buses.Bus B2 annotation(
    Placement(transformation(origin = {0, -1}, extent = {{-10, -10}, {10, 10}})));
  OpenIPSL.Electrical.Buses.Bus B3 annotation(
    Placement(transformation(origin = {60, -1}, extent = {{-10, -10}, {10, 10}})));
  PSSDesign.Generator.Generator G1 annotation (Placement(transformation(origin=
            {-80,-1}, extent={{-10,-10},{10,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
    Placement(transformation(origin = {-70, -31}, extent = {{-30, -10}, {30, 10}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
    Placement(transformation(origin = {12, -1}, extent = {{-50, -10}, {-30, 10}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.5*100/2220) annotation(
    Placement(transformation(origin = {0, -1}, extent = {{20, 10}, {40, 30}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.93*100/2220) annotation(
    Placement(transformation(origin = {0, -1}, extent = {{20, -30}, {40, -10}})));
equation

end Example_1_g1_parametrization;
