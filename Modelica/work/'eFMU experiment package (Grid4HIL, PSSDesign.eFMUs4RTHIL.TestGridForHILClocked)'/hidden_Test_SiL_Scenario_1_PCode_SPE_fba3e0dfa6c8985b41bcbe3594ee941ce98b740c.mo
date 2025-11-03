within 'eFMU experiment package (Grid4HIL, PSSDesign.eFMUs4RTHIL.TestGridForHILClocked)';
model
  hidden_Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c
  "SiL test Production Code container [PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c] in the scenario defined by component [G4HIL]."

  extends hidden_Test_SiL_Scenario_1(eBlock(
      final __defining_code='Grid4HIL.eFMU_SiL_Support'.ProductionCodes.PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c,
      final __active_codes={'Grid4HIL.eFMU_SiL_Support'.ProductionCodes.PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c},
      final __enable_tuning=false,
      final __enable_reinitialization=false,
      final __tuning_configuration));

  annotation (
    Protection(hideFromBrowser=true),
    preferredView="diagram",
    experiment(
      StartTime=0.0,
      StopTime=60,
      __Dymola_Algorithm="DASSL"),
    __Dymola_experimentSetupOutput(doublePrecision=true),
    Documentation(info="
          <html>
          <p>
          Software-in-the-loop (SiL) test Software Production Engineering
          generated poduction codes of the backing eFMU in the test scenario
          defined by component
          <code>experiment.G4HIL</code>
          of the reference experiment
          <code>Test_ReferenceExperiment</code>.
          </p>
          </html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-100,-150},{100,100}})));
end
  hidden_Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c;
