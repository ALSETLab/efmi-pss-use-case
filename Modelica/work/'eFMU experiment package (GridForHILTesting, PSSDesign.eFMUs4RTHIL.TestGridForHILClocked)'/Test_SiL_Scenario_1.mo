within 'eFMU experiment package (GridForHILTesting, PSSDesign.eFMUs4RTHIL.TestGridForHILClocked)';
model Test_SiL_Scenario_1 "Test scenario defined by component [G4HIL]."

  extends hidden_Test_SiL_Scenario_1(
    'Pgen|match'(skip=.Testing.Base.Choices.Skip.True),
    'Qgen|match'(skip=.Testing.Base.Choices.Skip.True),
    'v|match'(skip=.Testing.Base.Choices.Skip.True),
    'vf0OUT|match'(skip=.Testing.Base.Choices.Skip.True),
    'w|match'(skip=.Testing.Base.Choices.Skip.True));

  annotation (
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
          <p>
          <b>Note:</b> The documentation string of this model defines the
          description of the respective test scenario of the manifest
          of the generated eFMI Behavioral Model container.
          </p>
          <p>
          <b>Warning:</b> All checks of this test are <u><i>disabled</i></u> by
          default (which can be changed if desired). All meaningful SiL tests of
          Software Production Engineering generated production codes are covered
          by the other dedicated tests named after the Production Code container
          they cover.
          </p>
          <p>
          The purpose of this test is to provide an easy means to play with…
          <ul>
            <li>…co-simulation of different production codes in a single
            simulation run and compare their results using the
            <code>__cosimulation_results</code> array of the eFMU co-simulation
            stub (<code>eBlock</code>)</li>
            <li>…modifications of tuneable parameters</li>
            <li>…reinitializion and recalibration behavior by activating it at
            the <code>eBlock</code> and connecting respective tuning and
            reinitialization inputs</li>
            <li>…any other test setup for which the reference trajectories
            can be reused (could be just for plotting, whereas
            <code>eBlock</code> inputs are reconnected to something else using
            Modelica's selective model extension to deselect the default
            connection to the reference trajectories)</li>
          </ul>
          To that end this test case can be edited as needed, <b>but must not be
          renamed</b>.
          </p>
          </html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-100,-150},{100,100}})));
end Test_SiL_Scenario_1;
