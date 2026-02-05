within 'eFMU experiment package (Grid4CHILTesting, PSSDesign.eFMU4CHIL.TestGridForCHILpClocked)';
model hidden_Test_ReferenceExperiment "Reference experiment with test scenarios for
       [PSSDesign.eFMU4CHIL.Grid4CHILTesting]
     instances."

  extends .DymolaEmbedded.BuildUtilities.BehavioralModel.Experiment(redeclare
      final package eFMU_configuration = configuration);

  .PSSDesign.eFMU4CHIL.TestGridForCHILpClocked experiment
    annotation (Placement(transformation(extent={{-20,60},{20,100}})));

  /*
      Test setup for [G4CHIL]:
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
    .DymolaEmbedded.BuildUtilities.BehavioralModel.ExperimentSensors.BooleanSensor
    'fault|Scenario_1|query'(each final sample_source=clkSet1.clockType ==
        "external", final source(final y=experiment.G4CHIL.fault))
    "Measured: Fault input sigal, default false = fault inactive"
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));

  final .Testing.Clocked.Recorders.BoolRecorder 'fault|Scenario_1|recorder'(
    final tick_start=1,
    final tol_tick=0,
    final cfg=clkSet1.cfg,
    final trajectoryName="fault",
    final recordTime=true,
    final method_tt)
    "Record or test: Fault input sigal, default false = fault inactive"
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));

  final
    .DymolaEmbedded.BuildUtilities.BehavioralModel.ExperimentSensors.RealSensor
    'vf|Scenario_1|query'(each final sample_source=clkSet1.clockType ==
        "external", final source(final y=experiment.G4CHIL.vf))
    "Measured: Field voltage"
    annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));

  final .Testing.Clocked.Recorders.RealRecorder 'vf|Scenario_1|recorder'(
    final tol_rel,
    final tol_abs,
    final tick_start=1,
    final tol_tick=0,
    final cfg=clkSet1.cfg,
    final trajectoryName="vf",
    final recordTime=true,
    final method_tt) "Record or test: Field voltage"
    annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));

  final
    .DymolaEmbedded.BuildUtilities.BehavioralModel.ExperimentSensors.RealSensor
    'Pgen|Scenario_1|query'(each final sample_source=clkSet1.clockType ==
        "external", final source(final y=experiment.G4CHIL.Pgen))
    "Measured: Active power [pu]"
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));

  final .Testing.Clocked.Recorders.RealRecorder 'Pgen|Scenario_1|recorder'(
    final tol_rel=tolerances_default.relative_x64.Pgen,
    final tol_abs=tolerances_default.absolute_x64.Pgen,
    final tick_start=1,
    final tol_tick=0,
    final cfg=clkSet1.cfg,
    final trajectoryName="Pgen",
    final recordTime=true,
    final method_tt) "Record or test: Active power [pu]"
    annotation (Placement(transformation(extent={{60,-40},{80,-20}})));

  final
    .DymolaEmbedded.BuildUtilities.BehavioralModel.ExperimentSensors.RealSensor
    'Qgen|Scenario_1|query'(each final sample_source=clkSet1.clockType ==
        "external", final source(final y=experiment.G4CHIL.Qgen))
    "Measured: Reactive power [pu]"
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));

  final .Testing.Clocked.Recorders.RealRecorder 'Qgen|Scenario_1|recorder'(
    final tol_rel=tolerances_default.relative_x64.Qgen,
    final tol_abs=tolerances_default.absolute_x64.Qgen,
    final tick_start=1,
    final tol_tick=0,
    final cfg=clkSet1.cfg,
    final trajectoryName="Qgen",
    final recordTime=true,
    final method_tt) "Record or test: Reactive power [pu]"
    annotation (Placement(transformation(extent={{60,-80},{80,-60}})));

  final
    .DymolaEmbedded.BuildUtilities.BehavioralModel.ExperimentSensors.RealSensor
    'v|Scenario_1|query'(each final sample_source=clkSet1.clockType ==
        "external", final source(final y=experiment.G4CHIL.v))
    "Measured: Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{20,-120},{40,-100}})));

  final .Testing.Clocked.Recorders.RealRecorder 'v|Scenario_1|recorder'(
    final tol_rel=tolerances_default.relative_x64.v,
    final tol_abs=tolerances_default.absolute_x64.v,
    final tick_start=1,
    final tol_tick=0,
    final cfg=clkSet1.cfg,
    final trajectoryName="v",
    final recordTime=true,
    final method_tt) "Record or test: Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{60,-120},{80,-100}})));

  final
    .DymolaEmbedded.BuildUtilities.BehavioralModel.ExperimentSensors.RealSensor
    'vf0OUT|Scenario_1|query'(each final sample_source=clkSet1.clockType ==
        "external", final source(final y=experiment.G4CHIL.vf0OUT))
    "Measured: Initial field voltage [pu]"
    annotation (Placement(transformation(extent={{20,-160},{40,-140}})));

  final .Testing.Clocked.Recorders.RealRecorder 'vf0OUT|Scenario_1|recorder'(
    final tol_rel=tolerances_default.relative_x64.vf0OUT,
    final tol_abs=tolerances_default.absolute_x64.vf0OUT,
    final tick_start=1,
    final tol_tick=0,
    final cfg=clkSet1.cfg,
    final trajectoryName="vf0OUT",
    final recordTime=true,
    final method_tt) "Record or test: Initial field voltage [pu]"
    annotation (Placement(transformation(extent={{60,-160},{80,-140}})));

  final
    .DymolaEmbedded.BuildUtilities.BehavioralModel.ExperimentSensors.RealSensor
    'w|Scenario_1|query'(each final sample_source=clkSet1.clockType ==
        "external", final source(final y=experiment.G4CHIL.w))
    "Measured: Speed [pu]"
    annotation (Placement(transformation(extent={{20,-200},{40,-180}})));

  final .Testing.Clocked.Recorders.RealRecorder 'w|Scenario_1|recorder'(
    final tol_rel=tolerances_default.relative_x64.w,
    final tol_abs=tolerances_default.absolute_x64.w,
    final tick_start=1,
    final tol_tick=0,
    final cfg=clkSet1.cfg,
    final trajectoryName="w",
    final recordTime=true,
    final method_tt) "Record or test: Speed [pu]"
    annotation (Placement(transformation(extent={{60,-200},{80,-180}})));

equation
  /*
      Connections for [G4CHIL]:
    */

  if clkSet1.clockType == "external" then
    connect(clock1.y, clkSet1.externalClock) annotation (Line(
        points={{-38.8,10},{-58,10}},
        color={175,175,175},
        pattern=LinePattern.Dot,
        thickness=0.5));
  end if;

  connect('fault|Scenario_1|query'.y, 'fault|Scenario_1|recorder'.act)
    annotation (Line(points={{-59,-30},{-42,-30}}, color={255,0,255}));

  connect('vf|Scenario_1|query'.y, 'vf|Scenario_1|recorder'.act)
    annotation (Line(points={{-59,-70},{-42,-70}}, color={0,0,127}));

  connect('Pgen|Scenario_1|query'.y, 'Pgen|Scenario_1|recorder'.act)
    annotation (Line(points={{41,-30},{58,-30}}, color={0,0,127}));

  connect('Qgen|Scenario_1|query'.y, 'Qgen|Scenario_1|recorder'.act)
    annotation (Line(points={{41,-70},{58,-70}}, color={0,0,127}));

  connect('v|Scenario_1|query'.y, 'v|Scenario_1|recorder'.act)
    annotation (Line(points={{41,-110},{58,-110}}, color={0,0,127}));

  connect('vf0OUT|Scenario_1|query'.y, 'vf0OUT|Scenario_1|recorder'.act)
    annotation (Line(points={{41,-150},{58,-150}}, color={0,0,127}));

  connect('w|Scenario_1|query'.y, 'w|Scenario_1|recorder'.act)
    annotation (Line(points={{41,-190},{58,-190}}, color={0,0,127}));

  annotation (
    Protection(hideFromBrowser=true),
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
    Diagram(coordinateSystem(extent={{-100,-220},{100,100}}), graphics={
          Rectangle(
          extent={{-88,50},{90,-210}},
          lineColor={0,140,72},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-88,46},{90,30}},
          textColor={0,140,72},
          textStyle={TextStyle.Bold},
          textString="Scenario 1: G4CHIL")}));
end hidden_Test_ReferenceExperiment;
