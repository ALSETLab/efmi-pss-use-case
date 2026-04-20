within OpenIPSL_CHIL.Examples.CHIL_Design;
model IOModelforReDesign
  "Power system with synchronous machine (Order VI) and AVR (Type II), with input/output interfaces for linear analysis and control design considering signal scaling."
  extends Modelica.Icons.Example;
  RTS.CHIL.Grid4CHIL_IOplus G4CHIL_IOplus(G1(avr(K0=30)))
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Step stepPload(
    height=20.5,
    offset=0,
    startTime=20) "Introduce a step at the load input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,-70})));
  Components.Auxiliary.FaultTimerLogic faultTimerLogic(ton=0.5, toff=0.57)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-70})));
  Components.Auxiliary.FaultTimerLogic faultL1(ton=10.5, toff=10.525)
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={20,-70})));
  Components.Auxiliary.FaultTimerLogic faultL2(ton=15.5, toff=15.55)
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={50,-70})));
  Modelica.Blocks.Interfaces.RealOutput w "Speed [pu]"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput vf "Field voltage"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
equation
  connect(stepPload.y, G4CHIL_IOplus.uPLoad)
    annotation (Line(points={{-50,-59},{-50,-12},{-28,-12}}, color={0,0,127}));
  connect(faultTimerLogic.y, G4CHIL_IOplus.fault) annotation (Line(points={{-10,
          -59},{-10,-32},{-12,-32},{-12,-24}}, color={255,0,255}));
  connect(faultL1.y, G4CHIL_IOplus.faultL1) annotation (Line(points={{20,-59},{
          20,-48},{0,-48},{0,-24}}, color={255,0,255}));
  connect(faultL2.y, G4CHIL_IOplus.faultL2) annotation (Line(points={{50,-59},{
          50,-40},{12,-40},{12,-24}}, color={255,0,255}));
  connect(G4CHIL_IOplus.w, w) annotation (Line(points={{22,16},{96,16},{96,0},{
          110,0}}, color={0,0,127}));
  connect(G4CHIL_IOplus.vf, vf) annotation (Line(points={{-28,12},{-90,12},{-90,
          0},{-120,0}}, color={0,0,127}));
  annotation (experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end IOModelforReDesign;
