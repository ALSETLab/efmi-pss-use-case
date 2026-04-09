within OpenIPSL_CHIL.Examples.eFMIIntegration;
model CHILExperimentUsingFMU
  "Model demonstrating how the PSS is to be interfaced to the plant using source code FMUs exported from eFMU production code."
  extends Modelica.Icons.Example;
  H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c G4CHIL(                     wscale=
        10.00)
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));
  Modelica.Blocks.Sources.Step stepPload(
    height=20.5,
    offset=0,
    startTime=20) "Introduce a step at the load input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={30,-90})));
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
  H225c1baf6cf5a31bc9b0c38998c32298f6f0531c_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c pss(                     wscale=10.00)
                annotation (Placement(transformation(                 extent={{-100,
            -17},{-66,17}})));
equation
  connect(faultTimerLogic.y,G4CHIL. fault) annotation (Line(points={{90,-79},{90,
          -34},{99.2,-34},{99.2,13.4}},
                                color={255,0,255}));
  connect(faultL1.y,G4CHIL. faultL1)
    annotation (Line(points={{120,-79},{120,-36},{120,6.8},{99.2,6.8}},
                                                 color={255,0,255}));
  connect(faultL2.y,G4CHIL. faultL2)
    annotation (Line(points={{150,-79},{150,-34},{99.2,-34},{99.2,0}},
                                                   color={255,0,255}));
  connect(G4CHIL.w, pss.vSI) annotation (Line(points={{140,-13.2},{170,-13.2},{170,
          40},{-140,40},{-140,0},{-103.4,0}},
                                          color={0,0,127}));
  connect(pss.vs, G4CHIL.vf) annotation (Line(points={{-64.3,0},{30,0},{30,-13.2},
          {99.2,-13.2}},
                    color={0,0,127}));
  connect(G4CHIL.uPLoad, stepPload.y)
    annotation (Line(points={{99.2,-6.6},{80,-6.6},{80,-20},{30,-20},{30,-79}},
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
end CHILExperimentUsingFMU;
