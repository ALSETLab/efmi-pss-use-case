within 'eFMU experiment package (Grid4CHILTesting, PSSDesign.eFMU4CHIL.TestGridForCHILpClocked)';
model hidden_Test_SiL_Scenario_1 "Test scenario defined by component [G4CHIL]."

  extends .DymolaEmbedded.BuildUtilities.BehavioralModel.Experiment(redeclare
      final package eFMU_configuration = configuration, setup(final mode=.Testing.Utilities.Types.Mode.check));

protected
  final parameter
    .DymolaEmbedded.BuildUtilities.ProductionCode.SPE_Configuration
    code_configuration='Grid4CHILTesting.eFMU_SiL_Support'.resolve_code_configuration(
      eBlock.__defining_code);

public
  final parameter ToleranceConfiguration tol_rel=(if code_configuration.float_precision
       == .DymolaEmbedded.BuildUtilities.ProductionCode.FloatPrecision.x32
       then tolerances_Scenario_1.relative_x32 elseif code_configuration.float_precision
       == .DymolaEmbedded.BuildUtilities.ProductionCode.FloatPrecision.x64
       then tolerances_Scenario_1.relative_x64 else ToleranceConfiguration());

  final parameter ToleranceConfiguration tol_abs=(if code_configuration.float_precision
       == .DymolaEmbedded.BuildUtilities.ProductionCode.FloatPrecision.x32
       then tolerances_Scenario_1.absolute_x32 elseif code_configuration.float_precision
       == .DymolaEmbedded.BuildUtilities.ProductionCode.FloatPrecision.x64
       then tolerances_Scenario_1.absolute_x64 else ToleranceConfiguration());

  final .Testing.Clocked.ClockSetup clkSet(
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
    final clockType="external",
    final useSolver=false,
    final solverMethod,
    final period,
    final factor,
    final resolution)
    annotation (Placement(transformation(extent={{10,70},{-10,90}})));

  final eFMU_configuration.Clocked.PeriodicRealClock clock
    annotation (Placement(transformation(extent={{48,72},{32,88}})));

  'Grid4CHILTesting.eFMU_SiL_Support'.BinaryStub eBlock(final __embedd_clock=false)
    annotation (Placement(transformation(extent={{-15,-15},{15,15}})));

  final .Testing.Clocked.Tables.BoolTable 'fault|table'(
    final mode="r",
    final cfg=clkSet.cfg,
    final columnName="fault",
    final columnIndex)
    "Read reference: Fault input sigal, default false = fault inactive"
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));

  final .Testing.Clocked.Tables.RealTable 'vf|table'(
    final mode="r",
    final cfg=clkSet.cfg,
    final columnName="vf",
    final columnIndex) "Read reference: Field voltage"
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));

  .Testing.Clocked.Checks.RealMatch 'Pgen|match'(
    final tol_rel=tol_rel.Pgen,
    final tol_abs=tol_abs.Pgen,
    final tick_start=1,
    final tol_tick=0,
    final cfg=clkSet.cfg,
    final method_tt) "Compare with reference: Active power [pu]"
    annotation (Placement(transformation(extent={{40,30},{60,50}})));

  final .Testing.Clocked.Tables.RealTable 'Pgen|table'(
    final mode="r",
    final cfg=clkSet.cfg,
    final columnName="Pgen",
    final columnIndex) "Read reference: Active power [pu]"
    annotation (Placement(transformation(extent={{90,30},{70,50}})));

  .Testing.Clocked.Checks.RealMatch 'Qgen|match'(
    final tol_rel=tol_rel.Qgen,
    final tol_abs=tol_abs.Qgen,
    final tick_start=1,
    final tol_tick=0,
    final cfg=clkSet.cfg,
    final method_tt) "Compare with reference: Reactive power [pu]"
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));

  final .Testing.Clocked.Tables.RealTable 'Qgen|table'(
    final mode="r",
    final cfg=clkSet.cfg,
    final columnName="Qgen",
    final columnIndex) "Read reference: Reactive power [pu]"
    annotation (Placement(transformation(extent={{90,-10},{70,10}})));

  .Testing.Clocked.Checks.RealMatch 'v|match'(
    final tol_rel=tol_rel.v,
    final tol_abs=tol_abs.v,
    final tick_start=1,
    final tol_tick=0,
    final cfg=clkSet.cfg,
    final method_tt) "Compare with reference: Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{40,-50},{60,-30}})));

  final .Testing.Clocked.Tables.RealTable 'v|table'(
    final mode="r",
    final cfg=clkSet.cfg,
    final columnName="v",
    final columnIndex) "Read reference: Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{90,-50},{70,-30}})));

  .Testing.Clocked.Checks.RealMatch 'vf0OUT|match'(
    final tol_rel=tol_rel.vf0OUT,
    final tol_abs=tol_abs.vf0OUT,
    final tick_start=1,
    final tol_tick=0,
    final cfg=clkSet.cfg,
    final method_tt) "Compare with reference: Initial field voltage [pu]"
    annotation (Placement(transformation(extent={{40,-90},{60,-70}})));

  final .Testing.Clocked.Tables.RealTable 'vf0OUT|table'(
    final mode="r",
    final cfg=clkSet.cfg,
    final columnName="vf0OUT",
    final columnIndex) "Read reference: Initial field voltage [pu]"
    annotation (Placement(transformation(extent={{90,-90},{70,-70}})));

  .Testing.Clocked.Checks.RealMatch 'w|match'(
    final tol_rel=tol_rel.w,
    final tol_abs=tol_abs.w,
    final tick_start=1,
    final tol_tick=0,
    final cfg=clkSet.cfg,
    final method_tt) "Compare with reference: Speed [pu]"
    annotation (Placement(transformation(extent={{40,-130},{60,-110}})));

  final .Testing.Clocked.Tables.RealTable 'w|table'(
    final mode="r",
    final cfg=clkSet.cfg,
    final columnName="w",
    final columnIndex) "Read reference: Speed [pu]"
    annotation (Placement(transformation(extent={{90,-130},{70,-110}})));

equation
  connect(clock.y, clkSet.externalClock) annotation (Line(
      points={{31.2,80},{12,80}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect('fault|table'.y, eBlock.fault)
    annotation (Line(points={{-59,40},{-15,0}}, color={255,0,255}));
  connect('vf|table'.y, eBlock.vf)
    annotation (Line(points={{-59,0},{-15,0}}, color={0,0,127}));
  connect('Pgen|table'.y, 'Pgen|match'.ref) annotation (Line(points={{69,40},{
          66,40},{66,20},{32,20},{32,34},{36,34}}, color={0,0,127}));

  connect('Pgen|match'.act, eBlock.Pgen)
    annotation (Line(points={{36,46},{15,0}}, color={0,0,127}));

  connect('Qgen|table'.y, 'Qgen|match'.ref) annotation (Line(points={{69,0},{66,
          0},{66,-20},{32,-20},{32,-6},{36,-6}}, color={0,0,127}));

  connect('Qgen|match'.act, eBlock.Qgen)
    annotation (Line(points={{36,6},{15,0}}, color={0,0,127}));

  connect('v|table'.y, 'v|match'.ref) annotation (Line(points={{69,-40},{66,-40},
          {66,-60},{32,-60},{32,-46},{36,-46}}, color={0,0,127}));

  connect('v|match'.act, eBlock.v)
    annotation (Line(points={{36,-34},{15,0}}, color={0,0,127}));

  connect('vf0OUT|table'.y, 'vf0OUT|match'.ref) annotation (Line(points={{69,-80},
          {66,-80},{66,-100},{32,-100},{32,-86},{36,-86}}, color={0,0,127}));

  connect('vf0OUT|match'.act, eBlock.vf0OUT)
    annotation (Line(points={{36,-74},{15,0}}, color={0,0,127}));

  connect('w|table'.y, 'w|match'.ref) annotation (Line(points={{69,-120},{66,-120},
          {66,-140},{32,-140},{32,-126},{36,-126}}, color={0,0,127}));

  connect('w|match'.act, eBlock.w)
    annotation (Line(points={{36,-114},{15,0}}, color={0,0,127}));

  annotation (
    Protection(hideFromBrowser=true),
    preferredView="diagram",
    experiment(
      StartTime=0.0,
      StopTime=20,
      __Dymola_Algorithm="DASSL"),
    __Dymola_experimentSetupOutput(doublePrecision=true),
    Documentation(info="
          <html>
          <p>
          Software-in-the-loop (SiL) test Software Production Engineering
          generated poduction codes of the backing eFMU in the test scenario
          defined by component
          <code>experiment.G4CHIL</code>
          of the reference experiment
          <code>Test_ReferenceExperiment</code>.
          </p>
          </html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-100,-150},{100,100}})));
end hidden_Test_SiL_Scenario_1;
