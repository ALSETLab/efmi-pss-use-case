within efmiPSSusecase.Experiments.SILTests;
model Test_ReferenceExperiment "Reference experiment with test scenarios for
       [efmiPSSusecase.Components.PSSTypeIImod4efmi]
     instances."

  extends hidden_Test_ReferenceExperiment(clkSet1(clockType="external"));

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
          <a href=\"modelica://efmiPSSusecase.Experiments.Example_3_PSSDesign4PSSVariant\">efmiPSSusecase.Experiments.Example_3_PSSDesign4PSSVariant</a>.
          </p>
          </html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-100,-60},{100,100}})));
end Test_ReferenceExperiment;
