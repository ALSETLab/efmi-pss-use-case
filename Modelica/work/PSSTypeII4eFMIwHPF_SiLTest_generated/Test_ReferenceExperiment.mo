within PSSTypeII4eFMIwHPF_SiLTest_generated;
model Test_ReferenceExperiment "Reference experiment with test scenarios for
       [PSSDesign.Components.PSSTypeII4eFMIwHPFilter]
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
          <a href=\"modelica://OpenIPSL_CHIL.Components.Test.PSS.HighPassFilterWOF.TestGenPSS4efmiHPFvarClocked\">PSSDesign.Components.TestComponents.TestPPSVariants.HighPassFilterWOF.TestGenPSS4efmiHPFvarClocked</a>.
          </p>
          </html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-100,-60},{100,100}})));
end Test_ReferenceExperiment;
