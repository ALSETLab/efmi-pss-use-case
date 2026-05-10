within OpenIPSL_CHIL.Examples.CHIL_Configuration.Grid4CHIL;
model ReferenceSetup_ExpEuler
  "Model demonstrating how the controller is to be interfaced with the plant sub-system. Uses the models from where the eFMUs are generated."
  extends ReferenceSetup;
  annotation (Diagram(coordinateSystem(extent={{-200,-100},{200,100}}, grid={2,
            2})),
experiment(
      StopTime=15,
      Interval=0.0002,
      __Dymola_fixedstepsize=0.0002,
      __Dymola_Algorithm="Dassl"), __Dymola_experimentFlags(Advanced(
          Translation(InlineMethod=1, InlineOrder=2), Simulation(
            InlineFixedStep=0.0002))));
end ReferenceSetup_ExpEuler;
