within PSSDesign.VerificationTests.FaultTrigger;
model FaultClocked
  "Model to replicate fault triggering test with clocked partitions"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Step step(
    height=0.00,
    offset=0,
    startTime=5)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  eFMUs4RTHIL.GridForHILTesting G4HIL
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Components.FaultTimerLogic faultTimerLogic(ton=10, toff=10.05)
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
  Modelica.Clocked.RealSignals.Sampler.SampleClocked sampler
    annotation (Placement(transformation(extent={{-58,-6},{-46,6}})));
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock(
    period(displayUnit="ms") = 0.001,
    useSolver=true,
    solverMethod="ExplicitEuler") annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-52,-34})));
equation
  connect(faultTimerLogic.y, G4HIL.fault)
    annotation (Line(points={{-79,-70},{0,-70},{0,-24}}, color={255,0,255}));
  connect(G4HIL.w, w)
    annotation (Line(points={{22,16},{22,60},{110,60}}, color={0,0,127}));
  connect(G4HIL.v, v) annotation (Line(points={{22,12},{96,12},{96,40},{110,40}},
        color={0,0,127}));
  connect(G4HIL.Pgen, Pgen)
    annotation (Line(points={{22,8},{94,8},{94,0},{110,0}}, color={0,0,127}));
  connect(G4HIL.Qgen, Qgen) annotation (Line(points={{22,4},{90,4},{90,-40},{
          110,-40}}, color={0,0,127}));
  connect(step.y, sampler.u)
    annotation (Line(points={{-79,0},{-59.2,0}}, color={0,0,127}));
  connect(sampler.y, G4HIL.vf)
    annotation (Line(points={{-45.4,0},{-24,0}}, color={0,0,127}));
  connect(sampler.clock, periodicClock.y) annotation (Line(
      points={{-52,-7.2},{-52,-27.4}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  annotation (experiment(
      StopTime=60,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Euler"), __Dymola_experimentFlags(Advanced(
        InlineMethod=1,
        InlineOrder=2,
        InlineFixedStep=0.001)));
end FaultClocked;
