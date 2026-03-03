within OpenIPSL_CHIL.eFMU4CHIL.TestG4CHILTestMoreIO;
model TestG4CHILwBinStub "Tests the model for CHIL testing with Binary Stub"
  extends Modelica.Icons.Example;
  'Grid4CHILTesting.eFMU_SiL_Support'.BinaryStub
                   G4CHIL
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealOutput w "Speed [pu]"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput v "Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput Pgen "Active power [pu]"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput Qgen "Reactive power [pu]"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock(
    period(displayUnit="s") = 0.0002,
    useSolver=true,
    solverMethod="ExplicitEuler") annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-94,0})));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked samplerVavr
    annotation (Placement(transformation(extent={{-58,6},{-46,18}})));
  Modelica.Blocks.Sources.Step stepPload(
    height=20.5,
    offset=0,
    startTime=20) "Introduce a step at the load input"
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Modelica.Blocks.Sources.Step stepVavr(
    height=0.2,
    offset=0,
    startTime=25) "Introduce a step at the AVR input"
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked samplerPload
    annotation (Placement(transformation(extent={{-58,-14},{-46,-26}})));
  Components.Auxiliary.FaultTimerLogic faultTimerLogic(ton=1.5, toff=1.55)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,-50})));
  Components.Auxiliary.FaultTimerLogic faultL1(ton=10.5, toff=10.525)
    annotation (Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=270,
        origin={0,-44})));
  Components.Auxiliary.FaultTimerLogic faultL2(ton=15.5, toff=15.55)
    annotation (Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=270,
        origin={12,-44})));
equation
  connect(G4CHIL.w, w)
    annotation (Line(points={{22,16},{22,60},{110,60}}, color={0,0,127}));
  connect(G4CHIL.v, v) annotation (Line(points={{22,12},{96,12},{96,40},{110,40}},
        color={0,0,127}));
  connect(G4CHIL.Pgen, Pgen)
    annotation (Line(points={{22,8},{94,8},{94,0},{110,0}}, color={0,0,127}));
  connect(G4CHIL.Qgen, Qgen) annotation (Line(points={{22,4},{90,4},{90,-40},{
          110,-40}}, color={0,0,127}));
  connect(periodicClock.y, samplerVavr.clock) annotation (Line(
      points={{-87.4,0},{-52,0},{-52,4.8}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(samplerVavr.y, G4CHIL.vf) annotation (Line(points={{-45.4,12},{-34,
          12},{-34,0},{-24,0}}, color={0,0,127}));
  connect(stepVavr.y, samplerVavr.u) annotation (Line(points={{-79,30},{-66,
          30},{-66,12},{-59.2,12}}, color={0,0,127}));
  connect(samplerPload.clock, periodicClock.y) annotation (Line(
      points={{-52,-12.8},{-52,0},{-87.4,0}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(stepPload.y, samplerPload.u) annotation (Line(points={{-79,-30},{
          -66,-30},{-66,-20},{-59.2,-20}}, color={0,0,127}));
  connect(faultTimerLogic.y, G4CHIL.fault)
    annotation (Line(points={{-39,-50},{0,-50},{0,-24}}, color={255,0,255}));
  annotation (experiment(
      StopTime=30,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"), Diagram(graphics={
                           Text(
          extent={{-68,84},{18,36}},
          textColor={238,46,47},
          textString="Needs to be 
replaced with 
corresponding 
binary stub!"), Rectangle(
          extent={{-20,32},{14,22}},
          lineColor={28,108,200},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid)}));
end TestG4CHILwBinStub;
