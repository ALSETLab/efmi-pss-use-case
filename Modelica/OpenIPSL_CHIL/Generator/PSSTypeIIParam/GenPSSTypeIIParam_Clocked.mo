within OpenIPSL_CHIL.Generator.PSSTypeIIParam;
model GenPSSTypeIIParam_Clocked
  "Similar to GenPSSTypeIIParam, but includes a clocked partition."
  extends OpenIPSL_CHIL.Generator.PSSTypeIIParam.GenPSSTypeIIParam(break
      connect(genAVRIOReDesign.w, pss.vSI), break connect(pss.vs,
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
  Modelica.Clocked.RealSignals.Sampler.Hold hold
    annotation (Placement(transformation(extent={{-16,-6},{-4,6}})));
equation
  connect(sampler.clock, periodicClock.y) annotation (Line(
      points={{-70,-7.2},{-70,-19}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(sampler.u, genAVRIOReDesign.w) annotation (Line(points={{-77.2,0},{-90,
          0},{-90,40},{80,40},{80,18},{62,18}}, color={0,0,127}));
  connect(hold.y, genAVRIOReDesign.u)
    annotation (Line(points={{-3.4,0},{16,0}}, color={0,0,127}));
  connect(hold.u, pss.vs)
    annotation (Line(points={{-17.2,0},{-29,0}}, color={0,0,127}));
  connect(sampler.y, pss.vSI)
    annotation (Line(points={{-63.4,0},{-52,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(                                grid={2,2})),
                  Icon(coordinateSystem(grid={2,2}), graphics={
        Ellipse(extent={{-18,-96},{22,-56}},
          lineThickness=1,
          fillColor={255,255,255},
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
end GenPSSTypeIIParam_Clocked;
