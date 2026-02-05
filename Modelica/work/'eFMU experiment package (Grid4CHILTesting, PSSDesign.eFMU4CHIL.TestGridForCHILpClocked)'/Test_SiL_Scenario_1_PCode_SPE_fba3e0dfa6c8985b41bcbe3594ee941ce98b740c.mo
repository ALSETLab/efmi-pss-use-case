within 'eFMU experiment package (Grid4CHILTesting, PSSDesign.eFMU4CHIL.TestGridForCHILpClocked)';
model Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c
  "SiL test Production Code container [PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c] in the scenario defined by component [G4CHIL]."

  extends
    hidden_Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c;

  annotation (
    preferredView="diagram",
    experiment(
      StartTime=0.0,
      StopTime=20,
      __Dymola_Algorithm="DASSL"),
    __Dymola_experimentSetupOutput(doublePrecision=true),
    Documentation(info="
          <html>
          <p>
          Software-in-the-loop (SiL) test Software Production Engineering
          generated poduction codes of the backing eFMU in the test scenario
          defined by component
          <code>experiment.G4CHIL</code>
          of the reference experiment
          <code>Test_ReferenceExperiment</code>.
          </p>
          </html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-100,-150},{100,100}})));
end Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c;
