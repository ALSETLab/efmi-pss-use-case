within 'eFMU experiment package (CHILTest, PSSDesign.eFMU4CHIL.TestGridForCHILpClocked)';
model Test_ReferenceExperiment "Reference experiment with test scenarios for
       [PSSDesign.eFMU4CHIL.Grid4CHILTesting]
     instances."

  extends hidden_Test_ReferenceExperiment;

  annotation (
    preferredView="diagram",
    experiment(
      StartTime=0.0,
      StopTime=20,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentSetupOutput(doublePrecision=true),
    Documentation(info="
          <html>
          <p>
          Reference experiment derived from – and used to generate eBlock
          reference results from, or regression-test – the original experiment
          <a href=\"modelica://PSSDesign.eFMU4CHIL.TestGridForCHILpClocked\">PSSDesign.eFMU4CHIL.TestGridForCHILpClocked</a>.
          </p>
          </html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-100,-220},{100,100}})));
end Test_ReferenceExperiment;
