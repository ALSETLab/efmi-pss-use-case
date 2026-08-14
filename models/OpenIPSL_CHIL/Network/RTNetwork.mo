within OpenIPSL_CHIL.Network;
partial model RTNetwork
  "Partial network model using components with modifications for eFMU export, with additional I/O for RT simulation on an embedded board."
  OpenIPSL.Electrical.Buses.Bus B1 annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B2 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B3 annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
    Placement(visible = true, transformation(origin={-60,70},     extent={{-20,-10},
            {20,10}},                                                                              rotation = 0)));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
    Placement(visible = true, transformation(origin = {12, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
  Components.Auxiliary.PwLine4eFMI L1(
    B=0,
    G=0,
    R=0,
    S_b(displayUnit="V.A") = 100000000,
    X=0.5*100/2220) annotation (Placement(visible=true, transformation(
        origin={0,0},
        extent={{20,10},{40,30}},
        rotation=0)));
  Components.Auxiliary.PwLine4eFMI L2(
    B=0,
    G=0,
    R=0,
    S_b(displayUnit="V.A") = 100000000,
    X=0.93*100/2220) annotation (Placement(visible=true, transformation(
        origin={0,0},
        extent={{20,-30},{40,-10}},
        rotation=0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(
    P_0=-1998000000,
    Q_0=87066000,                                                                      angle_0 = 0, v_0 = 0.90081) annotation(
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Components.Auxiliary.PwFault4eFMI pwFault4efmi(R=0, X=0.01*100/2220)
    annotation (Placement(visible=true, transformation(
        origin={0,-20},
        extent={{20,-60},{40,-40}},
        rotation=0)));
  Components.Auxiliary.iSrcLoad                iSrcLoad
                      annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-8,50})));
equation
  connect(B1.p, transformer.p) annotation(
    Line(points = {{-60, 0}, {-39, 0}}, color = {0, 0, 255}));
  connect(transformer.n, B2.p) annotation(
    Line(points = {{-17, 0}, {0, 0}}, color = {0, 0, 255}));
  connect(B2.p, L1.p)
    annotation (Line(points={{0,0},{10,0},{10,20},{21,20}}, color={0,0,255}));
  connect(L2.p, B2.p) annotation (Line(points={{21,-20},{10,-20},{10,0},{0,0}},
        color={0,0,255}));
  connect(pwFault4efmi.p, B2.p)
    annotation (Line(points={{18.3333,-70},{4,-70},{4,0},{0,0}},
                                                           color={0,0,255}));
  connect(B3.p, L1.n)
    annotation (Line(points={{60,0},{50,0},{50,20},{39,20}}, color={0,0,255}));
  connect(L2.n, B3.p) annotation (Line(points={{39,-20},{50,-20},{50,0},{60,0}},
        color={0,0,255}));
  connect(infiniteBus.p, B3.p) annotation(
    Line(points = {{70, 0}, {60, 0}}, color = {0, 0, 255}));
  connect(iSrcLoad.p, B2.p)
    annotation (Line(points={{0.8,50},{4,50},{4,0},{0,0}},
                                                    color={0,0,255}));
  annotation (
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.0001),
    Diagram(coordinateSystem(grid={2,2})),
    Icon(graphics={   Ellipse(
          extent={{-60,60},{60,-60}},
          lineColor={217,67,180},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}));
end RTNetwork;
