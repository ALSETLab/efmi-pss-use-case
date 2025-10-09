within efmiPSSusecase.Experiments.SILTests;
model
  hidden_Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c
  "SiL test Production Code container [PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c] in the scenario defined by component [G1.pss]."

  extends hidden_Test_SiL_Scenario_1(eBlock(
      final __defining_code='PSSefmu.eFMU_SiL_Support'.ProductionCodes.PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c,
      final __active_codes={'PSSefmu.eFMU_SiL_Support'.ProductionCodes.PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c},
      final __enable_tuning=false,
      final __enable_reinitialization=false,
      final __tuning_configuration));

  annotation (
    Protection(hideFromBrowser=true),
    preferredView="diagram",
    experiment(
      StartTime=0,
      StopTime=10,
      __Dymola_Algorithm="DASSL"),
    __Dymola_experimentSetupOutput(doublePrecision=true),
    Documentation(info="
          <html>
          <p>
          Software-in-the-loop (SiL) test Software Production Engineering
          generated poduction codes of the backing eFMU in the test scenario
          defined by component
          <code>experiment.G1.pss</code>
          of the reference experiment
          <code>Test_ReferenceExperiment</code>.
          </p>
          </html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-100,-20},{100,100}})));
end
  hidden_Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c;
