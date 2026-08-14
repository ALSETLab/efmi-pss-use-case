within OpenIPSL_CHIL.UnderDevelopment.Figures.Examples_Grid4CHIL;
model RefSim_ClockedPSS_CT_Plant_ExpEuler
  "Clocked version of GenPSSReDesign with default PSS parameters, clocked PSS and continious-time plant."
  extends RefSim_ClockedPSS_CT_Plant;
  annotation (experiment(
      StopTime=15,
      Interval=0.0002,
      __Dymola_fixedstepsize=0.0002,
      __Dymola_Algorithm="Euler"), __Dymola_experimentFlags(Advanced(
          Translation(InlineMethod=1, InlineOrder=2), Simulation(
            InlineFixedStep=0.0002))));
end RefSim_ClockedPSS_CT_Plant_ExpEuler;
