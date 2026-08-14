within OpenIPSL_CHIL.UnderDevelopment.Figures.Examples_Grid4CHIL;
model ReferenceSetup_Clocked "Clocked variant of ReferenceSetup."
  extends Examples_Grid4CHIL.ReferenceSetup(
                                   break connect(pss.vs, G4CHIL.vf), break
      connect(G4CHIL.w, pss.vSI));
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
  connect(G4CHIL.w, hold_wscaled.u)
    annotation (Line(points={{61,8},{66,8},{66,0},{70,0}},
                                                   color={0,0,127}));
  connect(sampler.y, pss.vSI)
    annotation (Line(points={{-69,0},{-62,0}},     color={0,0,127}));
  connect(pss.vs, holdPSSout.u)
    annotation (Line(points={{-39,0},{-32,0}},   color={0,0,127}));
  connect(holdPSSout.y, samplerVf.u)
    annotation (Line(points={{-9,0},{-2,0}},    color={0,0,127}));
  connect(samplerVf.y, G4CHIL.vf)
    annotation (Line(points={{21,0},{38,0}}, color={0,0,127}));
  connect(hold_wscaled.y, sampler.u) annotation (Line(points={{93,0},{100,0},{
          100,20},{-100,20},{-100,0},{-92,0}},     color={0,0,127}));

end ReferenceSetup_Clocked;
