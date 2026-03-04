within OpenIPSL_CHIL.Network.Tests;
model RTNetwork
  "Tests the partial network model using components with modifications for eFMU export, with additional I/O for RT simulation on an embedded board."
  extends OpenIPSL_CHIL.Network.RTNetwork(L2(opening=1));
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Sine sine(
    amplitude=5,
    f=0.78,
    phase=0,
    continuous=false,
    offset=0,
    startTime=25) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,90})));
  Components.Auxiliary.FaultTimerLogic faultTimerLogic(ton=0.5, toff=0.57)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,-70})));
  Generator.Design.GenPSSDesign G1
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={57,75})));
  Modelica.Blocks.Sources.Step step(height=5, startTime=20)
    annotation (Placement(transformation(extent={{20,80},{40,100}})));
  Components.Auxiliary.FaultTimerLogic faultL1(ton=10.5, toff=10.525)
    annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=0,
        origin={39,5})));
  Components.Auxiliary.FaultTimerLogic faultL2(ton=15.5, toff=15.525)
    annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=0,
        origin={41,-35})));
equation
  connect(faultTimerLogic.y, pwFault4efmi.trip)
    annotation (Line(points={{59,-70},{43.3333,-70}}, color={255,0,255}));
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-69,0},{-60,0}}, color={0,0,255}));
  connect(add.u1, sine.y)
    annotation (Line(points={{60,81},{60,90},{79,90}}, color={0,0,127}));
  connect(step.y, add.u2)
    annotation (Line(points={{41,90},{54,90},{54,81}},color={0,0,127}));
  connect(faultL1.y, L1.trip)
    annotation (Line(points={{33.5,5},{30,5},{30,14}}, color={255,0,255}));
  connect(faultL2.y, L2.trip) annotation (Line(points={{35.5,-35},{30,-35},{
          30,-26}}, color={255,0,255}));
  connect(add.y, iSrcLoad.iMag)
    annotation (Line(points={{57,69.5},{57,60},{42,60}}, color={0,0,127}));
  annotation (
    experiment(
      StopTime=35,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(grid={2,2})),
    Icon(coordinateSystem(grid={2,2})));
end RTNetwork;
