within 'eFMU experiment package (Grid4HIL, PSSDesign.eFMUs4RTHIL.TestGridForHILClocked)';
model Test_ReferenceExperiment "Reference experiment with test scenarios for
       [PSSDesign.eFMUs4RTHIL.GridForHILTesting]
     instances."

  extends hidden_Test_ReferenceExperiment;

  annotation (
    preferredView="diagram",
    experiment(
      StartTime=0.0,
      StopTime=60,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentSetupOutput(doublePrecision=true),
    Documentation(info="
          <html>
          <p>
          Reference experiment derived from – and used to generate eBlock
          reference results from, or regression-test – the original experiment
          <a href=\"modelica://PSSDesign.eFMUs4RTHIL.TestGridForHILClocked\">PSSDesign.eFMUs4RTHIL.TestGridForHILClocked</a>.
          </p>
          </html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-100,-220},{100,100}})));
end Test_ReferenceExperiment;
