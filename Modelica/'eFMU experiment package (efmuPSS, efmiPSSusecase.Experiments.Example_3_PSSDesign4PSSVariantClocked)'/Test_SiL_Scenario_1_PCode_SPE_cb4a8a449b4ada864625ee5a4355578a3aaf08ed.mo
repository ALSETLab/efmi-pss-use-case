within 'eFMU experiment package (efmuPSS, efmiPSSusecase.Experiments.Example_3_PSSDesign4PSSVariantClocked)';
model Test_SiL_Scenario_1_PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed
  "SiL test Production Code container [PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed] in the scenario defined by component [G1.pss]."

  extends
    hidden_Test_SiL_Scenario_1_PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed;

  annotation (
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
end Test_SiL_Scenario_1_PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed;
