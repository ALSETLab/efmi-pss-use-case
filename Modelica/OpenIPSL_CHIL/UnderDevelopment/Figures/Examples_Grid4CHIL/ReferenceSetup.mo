within OpenIPSL_CHIL.UnderDevelopment.Figures.Examples_Grid4CHIL;
model ReferenceSetup
  "Model demonstrating how the controller is to be interfaced with the plant sub-system. Uses the models from where the eFMUs are generated."
  extends Modelica.Icons.Example;
  RTS.CHIL.Grid4CHIL G4CHIL(G1(avr(K0=30)))
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Components.Auxiliary.FaultTimerLogic faultTimer(ton=1.5, toff=1.55)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-30})));
  Components.PSS.PSSTypeIISimpleHPF
                                pss
                annotation (Placement(transformation(                 extent={{-60,-10},
            {-40,10}})));
equation
  connect(faultTimer.y, G4CHIL.fault)
    annotation (Line(points={{50,-19},{50,-12}}, color={255,0,255}));
  connect(G4CHIL.w, pss.vSI) annotation (Line(points={{61,8},{80,8},{80,20},{
          -80,20},{-80,0},{-62,0}},     color={0,0,127}));
  connect(pss.vs, G4CHIL.vf)
    annotation (Line(points={{-39,0},{38,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(                                grid={2,2})),
    experiment(
      StopTime=15,
      Interval=0.0002),
    Icon(coordinateSystem(grid={2,2})));
end ReferenceSetup;
