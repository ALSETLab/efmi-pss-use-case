within Grid4HIL_SiLTest_generated;
model Test_ReferenceExperiment "Reference experiment with test scenarios for
       [OpenIPSL_CHIL.RTS.HIL.Grid4HIL]
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
          <a href=\"modelica://OpenIPSL_CHIL.RTS.Tests.HIL.Grid4HIL_Clocked\">OpenIPSL_CHIL.RTS.Tests.HIL.Grid4HIL_Clocked</a>.
          </p>
          </html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-100,-220},{100,100}})));
end Test_ReferenceExperiment;
