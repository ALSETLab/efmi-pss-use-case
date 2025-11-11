within PSSDesign.eFMU4CHIL;
model TestGridForCHIL "Tests the model for CHIL testing"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Step step(
    height=0.05,
    offset=0,
    startTime=5)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Grid4CHILTesting G4CHIL(G1(avr(K0=30)))
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Components.FaultTimerLogic faultTimerLogic annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,-70})));
  Modelica.Blocks.Interfaces.RealOutput w "Speed [pu]"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput v "Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput Pgen "Active power [pu]"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput Qgen "Reactive power [pu]"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
equation
  connect(faultTimerLogic.y, G4CHIL.fault)
    annotation (Line(points={{-79,-70},{0,-70},{0,-24}}, color={255,0,255}));
  connect(G4CHIL.w, w)
    annotation (Line(points={{22,16},{22,60},{110,60}}, color={0,0,127}));
  connect(G4CHIL.v, v) annotation (Line(points={{22,12},{96,12},{96,40},{110,40}},
        color={0,0,127}));
  connect(G4CHIL.Pgen, Pgen)
    annotation (Line(points={{22,8},{94,8},{94,0},{110,0}}, color={0,0,127}));
  connect(G4CHIL.Qgen, Qgen) annotation (Line(points={{22,4},{90,4},{90,-40},{
          110,-40}}, color={0,0,127}));
  connect(step.y, G4CHIL.vf)
    annotation (Line(points={{-79,0},{-24,0}}, color={0,0,127}));
  annotation (experiment(StopTime=60, __Dymola_Algorithm="Dassl"));
end TestGridForCHIL;
