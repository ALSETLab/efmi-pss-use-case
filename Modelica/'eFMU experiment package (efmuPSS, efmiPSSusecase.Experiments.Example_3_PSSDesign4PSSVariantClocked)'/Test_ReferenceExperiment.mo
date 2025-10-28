within 'eFMU experiment package (efmuPSS, efmiPSSusecase.Experiments.Example_3_PSSDesign4PSSVariantClocked)';
model Test_ReferenceExperiment "Reference experiment with test scenarios for
       [efmiPSSusecase.Components.PSSTypeIImod4efmi]
     instances."

  extends hidden_Test_ReferenceExperiment;

  annotation (
    preferredView="diagram",
    experiment(
      StartTime=0,
      StopTime=10,
      Interval=0.0001,
      __Dymola_Algorithm="DASSL"),
    __Dymola_experimentSetupOutput(doublePrecision=true),
    Documentation(info="
          <html>
          <p>
          Reference experiment derived from – and used to generate eBlock
          reference results from, or regression-test – the original experiment
          <a href=\"modelica://efmiPSSusecase.Experiments.Example_3_PSSDesign4PSSVariantClocked\">efmiPSSusecase.Experiments.Example_3_PSSDesign4PSSVariantClocked</a>.
          </p>
          </html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-100,-60},{100,100}})));
end Test_ReferenceExperiment;
