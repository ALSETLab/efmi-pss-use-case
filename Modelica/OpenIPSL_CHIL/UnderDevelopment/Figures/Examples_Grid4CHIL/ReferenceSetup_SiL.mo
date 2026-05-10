within OpenIPSL_CHIL.UnderDevelopment.Figures.Examples_Grid4CHIL;
model ReferenceSetup_SiL
  "Model demonstrating how the PSS is to be interfaced to the plant using the eFMUs generated."
  extends Examples_Grid4CHIL.ReferenceSetup(break pss, break G4CHIL);
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
  'PSSTypeIISimpleHPF.eFMU_SiL_Support'.BinaryStub pss
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  'Grid4HIL.eFMU_SiL_Support'.BinaryStub G4CHIL
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
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
  connect(holdPSSout.u, pss.vs)
    annotation (Line(points={{-32,0},{-39,0}},     color={0,0,127}));
  connect(pss.vSI, sampler.y)
    annotation (Line(points={{-62,0},{-69,0}},       color={0,0,127}));
  connect(G4CHIL.vf, samplerVf.y)
    annotation (Line(points={{38,0},{21,0}},   color={0,0,127}));
  connect(G4CHIL.w, hold_wscaled.u) annotation (Line(points={{61,8},{70,8},{70,
          0}},                  color={0,0,127}));
  connect(faultTimer.y, G4CHIL.fault)
    annotation (Line(points={{50,-19},{50,-12}}, color={255,0,255}));
end ReferenceSetup_SiL;
