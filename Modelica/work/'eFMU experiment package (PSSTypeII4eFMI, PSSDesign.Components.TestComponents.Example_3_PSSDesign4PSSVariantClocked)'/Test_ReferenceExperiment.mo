within 'eFMU experiment package (PSSTypeII4eFMI, PSSDesign.Components.TestComponents.Example_3_PSSDesign4PSSVariantClocked)';
model Test_ReferenceExperiment "Reference experiment with test scenarios for
       [PSSDesign.Components.PSSTypeII4eFMI]
     instances."

  extends hidden_Test_ReferenceExperiment;

  annotation (
    preferredView="diagram",
    experiment(
      StartTime=0,
      StopTime=15,
      Interval=0.0001,
      __Dymola_Algorithm="DASSL"),
    __Dymola_experimentSetupOutput(doublePrecision=true),
    Documentation(info="
          <html>
          <p>
          Reference experiment derived from – and used to generate eBlock
          reference results from, or regression-test – the original experiment
          <a href=\"modelica://PSSDesign.Components.TestComponents.Example_3_PSSDesign4PSSVariantClocked\">PSSDesign.Components.TestComponents.Example_3_PSSDesign4PSSVariantClocked</a>.
          </p>
          </html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-100,-60},{100,100}})));
end Test_ReferenceExperiment;
