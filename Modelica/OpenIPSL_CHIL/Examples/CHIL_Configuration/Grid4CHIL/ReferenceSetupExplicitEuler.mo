within OpenIPSL_CHIL.Examples.CHIL_Configuration.Grid4CHIL;
model ReferenceSetupExplicitEuler
  "Model demonstrating how the controller is to be interfaced with the plant sub-system. Uses the models from where the eFMUs are generated."
  extends Modelica.Icons.Example;
  RTS.CHIL.Grid4CHIL G4CHIL(G1(avr(K0=30)))
    annotation (Placement(transformation(extent={{94,-20},{134,20}})));
  Components.Auxiliary.FaultTimerLogic faultTimerLogic(ton=1.5, toff=1.55)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={114,-82})));
  Components.PSS.PSSTypeIISimpleHPF
                                pss
                annotation (Placement(transformation(                 extent={{-100,
            -10},{-80,10}})));
equation
  connect(faultTimerLogic.y, G4CHIL.fault)
    annotation (Line(points={{114,-71},{114,-24}}, color={255,0,255}));
  connect(G4CHIL.w, pss.vSI) annotation (Line(points={{136,16},{170,16},{170,40},
          {-140,40},{-140,0},{-102,0}}, color={0,0,127}));
  connect(pss.vs, G4CHIL.vf)
    annotation (Line(points={{-79,0},{90,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-200,-100},{200,100}}, grid={2,
            2}), graphics={
        Rectangle(extent={{-180,80},{-20,-60}}, lineColor={0,140,72}),
        Text(
          extent={{-180,100},{-20,80}},
          textColor={0,140,72},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="Controller"),
        Rectangle(extent={{20,80},{180,-60}}, lineColor={28,108,200}),
        Text(
          extent={{40,78},{160,60}},
          textColor={28,108,200},
          fontName="Geist",
          textString="ECS+Synchronous Generator+ Power Grid"),
        Text(
          extent={{20,100},{180,80}},
          textColor={28,108,200},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="Plant")}),
experiment(
      StopTime=15,
      Interval=0.0002,
      __Dymola_fixedstepsize=0.0002,
      __Dymola_Algorithm="Dassl"), __Dymola_experimentFlags(Advanced(
          Translation(InlineMethod=1, InlineOrder=2), Simulation(
            InlineFixedStep=0.0002))));
end ReferenceSetupExplicitEuler;
