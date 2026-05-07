within OpenIPSL_CHIL.Examples.CHIL_Configuration.Grid4CHIL;
model ReferenceClockedPSSContdPlantExplicitEuler
  "Clocked version of GenPSSReDesign with default PSS parameters, clocked PSS and continious-time plant."
  extends ReferenceClockedPSSContdPlant;
  annotation (experiment(
      StopTime=15,
      Interval=0.0002,
      __Dymola_fixedstepsize=0.0002,
      __Dymola_Algorithm="Euler"), __Dymola_experimentFlags(Advanced(
          Translation(InlineMethod=1, InlineOrder=2), Simulation(
            InlineFixedStep=0.0002))));
end ReferenceClockedPSSContdPlantExplicitEuler;
