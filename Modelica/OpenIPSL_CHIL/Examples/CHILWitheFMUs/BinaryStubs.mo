within OpenIPSL_CHIL.Examples.CHILWitheFMUs;
model BinaryStubs
  "Model demonstrating how the PSS is to be interfaced to the plant using the eFMUs generated."
  extends Modelica.Icons.Example;
  'Grid4CHIL_IOplus.eFMU_SiL_Support'.BinaryStub G4CHIL_IOplus(__embedd_clock=
        false, wscale=10.00)
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock_G4CHIL(
    period(displayUnit="ms") = 0.0002,
    useSolver=true,
    solverMethod="ExplicitEuler") annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={44,0})));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked samplerVavr
    annotation (Placement(transformation(extent={{62,6},{74,18}})));
  Modelica.Blocks.Sources.Step stepPload(
    height=20.5,
    offset=0,
    startTime=20) "Introduce a step at the load input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={30,-90})));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked samplerPload
    annotation (Placement(transformation(extent={{62,-14},{74,-26}})));
  Components.Auxiliary.FaultTimerLogic faultTimerLogic(ton=1.5, toff=1.55)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,-90})));
  Components.Auxiliary.FaultTimerLogic faultL1(ton=10.5, toff=10.525)
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={120,-90})));
  Components.Auxiliary.FaultTimerLogic faultL2(ton=15.5, toff=15.55)
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={150,-90})));
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock_pss(
    period(displayUnit="ms") = 0.0002,
    useSolver=true,
    solverMethod="ExplicitEuler") annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-120,-30})));
  'PSSTypeIISimpleHPF.eFMU_SiL_Support'.BinaryStub
                                pss(
    __embedd_clock=false, wscale=10.00)
                annotation (Placement(transformation(                 extent={{-100,
            -17},{-66,17}})));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked sampler
    annotation (Placement(transformation(extent={{-126,-6},{-114,6}})));
  Modelica.Clocked.RealSignals.Sampler.Hold holdPSSout(y_start=pss.vSI_start)
    annotation (Placement(transformation(extent={{-52,-6},{-40,6}})));
  Modelica.Clocked.RealSignals.Sampler.Hold hold_wscaled(y_start=G4CHIL_IOplus.woffset)
    annotation (Placement(transformation(extent={{150,10},{162,22}})));
equation
  connect(periodicClock_G4CHIL.y, samplerVavr.clock) annotation (Line(
      points={{50.6,0},{68,0},{68,4.8}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(samplerVavr.y, G4CHIL_IOplus.vf)
    annotation (Line(points={{74.6,12},{92,12}}, color={0,0,127}));
  connect(samplerPload.clock, periodicClock_G4CHIL.y) annotation (Line(
      points={{68,-12.8},{68,0},{50.6,0}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(samplerPload.y, G4CHIL_IOplus.uPLoad) annotation (Line(points={{74.6,
          -20},{80,-20},{80,-12},{92,-12}}, color={0,0,127}));
  connect(stepPload.y,samplerPload. u) annotation (Line(points={{30,-79},{30,-20},
          {60.8,-20}},                     color={0,0,127}));
  connect(faultTimerLogic.y, G4CHIL_IOplus.fault) annotation (Line(points={{90,
          -79},{90,-34},{108,-34},{108,-24}}, color={255,0,255}));
  connect(faultL1.y, G4CHIL_IOplus.faultL1)
    annotation (Line(points={{120,-79},{120,-24}}, color={255,0,255}));
  connect(faultL2.y, G4CHIL_IOplus.faultL2) annotation (Line(points={{150,-79},
          {150,-34},{132,-34},{132,-24}}, color={255,0,255}));
  connect(sampler.clock, periodicClock_pss.y) annotation (Line(
      points={{-120,-7.2},{-120,-23.4}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(pss.vs, holdPSSout.u)
    annotation (Line(points={{-64.3,0},{-53.2,0}}, color={0,0,127}));
  connect(holdPSSout.y, samplerVavr.u) annotation (Line(points={{-39.4,0},{30,0},
          {30,12},{60.8,12}}, color={0,0,127}));
  connect(sampler.y, pss.vSI)
    annotation (Line(points={{-113.4,0},{-103.4,0}}, color={0,0,127}));
  connect(G4CHIL_IOplus.w, hold_wscaled.u)
    annotation (Line(points={{142,16},{148.8,16}}, color={0,0,127}));
  connect(hold_wscaled.y, sampler.u) annotation (Line(points={{162.6,16},{170,
          16},{170,40},{-140,40},{-140,0},{-127.2,0}},
                                                   color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-200,-100},{200,100}}, grid={2,2}),
        graphics={
        Text(
          extent={{-180,100},{-20,80}},
          textColor={0,140,72},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="Controller"),
        Rectangle(extent={{-180,80},{-20,-60}}, lineColor={0,140,72}),
        Text(
          extent={{40,78},{160,60}},
          textColor={28,108,200},
          fontName="Geist",
          textString="AVR+Synchronous Generator+ Power Grid"),
        Rectangle(extent={{20,80},{180,-60}}, lineColor={28,108,200}),
        Text(
          extent={{20,100},{180,80}},
          textColor={28,108,200},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="Plant")}),
experiment(
      StopTime=30,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end BinaryStubs;
