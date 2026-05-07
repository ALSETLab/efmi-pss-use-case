within OpenIPSL_CHIL.Examples.CHIL_Configuration.Grid4CHIL;
model ReferenceSetup_SiL_FMUs
  "Model demonstrating how the PSS is to be interfaced to the plant using source code FMUs exported from eFMU production code."
  extends Grid4CHIL.ReferenceSetup(break pss, break G4CHIL);
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock_G4CHIL(
    period(displayUnit="ms") = 0.0002,
    useSolver=true,
    solverMethod="ExplicitEuler") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-46})));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked samplerVf
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock_pss(
    period(displayUnit="ms") = 0.0002,
    useSolver=true,
    solverMethod="ExplicitEuler") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-130,-46})));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked sampler
    annotation (Placement(transformation(extent={{-136,-6},{-124,6}})));
  Modelica.Clocked.RealSignals.Sampler.Hold holdPSSout(y_start=pss.vSI_start)
    annotation (Placement(transformation(extent={{-56,-6},{-44,6}})));
  Modelica.Clocked.RealSignals.Sampler.Hold hold_wscaled(y_start=G4CHIL.woffset)
    annotation (Placement(transformation(extent={{152,10},{164,22}})));
  H225c1baf6cf5a31bc9b0c38998c32298f6f0531c_cb4a8a449b4ada864625ee5a4355578a3aaf08ed
    pss(wscale=10.00)
    annotation (Placement(transformation(extent={{-110,-17},{-76,17}})));
  Hcbd8c48e05b139646178cc6f7987b8955b6ce985_cb4a8a449b4ada864625ee5a4355578a3aaf08ed
    G4CHIL annotation (Placement(transformation(extent={{88,-14},{130,28}})));
equation
  connect(periodicClock_G4CHIL.y, samplerVf.clock) annotation (Line(
      points={{60,-35},{60,-12}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(sampler.clock, periodicClock_pss.y) annotation (Line(
      points={{-130,-7.2},{-130,-35}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(holdPSSout.y, samplerVf.u)
    annotation (Line(points={{-43.4,0},{48,0}}, color={0,0,127}));
  connect(hold_wscaled.y, sampler.u) annotation (Line(points={{164.6,16},{176,16},
          {176,40},{-160,40},{-160,0},{-137.2,0}}, color={0,0,127}));
  connect(sampler.y, pss.vSI)
    annotation (Line(points={{-123.4,0},{-110.68,0}}, color={0,0,127}));
  connect(pss.vs, holdPSSout.u)
    annotation (Line(points={{-76,0},{-57.2,0}}, color={0,0,127}));
  connect(G4CHIL.w, hold_wscaled.u) annotation (Line(points={{130,-6.86},{142,-6.86},
          {142,16},{150.8,16}}, color={0,0,127}));
  connect(samplerVf.y, G4CHIL.vf)
    annotation (Line(points={{71,0},{78,0.07},{87.16,0.07}}, color={0,0,127}));
  connect(faultTimerLogic.y, G4CHIL.fault) annotation (Line(points={{114,-71},{114,
          -26},{76,-26},{76,14.14},{87.16,14.14}}, color={255,0,255}));
end ReferenceSetup_SiL_FMUs;
