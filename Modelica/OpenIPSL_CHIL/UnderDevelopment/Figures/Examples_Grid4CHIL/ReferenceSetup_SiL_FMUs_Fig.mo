within OpenIPSL_CHIL.UnderDevelopment.Figures.Examples_Grid4CHIL;
model ReferenceSetup_SiL_FMUs_Fig "Clocked variant of ReferenceSetup."
  extends Examples_Grid4CHIL.ReferenceSetup(break pss, break G4CHIL
                                );
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock_G4CHIL(
    period(displayUnit="ms") = 0.0002,
    useSolver=true,
    solverMethod="ExplicitEuler") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-30})));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked samplerVf
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock_pss(
    period(displayUnit="ms") = 0.0002,
    useSolver=true,
    solverMethod="ExplicitEuler") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-30})));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked sampler
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  Modelica.Clocked.RealSignals.Sampler.Hold holdPSSout(y_start=pss.vSI_start)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Clocked.RealSignals.Sampler.Hold hold_wscaled(y_start=G4CHIL.woffset)
    annotation (Placement(transformation(extent={{72,-10},{92,10}})));
  H225c1baf6cf5a31bc9b0c38998c32298f6f0531c_cb4a8a449b4ada864625ee5a4355578a3aaf08ed
    pss(wscale=10.00)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Hcbd8c48e05b139646178cc6f7987b8955b6ce985_cb4a8a449b4ada864625ee5a4355578a3aaf08ed
    G4CHIL annotation (Placement(transformation(extent={{40,10},{60,-10}})));
equation
  connect(periodicClock_G4CHIL.y, samplerVf.clock) annotation (Line(
      points={{10,-19},{10,-12}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(sampler.clock, periodicClock_pss.y) annotation (Line(
      points={{-80,-12},{-80,-19}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(holdPSSout.y, samplerVf.u)
    annotation (Line(points={{-9,0},{-2,0}},    color={0,0,127}));
  connect(hold_wscaled.y, sampler.u) annotation (Line(points={{93,0},{100,0},{
          100,20},{-100,20},{-100,0},{-92,0}},     color={0,0,127}));

  connect(pss.vs, holdPSSout.u)
    annotation (Line(points={{-40,0},{-32,0}}, color={0,0,127}));
  connect(pss.vSI, sampler.y)
    annotation (Line(points={{-60.4,0},{-69,0}}, color={0,0,127}));
  connect(G4CHIL.w, hold_wscaled.u) annotation (Line(points={{60,6.6},{64,6.6},
          {64,0},{70,0}}, color={0,0,127}));
  connect(faultTimer.y, G4CHIL.fault) annotation (Line(points={{50,-19},{50,-16},
          {34,-16},{34,-3.4},{39.6,-3.4}}, color={255,0,255}));
  connect(samplerVf.y, G4CHIL.vf) annotation (Line(points={{21,0},{32,0},{32,
          3.3},{39.6,3.3}}, color={0,0,127}));
end ReferenceSetup_SiL_FMUs_Fig;
