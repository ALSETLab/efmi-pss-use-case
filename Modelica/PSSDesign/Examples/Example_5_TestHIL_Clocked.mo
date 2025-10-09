within PSSDesign.Examples;
model Example_5_TestHIL_Clocked "Tests model for HIL without AVR"
  extends PSSDesign.Examples.Example_4_TestHILModelNoAVR(break connect(step.y,
      genIO4HILinNetwork.vf));

  Modelica.Clocked.RealSignals.Sampler.SampleClocked sampler
    annotation (Placement(transformation(extent={{-52,-6},{-40,6}})));
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock(
    period(displayUnit="ms") = 0.001,
    useSolver=true,
    solverMethod="ExplicitEuler") annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-46,-34})));
equation
  connect(step.y, sampler.u)
    annotation (Line(points={{-59,0},{-53.2,0}}, color={0,0,127}));
  connect(sampler.y, genIO4HILinNetwork.vf)
    annotation (Line(points={{-39.4,0},{-24,0}}, color={0,0,127}));
  connect(periodicClock.y, sampler.clock) annotation (Line(
      points={{-46,-27.4},{-46,-7.2}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
end Example_5_TestHIL_Clocked;
