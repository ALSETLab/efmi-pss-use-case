within OpenIPSL_CHIL.Generator.PSSTypeIIHPFilterSimple;
model GenPSSTypeIISimpleHPF_Clocked
  "Similar to GenPSSTypeIISimpleHPF, but includes a clocked partition."
  extends OpenIPSL_CHIL.Generator.PSSTypeIIHPFilterSimple.GenPSSTypeIISimpleHPF(break
      connect(wscale.u, genAVRIOReDesign.w), break connect(pss.vs,
      genAVRIOReDesign.u));
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock(
    period(displayUnit="ms") = 0.001,
    useSolver=true,
    solverMethod="ExplicitEuler") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-30})));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked sampler
    annotation (Placement(transformation(extent={{-76,-6},{-64,6}})));
  Modelica.Clocked.RealSignals.Sampler.Hold hold(y_start=pss.vSI_start)
    annotation (Placement(transformation(extent={{16,-6},{28,6}})));
equation
  connect(sampler.clock, periodicClock.y) annotation (Line(
      points={{-70,-7.2},{-70,-19}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(pss.vs, hold.u)
    annotation (Line(points={{11,0},{14.8,0}}, color={0,0,127}));
  connect(genAVRIOReDesign.u, hold.y)
    annotation (Line(points={{36,0},{28.6,0}}, color={0,0,127}));
  connect(wscale.y, pss.vSI)
    annotation (Line(points={{-19,0},{-12,0}}, color={0,0,127}));
  connect(sampler.y, wscale.u)
    annotation (Line(points={{-63.4,0},{-42,0}}, color={0,0,127}));
  connect(sampler.u, genAVRIOReDesign.w) annotation (Line(points={{-77.2,0},{-90,
          0},{-90,40},{92,40},{92,18},{82,18}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(                                grid={2,2})),
                  Icon(coordinateSystem(grid={2,2}), graphics={
        Ellipse(extent={{-18,-96},{22,-56}},
          lineThickness=1,
          fillColor={213,255,170},
          fillPattern=FillPattern.Solid),
        Line(points={{2,-56},{2,-62}},
          pattern=LinePattern.Dash,
          thickness=0.5),
        Line(points={{22,-76},{16,-76}},
          pattern=LinePattern.Dash,
          thickness=0.5),
        Line(points={{2,-76},{8,-68}},     thickness=1),
        Line(points={{2,-76},{16,-82}},    thickness=1),
        Line(points={{2,-90},{2,-96}},
          pattern=LinePattern.Dash,
          thickness=0.5),
        Line(points={{-12,-76},{-18,-76}},
          pattern=LinePattern.Dash,
          thickness=0.5)}));
end GenPSSTypeIISimpleHPF_Clocked;
