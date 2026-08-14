within ;

package
  Grid4CHIL_IOplus_CL_SiLTest_generated
  "Test scenarios of original experiment
     [OpenIPSL_CHIL.Examples.CHIL_Configuration.ReferenceSetup_Clocked]
   for eBlock model
     [OpenIPSL_CHIL.RTS.CHIL.Grid4CHIL_IOplus]."

  extends .DymolaEmbedded.Icons.eFMI_ExperimentPackage;

  final package configuration = .OpenIPSL_CHIL.RTS.CHIL.eFMUs.Grid4CHIL_IOplus;

  record ToleranceConfiguration
    "Configuration of tolerances (absolute or relative)."

    extends .DymolaEmbedded.Icons.eFMI_ExperimentConfiguration;

    parameter Real Pgen=0 "Active power [pu]";
    parameter Real Qgen=0 "Reactive power [pu]";
    parameter Real v=0 "Generator terminal voltage [pu]";
    parameter Real vf0OUT=0 "Initial field voltage [pu]";
    parameter Real w=0 "Speed [pu]";

    annotation (preferredView="info", Protection(hideFromBrowser=true));
  end ToleranceConfiguration;

  record ToleranceConfigurations "Configuration of absolute and relative tolerances for varying
     floating-point precisions."

    extends .DymolaEmbedded.Icons.eFMI_ExperimentConfiguration;

    parameter ToleranceConfiguration absolute_x32
      "Absolute tolerances (x32-bit floating-point precision).";
    parameter ToleranceConfiguration relative_x32
      "Relative tolerances (x32-bit floating-point precision).";

    parameter ToleranceConfiguration absolute_x64
      "Absolute tolerances (x64-bit floating-point precision).";
    parameter ToleranceConfiguration relative_x64
      "Relative tolerances (x64-bit floating-point precision).";

    annotation (preferredView="info", Protection(hideFromBrowser=true));
  end ToleranceConfigurations;

  constant ToleranceConfigurations tolerances_default
    "Configuration of default tolerances." annotation (HideResult=true,
      Placement(transformation(extent={{-80,40},{-40,80}})));

  constant ToleranceConfigurations tolerances_Scenario_1(
    absolute_x32(
      Pgen=tolerances_default.absolute_x32.Pgen,
      Qgen=tolerances_default.absolute_x32.Qgen,
      v=tolerances_default.absolute_x32.v,
      vf0OUT=tolerances_default.absolute_x32.vf0OUT,
      w=tolerances_default.absolute_x32.w),
    relative_x32(
      Pgen=tolerances_default.relative_x32.Pgen,
      Qgen=tolerances_default.relative_x32.Qgen,
      v=tolerances_default.relative_x32.v,
      vf0OUT=tolerances_default.relative_x32.vf0OUT,
      w=tolerances_default.relative_x32.w),
    absolute_x64(
      Pgen=tolerances_default.absolute_x64.Pgen,
      Qgen=tolerances_default.absolute_x64.Qgen,
      v=tolerances_default.absolute_x64.v,
      vf0OUT=tolerances_default.absolute_x64.vf0OUT,
      w=tolerances_default.absolute_x64.w),
    relative_x64(
      Pgen=tolerances_default.relative_x64.Pgen,
      Qgen=tolerances_default.relative_x64.Qgen,
      v=tolerances_default.relative_x64.v,
      vf0OUT=tolerances_default.relative_x64.vf0OUT,
      w=tolerances_default.relative_x64.w))
    "Configuration of tolerances for Scenario 1." annotation (HideResult=true,
      Placement(transformation(extent={{-80,-40},{-40,0}})));

  function resolve_tolerances "Return all absolute and relative tolerances, for every floating-point
     precision and test scenario, as a simple vector (ordered by first test
     scenario, then floating-point precision, absolute before relative
     tolerances and finally eBlock interface order)."

    output Real[:] tolerances "Vector of all tolerances configurations.";

    extends .DymolaEmbedded.Icons.eFMI_ExperimentConfiguration;

  algorithm
    tolerances := {tolerances_Scenario_1.absolute_x32.Pgen,
      tolerances_Scenario_1.absolute_x32.Qgen,tolerances_Scenario_1.absolute_x32.v,
      tolerances_Scenario_1.absolute_x32.vf0OUT,tolerances_Scenario_1.absolute_x32.w,
      tolerances_Scenario_1.relative_x32.Pgen,tolerances_Scenario_1.relative_x32.Qgen,
      tolerances_Scenario_1.relative_x32.v,tolerances_Scenario_1.relative_x32.vf0OUT,
      tolerances_Scenario_1.relative_x32.w,tolerances_Scenario_1.absolute_x64.Pgen,
      tolerances_Scenario_1.absolute_x64.Qgen,tolerances_Scenario_1.absolute_x64.v,
      tolerances_Scenario_1.absolute_x64.vf0OUT,tolerances_Scenario_1.absolute_x64.w,
      tolerances_Scenario_1.relative_x64.Pgen,tolerances_Scenario_1.relative_x64.Qgen,
      tolerances_Scenario_1.relative_x64.v,tolerances_Scenario_1.relative_x64.vf0OUT,
      tolerances_Scenario_1.relative_x64.w};

    annotation (preferredView="info", Protection(hideFromBrowser=true));
  end resolve_tolerances;

  function resolve_container "Resolve the root directory of the eFMI Behavioral Model container backing
     this package. The directory is created on request if it does not exist yet."

    extends .DymolaEmbedded.Icons.Configuration;

    input Boolean create_directory=true "Whether the directory of the backing eFMI Behavioral Model container
       shall be created or not.";

    output String container_directory "Absolute path of the Dymola-administered eFMI Behavioral Model
       container for the test scenarios of this package.";
    output Boolean container_exists
      "Whether the eFMI Behavioral Model container exists or not.";
    output String experiment_package "Full qualified name of this eFMU experiment package, i.e., the package
       defining the eFMI Behavioral Model container.";

  protected
    String build_directory;

  algorithm
    experiment_package := getInstanceName();
    experiment_package := .Modelica.Utilities.Strings.substring(
        experiment_package,
        1,
        .Modelica.Utilities.Strings.findLast(experiment_package, ".resolve_container")
         - 1);
    (build_directory,,) := configuration.configuration_resources();
    container_directory := build_directory + "/eFMU/BModel_Dymola_" +
      hashString(experiment_package);
    container_exists := .Modelica.Utilities.Files.exist(container_directory);
    if create_directory and not (container_exists) then
      .Modelica.Utilities.Files.createDirectory(container_directory);
    end if;

    annotation (preferredView="info", Protection(hideFromBrowser=true));
  end resolve_container;

  /*
    Use help variable set by 'build()' to find the
    Behavioral Model container:
  */
  constant String bmodel_container_directory=""
    annotation (Protection(hideFromBrowser=true));

  function build "Build the Behavioral Model container administered by this
     eFMU experiment package."

    extends .DymolaEmbedded.Icons.Runtime;
    extends .DymolaEmbedded.Icons.Build;

    output Boolean succeeded "Whether the build succeeded or failed.";
    output String error_message "Error message in case the build failed.";

  protected
    String experiment_package;
    .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent
      [:] interface;

  algorithm
    interface := 'Grid4CHIL_IOplus.eFMU_SiL_Support'.resolve_interface();
    (,,experiment_package) := resolve_container();
    (succeeded,error_message) :=
      .DymolaEmbedded.BuildUtilities.BehavioralModel.build(
        experiment_package=experiment_package,
        interface=interface);

    annotation (preferredView="info", __Dymola_interactive=true);
  end build;

  function browse_container "Open the root directory of the eFMI Behavioral Model container backing
     this package."

    extends .DymolaEmbedded.Icons.Terminal;

    input Boolean open_file_manager=true "Shall the container directory be opened in the operating system's
       default file manager?";

    output String container_directory "Absolute path of the Dymola-administered eFMI Behavioral Model
       container for the test scenarios of this package.";
    output Boolean container_exists
      "Whether the eFMI Behavioral Model container exists or not.";

  algorithm
    (container_directory,container_exists,) := resolve_container(
        create_directory=false);
    if open_file_manager then
      if container_exists then
        () := .DymolaCommands.System.Execute(
            file="cmd /c start \"\" \"" + container_directory + "\"",
            terminal=false,
            wait=false);
      else
        assert(false, "\n\nERROR (browse_container):" + "\n  Behavioral Model container not built yet; cannot browse its content.\n\n");
      end if;
    end if;

    annotation (preferredView="info", __Dymola_interactive=true);
  end browse_container;

  model hidden_Test_ReferenceExperiment "Reference experiment with test scenarios for
       [OpenIPSL_CHIL.RTS.CHIL.Grid4CHIL_IOplus]
     instances."

    extends .DymolaEmbedded.BuildUtilities.BehavioralModel.Experiment(
        redeclare final package eFMU_configuration = configuration);

    .OpenIPSL_CHIL.Examples.CHIL_Configuration.Grid4CHIL_IOplus.ReferenceSetup_Clocked
      experiment
      annotation (Placement(transformation(extent={{-20,60},{20,100}})));

    /*
      Test setup for [G4CHIL_IOplus]:
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
      'fault|Scenario_1|query'(each final sample_source=clkSet1.clockType == "external",
        final source(final y=experiment.G4CHIL_IOplus.fault))
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
      .DymolaEmbedded.BuildUtilities.BehavioralModel.ExperimentSensors.BooleanSensor
      'faultL1|Scenario_1|query'(each final sample_source=clkSet1.clockType == "external",
        final source(final y=experiment.G4CHIL_IOplus.faultL1))
      "Measured: Fault input sigal, default false = fault inactive"
      annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));

    final .Testing.Clocked.Recorders.BoolRecorder 'faultL1|Scenario_1|recorder'(
      final tick_start=1,
      final tol_tick=0,
      final cfg=clkSet1.cfg,
      final trajectoryName="faultL1",
      final recordTime=true,
      final method_tt)
      "Record or test: Fault input sigal, default false = fault inactive"
      annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));

    final
      .DymolaEmbedded.BuildUtilities.BehavioralModel.ExperimentSensors.BooleanSensor
      'faultL2|Scenario_1|query'(each final sample_source=clkSet1.clockType == "external",
        final source(final y=experiment.G4CHIL_IOplus.faultL2))
      "Measured: Fault input sigal, default false = fault inactive"
      annotation (Placement(transformation(extent={{-80,-120},{-60,-100}})));

    final .Testing.Clocked.Recorders.BoolRecorder 'faultL2|Scenario_1|recorder'(
      final tick_start=1,
      final tol_tick=0,
      final cfg=clkSet1.cfg,
      final trajectoryName="faultL2",
      final recordTime=true,
      final method_tt)
      "Record or test: Fault input sigal, default false = fault inactive"
      annotation (Placement(transformation(extent={{-40,-120},{-20,-100}})));

    final
      .DymolaEmbedded.BuildUtilities.BehavioralModel.ExperimentSensors.RealSensor
      'uPLoad|Scenario_1|query'(each final sample_source=clkSet1.clockType == "external",
        final source(final y=experiment.G4CHIL_IOplus.uPLoad))
      "Measured: Input to modulate the active power of the load"
      annotation (Placement(transformation(extent={{-80,-160},{-60,-140}})));

    final .Testing.Clocked.Recorders.RealRecorder 'uPLoad|Scenario_1|recorder'(
      final tol_rel,
      final tol_abs,
      final tick_start=1,
      final tol_tick=0,
      final cfg=clkSet1.cfg,
      final trajectoryName="uPLoad",
      final recordTime=true,
      final method_tt)
      "Record or test: Input to modulate the active power of the load"
      annotation (Placement(transformation(extent={{-40,-160},{-20,-140}})));

    final
      .DymolaEmbedded.BuildUtilities.BehavioralModel.ExperimentSensors.RealSensor
      'vf|Scenario_1|query'(each final sample_source=clkSet1.clockType == "external",
        final source(final y=experiment.G4CHIL_IOplus.vf))
      "Measured: Field voltage"
      annotation (Placement(transformation(extent={{-80,-200},{-60,-180}})));

    final .Testing.Clocked.Recorders.RealRecorder 'vf|Scenario_1|recorder'(
      final tol_rel,
      final tol_abs,
      final tick_start=1,
      final tol_tick=0,
      final cfg=clkSet1.cfg,
      final trajectoryName="vf",
      final recordTime=true,
      final method_tt) "Record or test: Field voltage"
      annotation (Placement(transformation(extent={{-40,-200},{-20,-180}})));

    final
      .DymolaEmbedded.BuildUtilities.BehavioralModel.ExperimentSensors.RealSensor
      'Pgen|Scenario_1|query'(each final sample_source=clkSet1.clockType == "external",
        final source(final y=experiment.G4CHIL_IOplus.Pgen))
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
      'Qgen|Scenario_1|query'(each final sample_source=clkSet1.clockType == "external",
        final source(final y=experiment.G4CHIL_IOplus.Qgen))
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
      'v|Scenario_1|query'(each final sample_source=clkSet1.clockType == "external",
        final source(final y=experiment.G4CHIL_IOplus.v))
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
      'vf0OUT|Scenario_1|query'(each final sample_source=clkSet1.clockType == "external",
        final source(final y=experiment.G4CHIL_IOplus.vf0OUT))
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
      'w|Scenario_1|query'(each final sample_source=clkSet1.clockType == "external",
        final source(final y=experiment.G4CHIL_IOplus.w))
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
      Connections for [G4CHIL_IOplus]:
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

    connect('faultL1|Scenario_1|query'.y, 'faultL1|Scenario_1|recorder'.act)
      annotation (Line(points={{-59,-70},{-42,-70}}, color={255,0,255}));

    connect('faultL2|Scenario_1|query'.y, 'faultL2|Scenario_1|recorder'.act)
      annotation (Line(points={{-59,-110},{-42,-110}}, color={255,0,255}));

    connect('uPLoad|Scenario_1|query'.y, 'uPLoad|Scenario_1|recorder'.act)
      annotation (Line(points={{-59,-150},{-42,-150}}, color={0,0,127}));

    connect('vf|Scenario_1|query'.y, 'vf|Scenario_1|recorder'.act)
      annotation (Line(points={{-59,-190},{-42,-190}}, color={0,0,127}));

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
        StopTime=30,
        __Dymola_Algorithm="Dassl"),
      __Dymola_experimentSetupOutput(doublePrecision=true),
      Documentation(info="
          <html>
          <p>
          Reference experiment derived from – and used to generate eBlock
          reference results from, or regression-test – the original experiment
          <a href=\"modelica://OpenIPSL_CHIL.Examples.CHIL_Configuration.Grid4CHIL_IOplus.ReferenceSetup_Clocked\">OpenIPSL_CHIL.Examples.CHIL_Configuration.ReferenceSetup_Clocked</a>.
          </p>
          </html>"),
      Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
      Diagram(coordinateSystem(extent={{-100,-220},{100,100}}), graphics={
            Rectangle(
              extent={{-88,50},{90,-210}},
              lineColor={0,140,72},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),Text(
              extent={{-88,46},{90,30}},
              textColor={0,140,72},
              textStyle={TextStyle.Bold},
              textString="Scenario 1: G4CHIL_IOplus")}));
  end hidden_Test_ReferenceExperiment;

  model Test_ReferenceExperiment "Reference experiment with test scenarios for
       [OpenIPSL_CHIL.RTS.CHIL.Grid4CHIL_IOplus]
     instances."

    extends hidden_Test_ReferenceExperiment;

    annotation (
      preferredView="diagram",
      experiment(
        StartTime=0.0,
        StopTime=30,
        __Dymola_Algorithm="Dassl"),
      __Dymola_experimentSetupOutput(doublePrecision=true),
      Documentation(info="
          <html>
          <p>
          Reference experiment derived from – and used to generate eBlock
          reference results from, or regression-test – the original experiment
          <a href=\"modelica://OpenIPSL_CHIL.Examples.CHIL_Configuration.Grid4CHIL_IOplus.ReferenceSetup_Clocked\">OpenIPSL_CHIL.Examples.CHIL_Configuration.ReferenceSetup_Clocked</a>.
          </p>
          </html>"),
      Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
      Diagram(coordinateSystem(extent={{-100,-220},{100,100}})));
  end Test_ReferenceExperiment;

  model hidden_Test_SiL_Scenario_1
    "Test scenario defined by component [G4CHIL_IOplus]."

    extends .DymolaEmbedded.BuildUtilities.BehavioralModel.Experiment(
        redeclare final package eFMU_configuration = configuration, setup(
          final mode=.Testing.Base.Choices.Mode.test));

  protected
    final parameter
      .DymolaEmbedded.BuildUtilities.ProductionCode.SPE_Configuration
      code_configuration=
        'Grid4CHIL_IOplus.eFMU_SiL_Support'.resolve_code_configuration(eBlock.
        __defining_code);

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

    'Grid4CHIL_IOplus.eFMU_SiL_Support'.BinaryStub eBlock(final __embedd_clock=false)
      annotation (Placement(transformation(extent={{-15,-15},{15,15}})));

    final .Testing.Clocked.Tables.BoolTable 'fault|table'(
      final mode="r",
      final cfg=clkSet.cfg,
      final columnName="fault",
      final columnIndex)
      "Read reference: Fault input sigal, default false = fault inactive"
      annotation (Placement(transformation(extent={{-80,30},{-60,50}})));

    final .Testing.Clocked.Tables.BoolTable 'faultL1|table'(
      final mode="r",
      final cfg=clkSet.cfg,
      final columnName="faultL1",
      final columnIndex)
      "Read reference: Fault input sigal, default false = fault inactive"
      annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));

    final .Testing.Clocked.Tables.BoolTable 'faultL2|table'(
      final mode="r",
      final cfg=clkSet.cfg,
      final columnName="faultL2",
      final columnIndex)
      "Read reference: Fault input sigal, default false = fault inactive"
      annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));

    final .Testing.Clocked.Tables.RealTable 'uPLoad|table'(
      final mode="r",
      final cfg=clkSet.cfg,
      final columnName="uPLoad",
      final columnIndex)
      "Read reference: Input to modulate the active power of the load"
      annotation (Placement(transformation(extent={{-80,-90},{-60,-70}})));

    final .Testing.Clocked.Tables.RealTable 'vf|table'(
      final mode="r",
      final cfg=clkSet.cfg,
      final columnName="vf",
      final columnIndex) "Read reference: Field voltage"
      annotation (Placement(transformation(extent={{-80,-130},{-60,-110}})));

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
      final method_tt)
      "Compare with reference: Generator terminal voltage [pu]"
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

    connect('faultL1|table'.y, eBlock.faultL1)
      annotation (Line(points={{-59,0},{-15,0}}, color={255,0,255}));

    connect('faultL2|table'.y, eBlock.faultL2)
      annotation (Line(points={{-59,-40},{-15,0}}, color={255,0,255}));

    connect('uPLoad|table'.y, eBlock.uPLoad)
      annotation (Line(points={{-59,-80},{-15,0}}, color={0,0,127}));

    connect('vf|table'.y, eBlock.vf)
      annotation (Line(points={{-59,-120},{-15,0}}, color={0,0,127}));

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
        StopTime=30,
        __Dymola_Algorithm="DASSL"),
      __Dymola_experimentSetupOutput(doublePrecision=true),
      Documentation(info="
          <html>
          <p>
          Software-in-the-loop (SiL) test Software Production Engineering
          generated poduction codes of the backing eFMU in the test scenario
          defined by component
          <code>experiment.G4CHIL_IOplus</code>
          of the reference experiment
          <code>Test_ReferenceExperiment</code>.
          </p>
          </html>"),
      Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
      Diagram(coordinateSystem(extent={{-100,-150},{100,100}})));
  end hidden_Test_SiL_Scenario_1;

  model Test_SiL_Scenario_1
    "Test scenario defined by component [G4CHIL_IOplus]."

    extends hidden_Test_SiL_Scenario_1(
      'Pgen|match'(skip=.Testing.Base.Choices.Skip.True),
      'Qgen|match'(skip=.Testing.Base.Choices.Skip.True),
      'v|match'(skip=.Testing.Base.Choices.Skip.True),
      'vf0OUT|match'(skip=.Testing.Base.Choices.Skip.True),
      'w|match'(skip=.Testing.Base.Choices.Skip.True));

    annotation (
      preferredView="diagram",
      experiment(
        StartTime=0.0,
        StopTime=30,
        __Dymola_Algorithm="DASSL"),
      __Dymola_experimentSetupOutput(doublePrecision=true),
      Documentation(info="
          <html>
          <p>
          Software-in-the-loop (SiL) test Software Production Engineering
          generated poduction codes of the backing eFMU in the test scenario
          defined by component
          <code>experiment.G4CHIL_IOplus</code>
          of the reference experiment
          <code>Test_ReferenceExperiment</code>.
          </p>
          <p>
          <b>Note:</b> The documentation string of this model defines the
          description of the respective test scenario of the manifest
          of the generated eFMI Behavioral Model container.
          </p>
          <p>
          <b>Warning:</b> All checks of this test are <u><i>disabled</i></u> by
          default (which can be changed if desired). All meaningful SiL tests of
          Software Production Engineering generated production codes are covered
          by the other dedicated tests named after the Production Code container
          they cover.
          </p>
          <p>
          The purpose of this test is to provide an easy means to play with…
          <ul>
            <li>…co-simulation of different production codes in a single
            simulation run and compare their results using the
            <code>__cosimulation_results</code> array of the eFMU co-simulation
            stub (<code>eBlock</code>)</li>
            <li>…modifications of tuneable parameters</li>
            <li>…reinitializion and recalibration behavior by activating it at
            the <code>eBlock</code> and connecting respective tuning and
            reinitialization inputs</li>
            <li>…any other test setup for which the reference trajectories
            can be reused (could be just for plotting, whereas
            <code>eBlock</code> inputs are reconnected to something else using
            Modelica's selective model extension to deselect the default
            connection to the reference trajectories)</li>
          </ul>
          To that end this test case can be edited as needed, <b>but must not be
          renamed</b>.
          </p>
          </html>"),
      Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
      Diagram(coordinateSystem(extent={{-100,-150},{100,100}})));
  end Test_SiL_Scenario_1;

  model
    hidden_Test_SiL_Scenario_1_PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed
    "SiL test Production Code container [PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed] in the scenario defined by component [G4CHIL_IOplus]."

    extends hidden_Test_SiL_Scenario_1(eBlock(
        final __defining_code='Grid4CHIL_IOplus.eFMU_SiL_Support'.ProductionCodes.PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed,
        final __active_codes={'Grid4CHIL_IOplus.eFMU_SiL_Support'.ProductionCodes.PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed},
        final __enable_tuning=false,
        final __enable_reinitialization=false,
        final __tuning_configuration));

    annotation (
      Protection(hideFromBrowser=true),
      preferredView="diagram",
      experiment(
        StartTime=0.0,
        StopTime=30,
        __Dymola_Algorithm="DASSL"),
      __Dymola_experimentSetupOutput(doublePrecision=true),
      Documentation(info="
          <html>
          <p>
          Software-in-the-loop (SiL) test Software Production Engineering
          generated poduction codes of the backing eFMU in the test scenario
          defined by component
          <code>experiment.G4CHIL_IOplus</code>
          of the reference experiment
          <code>Test_ReferenceExperiment</code>.
          </p>
          </html>"),
      Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
      Diagram(coordinateSystem(extent={{-100,-150},{100,100}})));
  end
    hidden_Test_SiL_Scenario_1_PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed;

  model Test_SiL_Scenario_1_PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed
    "SiL test Production Code container [PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed] in the scenario defined by component [G4CHIL_IOplus]."

    extends
      hidden_Test_SiL_Scenario_1_PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed;

    annotation (
      preferredView="diagram",
      experiment(
        StartTime=0.0,
        StopTime=30,
        __Dymola_Algorithm="DASSL"),
      __Dymola_experimentSetupOutput(doublePrecision=true),
      Documentation(info="
          <html>
          <p>
          Software-in-the-loop (SiL) test Software Production Engineering
          generated poduction codes of the backing eFMU in the test scenario
          defined by component
          <code>experiment.G4CHIL_IOplus</code>
          of the reference experiment
          <code>Test_ReferenceExperiment</code>.
          </p>
          </html>"),
      Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
      Diagram(coordinateSystem(extent={{-100,-150},{100,100}})));
  end Test_SiL_Scenario_1_PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed;

  model
    hidden_Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c
    "SiL test Production Code container [PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c] in the scenario defined by component [G4CHIL_IOplus]."

    extends hidden_Test_SiL_Scenario_1(eBlock(
        final __defining_code='Grid4CHIL_IOplus.eFMU_SiL_Support'.ProductionCodes.PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c,
        final __active_codes={'Grid4CHIL_IOplus.eFMU_SiL_Support'.ProductionCodes.PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c},
        final __enable_tuning=false,
        final __enable_reinitialization=false,
        final __tuning_configuration));

    annotation (
      Protection(hideFromBrowser=true),
      preferredView="diagram",
      experiment(
        StartTime=0.0,
        StopTime=30,
        __Dymola_Algorithm="DASSL"),
      __Dymola_experimentSetupOutput(doublePrecision=true),
      Documentation(info="
          <html>
          <p>
          Software-in-the-loop (SiL) test Software Production Engineering
          generated poduction codes of the backing eFMU in the test scenario
          defined by component
          <code>experiment.G4CHIL_IOplus</code>
          of the reference experiment
          <code>Test_ReferenceExperiment</code>.
          </p>
          </html>"),
      Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
      Diagram(coordinateSystem(extent={{-100,-150},{100,100}})));
  end
    hidden_Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c;

  model Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c
    "SiL test Production Code container [PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c] in the scenario defined by component [G4CHIL_IOplus]."

    extends
      hidden_Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c;

    annotation (
      preferredView="diagram",
      experiment(
        StartTime=0.0,
        StopTime=30,
        __Dymola_Algorithm="DASSL"),
      __Dymola_experimentSetupOutput(doublePrecision=true),
      Documentation(info="
          <html>
          <p>
          Software-in-the-loop (SiL) test Software Production Engineering
          generated poduction codes of the backing eFMU in the test scenario
          defined by component
          <code>experiment.G4CHIL_IOplus</code>
          of the reference experiment
          <code>Test_ReferenceExperiment</code>.
          </p>
          </html>"),
      Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
      Diagram(coordinateSystem(extent={{-100,-150},{100,100}})));
  end Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c;

  package SupportTypes
    extends .Modelica.Icons.TypesPackage;

  end SupportTypes;

  annotation (
    preferredView="diagram",
    uses(DymolaEmbedded(version="1.0.8"), Testing(version="2.0.0")),
    Diagram(coordinateSystem(extent={{-100,-60},{100,100}}, grid={2,2}),
                                                             graphics={
        Rectangle(
          extent={{-90,90},{90,30}},
          lineColor={0,140,72},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-40,80},{80,40}},
          textColor={0,140,72},
          textStyle={TextStyle.Bold},
          textString="default"),
        Rectangle(
          extent={{-90,-50},{90,10}},
          lineColor={0,140,72},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-40,-40},{80,0}},
          textColor={0,140,72},
          textStyle={TextStyle.Bold},
          textString="Scenario 1:\nG4CHIL_IOplus")}),
    Documentation(info="
        <html>
        <p>
        eFMU experiment package bundling test scenarios extracted from
        <a href=\"modelica://OpenIPSL_CHIL.Examples.CHIL_Configuration.Grid4CHIL_IOplus.ReferenceSetup_Clocked\">OpenIPSL_CHIL.Examples.CHIL_Configuration.ReferenceSetup_Clocked</a>
        (original experiment), with each component of type
        <a href=\"modelica://OpenIPSL_CHIL.RTS.CHIL.Grid4CHIL_IOplus\">OpenIPSL_CHIL.RTS.CHIL.Grid4CHIL_IOplus</a>
        (eBlock) defining one test scenario according to eFMU generation
        configuration
        <a href=\"modelica://OpenIPSL_CHIL.RTS.CHIL.eFMUs.Grid4CHIL_IOplus\">OpenIPSL_CHIL.RTS.CHIL.eFMUs.Grid4CHIL_IOplus</a>.
        </p>
        <p>
        The contained test scenarios are used as basis for a Dymola-administered
        eFMI Behavioral Model container within the backing eFMU.
        </p>
        <p>
        Generated by Dymola on 2026-04-20T14:08:54Z.
        </p>
        <h4>Required manual configurations</h4>
        <p>
        <b>Define time contexts of reference experiment:</b> The generated
        reference experiment (<code>Test_ReferenceExperiment</code>) assumes by
        default, that the eBlocks of the original experiment
        (<code>experiment</code> component) are already part of a correctely
        timed periodic clock partition. If some are continuous time instead, the
        <code>clkSet</code><i>X</i> component of the respective scenario must be
        changed from <code>Inferred</code> to <code>External</code>. Otherwise,
        simulations of the reference experiment will fail with clock
        partitioning translation errors. Note, that switching to
        <code>External</code> does not require to manually add and connect a
        clock; the periodic clock already shown in the diagram layer will be
        connected with the sampling period as defined in the eFMU generation
        configuration used to generate the eFMU experiment package.
        </p>
        <p>
        <b>Incorporate tuneable parameter modifications of eBlocks:</b> A
        limitation of eFMU experiment packages is, that modifications of tuneable
        parameters as defined in the original experiment are not incorporated
        into the generated software-in-the-loop (SiL) tests
        (<code>Test_SiL_Scenario_</code><i>*</i>). Please add such to the
        respective eBlocks as need be (i.e., whenever the respective eBlock of
        the original experiment has a modification of any of its tuneable
        parameters to any non-default value, add the very same modification to
        the eBlock of the SiL test).
        </p>
        <h4>Optional manual configurations</h4>
        <p>
        <b>Define tolerances:</b>
        Absolute and relative tolerances can be set to global defaults used by
        all test scenarios, or test scenario specific with specific settings
        overwriting the defaults for the respective scenario. All settings can
        be done in the graphical layer of the root package; just double click
        the respective tolerances setup icon to open dedicated editing dialogs.
        </p>
        <p>
        <b>Define test scenario descriptions:</b>
        The documentation strings of the <code>Test_SiL_Scenario_</code><i>X</i>
        models define the test scenario descriptions of the manifest
        of the generated eFMI Behavioral Model container.  
        </p>
        <h4>eFMI Behavioral Model container generation</h4>
        <p>
        After setting up time contexts, modifications, tolerances and test
        scenario descriptions as need be, a respective eFMI Behavioral Model
        container can be generated in the backing eFMU by just calling the
        <code>build()</code> function. Doing so will start a simulation of the
        <code>Test_ReferenceExperiment</code> model to generate the reference
        trajectories, and afterwards generate the container manifest.
        </p>
        <h4>Original experiment limitations</h4>
        <p>
        <b><code>min</code>/<code>max</code> annotations and automatic
        saturation:</b> The <code>min</code> and <code>max</code> annotations on
        parameters and variables of eBlocks have dedicated semantic means for
        eFMI GALEC code generated for such; in GALEC, each such entity is
        subject to automatic saturation. Such saturation semantic does not exist
        in Modelica for <code>min</code> and <code>max</code> annotations. As a
        consequence, whenever an original experiment runs into range violations
        for eBlock entities, its simulation will compute with out-of-range
        values, which in turn influence further simulation. If such out-of-range
        values would be saturated instead, the reference results very likely
        would be different. The eBlocks of the SiL experiments will
        however saturate such values and therefore likely cause the test
        to fail when compared to the original experiment based reference
        results.
        </p>
        <h4>Editing restrictions</h4>
        <p>
        <b>Warning:</b> Do <u><i>not</i></u> edit this package or its
        subclasses, except changes on…
        </p>
        <ul>
          <li>…descriptions and documentation</li>
          <li>…the clock setup (<code>clkSet</code><i>X</i>) of reference
          experiment, to switch between <code>Inferred</code> and
          <code>External</code> mode (respectively
          required whether recorded signals are already sampled or not)</li>
          <li>…tolerances (new default or test specific values)</li>
          <li>…experiment annotations of the reference experiment like start
          time, stop time, solver, fixed stepsize, output precision etc
          (start and stop time of SiL tests <i>must</i> be respectively
          adjusted)</li>
          <li>…<code>__assert_error_signals</code> of the eBlocks of SiL tests
          to change whether returned error signals of tested production code
          are asserted -- i.e., abort simulation -- or not
          <li>…eBlock parameter modifications (reference experiment and SiL
          tests <i>must</i> be kept in sync whenever parameters are
          modified)</li>
          <li>…delete SiL tests (but <i>not</i> move or rename)</li>
          <li>…rename the package or move it to become a subpacke of another library</li>
        </ul>
        <p>
        Other edits can cause the eFMU Behavioral Model generation or SiL
        tests to fail.
        </p>
        </html>"),
    Icon(coordinateSystem(extent={{-100,-60},{100,100}}, grid={2,2})));
end Grid4CHIL_IOplus_CL_SiLTest_generated;
