within OpenIPSL_CHIL.Examples.CHIL_Configuration.Grid4CHIL;
model ReferenceSetup_Clocked "Clocked variant of ReferenceSetup."
  extends Grid4CHIL.ReferenceSetup(break connect(pss.vs, G4CHIL.vf), break
      connect(G4CHIL.w, pss.vSI));
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock_G4CHIL(
    period(displayUnit="ms") = 0.0002,
    useSolver=true,
    solverMethod="ExplicitEuler") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-32})));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked samplerVf
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock_pss(
    period(displayUnit="ms") = 0.0002,
    useSolver=true,
    solverMethod="ExplicitEuler") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-130,-32})));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked sampler
    annotation (Placement(transformation(extent={{-138,-8},{-122,8}})));
  Modelica.Clocked.RealSignals.Sampler.Hold holdPSSout(y_start=pss.vSI_start)
    annotation (Placement(transformation(extent={{-56,-6},{-44,6}})));
  Modelica.Clocked.RealSignals.Sampler.Hold hold_wscaled(y_start=G4CHIL.woffset)
    annotation (Placement(transformation(extent={{152,10},{164,22}})));
equation
  connect(periodicClock_G4CHIL.y, samplerVf.clock) annotation (Line(
      points={{60,-21},{60,-12}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(sampler.clock, periodicClock_pss.y) annotation (Line(
      points={{-130,-9.6},{-130,-21}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(G4CHIL.w, hold_wscaled.u)
    annotation (Line(points={{136,16},{150.8,16}}, color={0,0,127}));
  connect(sampler.y, pss.vSI)
    annotation (Line(points={{-121.2,0},{-102,0}}, color={0,0,127}));
  connect(pss.vs, holdPSSout.u)
    annotation (Line(points={{-79,0},{-57.2,0}}, color={0,0,127}));
  connect(holdPSSout.y, samplerVf.u)
    annotation (Line(points={{-43.4,0},{48,0}}, color={0,0,127}));
  connect(samplerVf.y, G4CHIL.vf)
    annotation (Line(points={{71,0},{90,0}}, color={0,0,127}));
  connect(hold_wscaled.y, sampler.u) annotation (Line(points={{164.6,16},{176,
          16},{176,40},{-160,40},{-160,0},{-139.6,0}},
                                                   color={0,0,127}));

end ReferenceSetup_Clocked;
