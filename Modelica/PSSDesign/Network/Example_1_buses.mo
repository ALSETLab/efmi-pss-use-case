within PSSDesign.Network;
model Example_1_buses
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
equation

end Example_1_buses;
