within PSSDesign.eFMUs4RTHIL.Archive_SimpleModels4TyphoonSupport;
model Example_5_TestHIL_Clocked_4OpenModelica
  "Tests model for HIL without AVR, this variant does not use the advanced Modelica language feature that applies a \"break\" to Example_4 to build the new model, as it won't work on OM..."
  extends Modelica.Icons.Example;
  eFMUs4RTHIL.Archive_SimpleModels4TyphoonSupport.GenIO4HILinNetwork genIO4HILinNetwork
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Step step(height=0.05, startTime=5)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Interfaces.RealOutput w "Speed [pu]"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput v "Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Interfaces.RealOutput Pgen "Active power [pu]"
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
  Modelica.Blocks.Interfaces.RealOutput Qgen "Reactive power [pu]"
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked sampler
    annotation (Placement(transformation(extent={{-48,-6},{-36,6}})));
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock(
    period(displayUnit="ms") = 0.001,
    useSolver=true,
    solverMethod="ExplicitEuler") annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-40,-26})));
equation
  connect(genIO4HILinNetwork.w, w) annotation (Line(points={{22,16},{40,16},{40,
          40},{110,40}}, color={0,0,127}));
  connect(genIO4HILinNetwork.v, v) annotation (Line(points={{22,0},{96,0},{96,
          20},{110,20}}, color={0,0,127}));
  connect(genIO4HILinNetwork.Pgen, Pgen) annotation (Line(points={{22,-8},{40,
          -8},{40,-20},{110,-20}}, color={0,0,127}));
  connect(genIO4HILinNetwork.Qgen, Qgen) annotation (Line(points={{22,-16},{32,
          -16},{32,-60},{110,-60}}, color={0,0,127}));
  connect(step.y, sampler.u)
    annotation (Line(points={{-59,0},{-49.2,0}}, color={0,0,127}));
  connect(sampler.y, genIO4HILinNetwork.vf)
    annotation (Line(points={{-35.4,0},{-24,0}}, color={0,0,127}));
  connect(periodicClock.y, sampler.clock) annotation (Line(
      points={{-40,-19.4},{-40,-16},{-42,-16},{-42,-7.2}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  annotation (experiment(
      StopTime=30,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end Example_5_TestHIL_Clocked_4OpenModelica;
