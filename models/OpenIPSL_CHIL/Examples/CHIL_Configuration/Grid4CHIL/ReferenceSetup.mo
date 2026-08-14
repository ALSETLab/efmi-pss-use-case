within OpenIPSL_CHIL.Examples.CHIL_Configuration.Grid4CHIL;
model ReferenceSetup
  "Model demonstrating how the controller is to be interfaced with the plant sub-system. Uses the models from where the eFMUs are generated."
  extends Modelica.Icons.Example;
  RTS.CHIL.Grid4CHIL G4CHIL(G1(avr(K0=30)))
    annotation (Placement(transformation(extent={{94,-20},{134,20}})));
  Components.Auxiliary.FaultTimerLogic faultTimerLogic(ton=1.5, toff=1.55)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={114,-70})));
  Components.PSS.PSSTypeIISimpleHPF
                                pss
                annotation (Placement(transformation(                 extent={{-100,
            -10},{-80,10}})));
equation
  connect(faultTimerLogic.y, G4CHIL.fault)
    annotation (Line(points={{114,-59},{114,-24}}, color={255,0,255}));
  connect(G4CHIL.w, pss.vSI) annotation (Line(points={{136,16},{170,16},{170,40},
          {-160,40},{-160,0},{-102,0}}, color={0,0,127}));
  connect(pss.vs, G4CHIL.vf)
    annotation (Line(points={{-79,0},{90,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-200,-100},{200,100}}, grid={2,
            2}), graphics={
        Rectangle(extent={{-170,56},{-20,-46}}, lineColor={0,140,72}),
        Text(
          extent={{-172,76},{-20,56}},
          textColor={0,140,72},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="Controller"),
        Rectangle(extent={{44,56},{184,-46}}, lineColor={28,108,200}),
        Text(
          extent={{56,56},{176,38}},
          textColor={28,108,200},
          fontName="Geist",
          textString="ECS+Synchronous Generator+ Power Grid",
          fontSize=12),
        Text(
          extent={{44,76},{184,56}},
          textColor={28,108,200},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="Plant"),
        Text(
          extent={{-156,56},{-36,38}},
          textColor={0,140,72},
          fontName="Geist",
          textString="Power System Stabilizer",
          fontSize=12)}),
    experiment(
      StopTime=15,
      Interval=0.0002));
end ReferenceSetup;
