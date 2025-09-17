within PSSDesign.FMUs4RTHIL;
model GenIO4HILinNetwork "Model with generator inside of pwoer network"

  OpenIPSL.Electrical.Buses.Bus B1 annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B2 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B3 annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Generator.GeneratorIO        G1(
    P_0=1997999999.9936,
    Q_0=967924969.90658,
    angle_0=0.49467717698916)                                                                                    annotation(
    Placement(visible = true, transformation(origin={-86,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  OpenIPSL.Electrical.Events.PwFault pwFault(R = 0, X = 0.01*100/2220,
    t1=30.5,
    t2=30.57)                                                                               annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -60}, {40, -40}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vf "Field voltage"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput vf0OUT "Initial field voltage [pu]"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,110})));
  Modelica.Blocks.Interfaces.RealOutput w "Speed [pu]"
    annotation (Placement(transformation(extent={{100,70},{120,90}})));
  Modelica.Blocks.Interfaces.RealOutput Pgen "Active power [pu]"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
  Modelica.Blocks.Interfaces.RealOutput Qgen "Reactive power [pu]"
    annotation (Placement(transformation(extent={{100,-90},{120,-70}})));
  Modelica.Blocks.Interfaces.RealOutput v "Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(G1.pwPin, B1.p) annotation(
    Line(points={{-75,0},{-60,0}},      color = {0, 0, 255}));
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
  connect(G1.u, vf)
    annotation (Line(points={{-98,0},{-120,0}}, color={0,0,127}));
  connect(G1.vf0OUT, vf0OUT) annotation (Line(points={{-86,11},{-86,60},{-80,60},
          {-80,110}}, color={0,0,127}));
  connect(G1.w, w) annotation (Line(points={{-75,6},{-74,6},{-74,80},{110,80}},
        color={0,0,127}));
  connect(G1.Pgen, Pgen) annotation (Line(points={{-75,-4},{-64,-4},{-64,-64},{
          96,-64},{96,-40},{110,-40}},
                color={0,0,127}));
  connect(G1.Qgen, Qgen) annotation (Line(points={{-75,-8},{-75,-80},{110,-80}},
                color={0,0,127}));
  connect(G1.v, v) annotation (Line(points={{-75,4},{-66,4},{-66,40},{96,40},{
          96,0},{110,0}}, color={0,0,127}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.0001), Icon(
        graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,
              200}), Text(
          extent={{-80,40},{80,-40}},
          textColor={28,108,200},
          textString="%name")}));
end GenIO4HILinNetwork;
