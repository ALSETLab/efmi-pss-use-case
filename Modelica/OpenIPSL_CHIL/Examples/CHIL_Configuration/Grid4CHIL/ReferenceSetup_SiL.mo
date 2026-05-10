within OpenIPSL_CHIL.Examples.CHIL_Configuration.Grid4CHIL;
model ReferenceSetup_SiL
  "Model demonstrating how the PSS is to be interfaced to the plant using the eFMUs generated."
  extends Grid4CHIL.ReferenceSetup(break pss, break G4CHIL);
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
    annotation (Placement(transformation(extent={{-136,-6},{-124,6}})));
  Modelica.Clocked.RealSignals.Sampler.Hold holdPSSout(y_start=pss.vSI_start)
    annotation (Placement(transformation(extent={{-56,-6},{-44,6}})));
  Modelica.Clocked.RealSignals.Sampler.Hold hold_wscaled(y_start=G4CHIL.woffset)
    annotation (Placement(transformation(extent={{152,10},{164,22}})));
  'PSSTypeIISimpleHPF.eFMU_SiL_Support'.BinaryStub pss
    annotation (Placement(transformation(extent={{-110,-22},{-66,22}})));
  'Grid4HIL.eFMU_SiL_Support'.BinaryStub G4CHIL
    annotation (Placement(transformation(extent={{92,-22},{136,22}})));
equation
  connect(periodicClock_G4CHIL.y, samplerVf.clock) annotation (Line(
      points={{60,-21},{60,-12}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(sampler.clock, periodicClock_pss.y) annotation (Line(
      points={{-130,-7.2},{-130,-21}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(holdPSSout.y, samplerVf.u)
    annotation (Line(points={{-43.4,0},{48,0}}, color={0,0,127}));
  connect(hold_wscaled.y, sampler.u) annotation (Line(points={{164.6,16},{176,16},
          {176,40},{-160,40},{-160,0},{-137.2,0}}, color={0,0,127}));
  connect(holdPSSout.u, pss.vs)
    annotation (Line(points={{-57.2,0},{-63.8,0}}, color={0,0,127}));
  connect(pss.vSI, sampler.y)
    annotation (Line(points={{-114.4,0},{-123.4,0}}, color={0,0,127}));
  connect(G4CHIL.vf, samplerVf.y)
    annotation (Line(points={{87.6,0},{71,0}}, color={0,0,127}));
  connect(G4CHIL.w, hold_wscaled.u) annotation (Line(points={{138.2,17.6},{144,17.6},
          {144,16},{150.8,16}}, color={0,0,127}));
  connect(faultTimerLogic.y, G4CHIL.fault) annotation (Line(points={{114,-59},{
          114,-48},{114,-48},{114,-26.4}},
                                       color={255,0,255}));
end ReferenceSetup_SiL;
