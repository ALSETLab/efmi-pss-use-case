within efmiPSSusecase.Experiments.efmiSILTest;
model hidden_Test_ReferenceExperiment "Reference experiment with test scenarios for
       [efmiPSSusecase.Components.PSSTypeIImod4efmi]
     instances."

  extends .DymolaEmbedded.BuildUtilities.BehavioralModel.Experiment(redeclare
      final package eFMU_configuration = configuration);

  .efmiPSSusecase.Experiments.Example_3_PSSDesign4efmu experiment
    annotation (Placement(transformation(extent={{-20,60},{20,100}})));

  annotation (
    Protection(hideFromBrowser=true),
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
          <a href=\"modelica://efmiPSSusecase.Experiments.Example_3_PSSDesign4efmu\">efmiPSSusecase.Experiments.Example_3_PSSDesign4efmu</a>.
          </p>
          </html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-100,50},{100,100}})));
end hidden_Test_ReferenceExperiment;
