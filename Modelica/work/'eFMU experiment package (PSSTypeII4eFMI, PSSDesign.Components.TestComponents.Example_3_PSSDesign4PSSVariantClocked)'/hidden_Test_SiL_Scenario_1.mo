within 'eFMU experiment package (PSSTypeII4eFMI, PSSDesign.Components.TestComponents.Example_3_PSSDesign4PSSVariantClocked)';
model hidden_Test_SiL_Scenario_1 "Test scenario defined by component [G1.pss]."

  extends .DymolaEmbedded.BuildUtilities.BehavioralModel.Experiment(redeclare
      final package eFMU_configuration = configuration, setup(final mode=.Testing.Utilities.Types.Mode.check));

protected
  final parameter
    .DymolaEmbedded.BuildUtilities.ProductionCode.SPE_Configuration
    code_configuration='PSSTypeII4eFMI.eFMU_SiL_Support'.resolve_code_configuration(
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

  'PSSTypeII4eFMI.eFMU_SiL_Support'.BinaryStub eBlock(final __embedd_clock=false)
    annotation (Placement(transformation(extent={{-15,-15},{15,15}})));

  final .Testing.Clocked.Tables.RealTable 'vSI|table'(
    final mode="r",
    final cfg=clkSet.cfg,
    final columnName="vSI",
    final columnIndex) "Read reference: PSS input signal "
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));

  .Testing.Clocked.Checks.RealMatch 'vs|match'(
    final tol_rel=tol_rel.vs,
    final tol_abs=tol_abs.vs,
    final tick_start=1,
    final tol_tick=0,
    final cfg=clkSet.cfg,
    final method_tt) "Compare with reference: PSS output signal"
    annotation (Placement(transformation(extent={{40,30},{60,50}})));

  final .Testing.Clocked.Tables.RealTable 'vs|table'(
    final mode="r",
    final cfg=clkSet.cfg,
    final columnName="vs",
    final columnIndex) "Read reference: PSS output signal"
    annotation (Placement(transformation(extent={{90,30},{70,50}})));

equation
  connect(clock.y, clkSet.externalClock) annotation (Line(
      points={{31.2,80},{12,80}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect('vSI|table'.y, eBlock.vSI)
    annotation (Line(points={{-59,40},{-15,0}}, color={0,0,127}));
  connect('vs|table'.y, 'vs|match'.ref) annotation (Line(points={{69,40},{66,40},
          {66,20},{32,20},{32,34},{36,34}}, color={0,0,127}));

  connect('vs|match'.act, eBlock.vs)
    annotation (Line(points={{36,46},{15,0}}, color={0,0,127}));

  annotation (
    Protection(hideFromBrowser=true),
    preferredView="diagram",
    experiment(
      StartTime=0,
      StopTime=15,
      __Dymola_Algorithm="DASSL"),
    __Dymola_experimentSetupOutput(doublePrecision=true),
    Documentation(info="
          <html>
          <p>
          Software-in-the-loop (SiL) test Software Production Engineering
          generated poduction codes of the backing eFMU in the test scenario
          defined by component
          <code>experiment.G1.pss</code>
          of the reference experiment
          <code>Test_ReferenceExperiment</code>.
          </p>
          </html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-100,-20},{100,100}})));
end hidden_Test_SiL_Scenario_1;
