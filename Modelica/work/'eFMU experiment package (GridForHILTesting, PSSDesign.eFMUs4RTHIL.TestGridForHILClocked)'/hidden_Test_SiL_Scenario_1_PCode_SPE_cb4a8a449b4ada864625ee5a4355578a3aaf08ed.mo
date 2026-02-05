within 'eFMU experiment package (GridForHILTesting, PSSDesign.eFMUs4RTHIL.TestGridForHILClocked)';
model
  hidden_Test_SiL_Scenario_1_PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed
  "SiL test Production Code container [PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed] in the scenario defined by component [G4HIL]."

  extends hidden_Test_SiL_Scenario_1(eBlock(
      final __defining_code='GridForHILTesting.eFMU_SiL_Support'.ProductionCodes.PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed,
      final __active_codes={'GridForHILTesting.eFMU_SiL_Support'.ProductionCodes.PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed},
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
  hidden_Test_SiL_Scenario_1_PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed;
