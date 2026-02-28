within PSSDesign.VerificationTests.G4HILFaultTrigger;
model FaultFMUContainerOfeFMU
  "Model to replicate fault triggering test with binary stub"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Step step(
    height=0.0,
    offset=0,
    startTime=10)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Hb0cb05f437863e9fece1a90bb931dbfeb4ac00f3
                                G4HIL
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Components.FaultTimerLogic faultTimerLogic(ton=10.0, toff=10.05)
                                             annotation (Placement(
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
  connect(faultTimerLogic.y, G4HIL.fault)
    annotation (Line(points={{-79,-70},{-58,-70},{-58,16},{-20.8,16},{-20.8,6.8}},
                                                         color={255,0,255}));
  connect(G4HIL.w, w)
    annotation (Line(points={{22,-16},{22,60},{110,60}},color={0,0,127}));
  connect(G4HIL.v, v) annotation (Line(points={{22,-8},{96,-8},{96,40},{110,40}},
        color={0,0,127}));
  connect(G4HIL.Pgen, Pgen)
    annotation (Line(points={{22,0},{94,0},{94,0},{110,0}}, color={0,0,127}));
  connect(G4HIL.Qgen, Qgen) annotation (Line(points={{22,-4},{90,-4},{90,-40},{
          110,-40}}, color={0,0,127}));
  connect(step.y, G4HIL.vf)
    annotation (Line(points={{-79,0},{-50,0},{-50,-6.6},{-20.8,-6.6}},
                                               color={0,0,127}));
  annotation (experiment(
      StopTime=20));
end FaultFMUContainerOfeFMU;
