within OpenIPSL_CHIL.RTS.Tests.CHIL;
model Grid4CHIL_IOplus "Tests the model for CHIL testing"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Step stepVavr(
    height=0.2,
    offset=0,
    startTime=25) "Introduce a step at the AVR input"
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  OpenIPSL_CHIL.RTS.CHIL.Grid4CHIL_IOplus G4CHIL(G1(avr(K0=30)))
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Components.Auxiliary.FaultTimerLogic faultTimerLogic(ton=1.5, toff=1.55)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,-50})));
  Modelica.Blocks.Interfaces.RealOutput w "Speed [pu]"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput v "Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput Pgen "Active power [pu]"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput Qgen "Reactive power [pu]"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
  Modelica.Blocks.Sources.Step stepPload(
    height=20.5,
    offset=0,
    startTime=20) "Introduce a step at the load input"
    annotation (Placement(transformation(extent={{-100,-30},{-80,-10}})));
  Components.Auxiliary.FaultTimerLogic faultL1(ton=10.5, toff=10.525)
    annotation (Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=270,
        origin={0,-44})));
  Components.Auxiliary.FaultTimerLogic faultL2(ton=15.5, toff=15.55)
    annotation (Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=270,
        origin={12,-44})));
equation
  connect(faultTimerLogic.y, G4CHIL.fault)
    annotation (Line(points={{-39,-50},{-12,-50},{-12,-24}},
                                                         color={255,0,255}));
  connect(G4CHIL.w, w)
    annotation (Line(points={{22,16},{22,60},{110,60}}, color={0,0,127}));
  connect(G4CHIL.v, v) annotation (Line(points={{22,12},{96,12},{96,40},{110,40}},
        color={0,0,127}));
  connect(G4CHIL.Pgen, Pgen)
    annotation (Line(points={{22,8},{94,8},{94,0},{110,0}}, color={0,0,127}));
  connect(G4CHIL.Qgen, Qgen) annotation (Line(points={{22,4},{90,4},{90,-40},{
          110,-40}}, color={0,0,127}));
  connect(stepVavr.y, G4CHIL.vf) annotation (Line(points={{-79,30},{-34,30},{
          -34,12},{-24,12}}, color={0,0,127}));
  connect(stepPload.y, G4CHIL.uPLoad) annotation (Line(points={{-79,-20},{-60,
          -20},{-60,-12},{-24,-12}}, color={0,0,127}));
  connect(faultL1.y, G4CHIL.faultL1)
    annotation (Line(points={{0,-39.6},{0,-24}}, color={255,0,255}));
  connect(faultL2.y, G4CHIL.faultL2)
    annotation (Line(points={{12,-39.6},{12,-24}}, color={255,0,255}));
  annotation (experiment(
      StopTime=30,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end Grid4CHIL_IOplus;
