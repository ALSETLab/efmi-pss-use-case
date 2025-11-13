within PSSDesign.eFMU4CHIL;
model TestGridForCHILwFMUofeFMU
  "Tests the model for CHIL testing with eFMU in FMU container"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Step step(
    height=0.2,
    offset=0,
    startTime=5)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  H283cd02180511b024b59731032fd3290f8675b29
                   G4CHIL
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Components.FaultTimerLogic faultTimerLogic(ton=1.5, toff=1.55)
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
  connect(faultTimerLogic.y, G4CHIL.fault)
    annotation (Line(points={{-79,-70},{-30,-70},{-30,6},{-20.8,6},{-20.8,6.8}},
                                                         color={255,0,255}));
  connect(G4CHIL.w, w)
    annotation (Line(points={{22,-16},{22,60},{110,60}},color={0,0,127}));
  connect(G4CHIL.v, v) annotation (Line(points={{22,-8},{96,-8},{96,40},{110,40}},
        color={0,0,127}));
  connect(G4CHIL.Pgen, Pgen)
    annotation (Line(points={{22,0},{94,0},{94,0},{110,0}}, color={0,0,127}));
  connect(G4CHIL.Qgen, Qgen) annotation (Line(points={{22,-4},{90,-4},{90,-40},
          {110,-40}},color={0,0,127}));
  connect(G4CHIL.vf, step.y) annotation (Line(points={{-20.8,-6.6},{-50,-6.6},{
          -50,0},{-79,0}}, color={0,0,127}));
  annotation (experiment(
      StopTime=20,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end TestGridForCHILwFMUofeFMU;
