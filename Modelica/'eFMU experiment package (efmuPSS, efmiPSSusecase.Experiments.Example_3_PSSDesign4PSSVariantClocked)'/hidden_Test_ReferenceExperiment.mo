within 'eFMU experiment package (efmuPSS, efmiPSSusecase.Experiments.Example_3_PSSDesign4PSSVariantClocked)';
model hidden_Test_ReferenceExperiment "Reference experiment with test scenarios for
       [efmiPSSusecase.Components.PSSTypeIImod4efmi]
     instances."

  extends .DymolaEmbedded.BuildUtilities.BehavioralModel.Experiment(redeclare
      final package eFMU_configuration = configuration);

  .efmiPSSusecase.Experiments.Example_3_PSSDesign4PSSVariantClocked experiment
    annotation (Placement(transformation(extent={{-20,60},{20,100}})));

  /*
      Test setup for [G1.pss]:
    */

  .Testing.Clocked.ClockSetup clkSet1(
    final fileName=bmodel_container_directory + "/Scenario_1.csv",
    /*
          Use help variable set by 'build()' to find the
          Behavioral Model container:
        */
    /*
          Instead, should just resolve the container, i.e.,
            resolve_container() + \"/Scenario_1.csv\"
          But that does not work due to the required 'hashString()' call
          failing to be evaluated at compile time, even if wrapped in
          'Evaluate=true' annotated parameter.
        */
    final ensureDir=false,
    clockType="inferred",
    final useSolver=false,
    final solverMethod,
    final period,
    final factor,
    final resolution)
    annotation (Placement(transformation(extent={{-60,0},{-80,20}})));

  final eFMU_configuration.Clocked.PeriodicRealClock clock1
    if clkSet1.clockType == "external"
    annotation (Placement(transformation(extent={{-22,2},{-38,18}})));

  final
    .DymolaEmbedded.BuildUtilities.BehavioralModel.ExperimentSensors.RealSensor
    'vSI|Scenario_1|query'(each final sample_source=clkSet1.clockType ==
        "external", final source(final y=experiment.G1.pss.vSI))
    "Measured: PSS input signal "
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));

  final .Testing.Clocked.Recorders.RealRecorder 'vSI|Scenario_1|recorder'(
    final tol_rel,
    final tol_abs,
    final tick_start=1,
    final tol_tick=0,
    final cfg=clkSet1.cfg,
    final trajectoryName="vSI",
    final recordTime=true,
    final method_tt) "Record or test: PSS input signal "
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));

  final
    .DymolaEmbedded.BuildUtilities.BehavioralModel.ExperimentSensors.RealSensor
    'vs|Scenario_1|query'(each final sample_source=clkSet1.clockType ==
        "external", final source(final y=experiment.G1.pss.vs))
    "Measured: PSS output signal"
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));

  final .Testing.Clocked.Recorders.RealRecorder 'vs|Scenario_1|recorder'(
    final tol_rel=tolerances_default.relative_x64.vs,
    final tol_abs=tolerances_default.absolute_x64.vs,
    final tick_start=1,
    final tol_tick=0,
    final cfg=clkSet1.cfg,
    final trajectoryName="vs",
    final recordTime=true,
    final method_tt) "Record or test: PSS output signal"
    annotation (Placement(transformation(extent={{60,-40},{80,-20}})));

equation
  /*
      Connections for [G1.pss]:
    */

  if clkSet1.clockType == "external" then
    connect(clock1.y, clkSet1.externalClock) annotation (Line(
        points={{-38.8,10},{-58,10}},
        color={175,175,175},
        pattern=LinePattern.Dot,
        thickness=0.5));
  end if;

  connect('vSI|Scenario_1|query'.y, 'vSI|Scenario_1|recorder'.act)
    annotation (Line(points={{-59,-30},{-42,-30}}, color={0,0,127}));

  connect('vs|Scenario_1|query'.y, 'vs|Scenario_1|recorder'.act)
    annotation (Line(points={{41,-30},{58,-30}}, color={0,0,127}));

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
          <a href=\"modelica://efmiPSSusecase.Experiments.Example_3_PSSDesign4PSSVariantClocked\">efmiPSSusecase.Experiments.Example_3_PSSDesign4PSSVariantClocked</a>.
          </p>
          </html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-100,-60},{100,100}}), graphics={
          Rectangle(
          extent={{-88,50},{90,-50}},
          lineColor={0,140,72},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-88,46},{90,30}},
          textColor={0,140,72},
          textStyle={TextStyle.Bold},
          textString="Scenario 1: G1.pss")}));
end hidden_Test_ReferenceExperiment;
