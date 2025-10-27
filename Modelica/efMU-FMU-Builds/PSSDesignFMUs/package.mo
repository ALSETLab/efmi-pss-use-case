within PSSDesignFMUs;

block package
  "System model for HIL testing"
  extends FMI.Internal.FMU;

  import FMI.FMI2.Types.*;
  import FMI.FMI2.Interfaces.*;
  import FMI.FMI2.Functions.*;


  parameter Modelica.Units.SI.Time communicationStepSize = 0.001 annotation(Dialog(tab="FMI", group="Parameters"));

  parameter FMI2Real SysData_S_b(unit="V.A", quantity="Power") = 100000000.0 "System base";

  parameter FMI2Real SysData_fn(unit="Hz", quantity="Frequency") = 60 "System frequency";

  parameter FMI2Real B1_V_b(unit="V", quantity="ElectricPotential") = 400000.0 "Base voltage of the bus";

  parameter FMI2Real B1_P_0(unit="W", quantity="Power") = 1000000.0 "Initial active power";

  parameter FMI2Real B1_Q_0(unit="var", quantity="Power") = 0 "Initial reactive power";

  parameter FMI2Real B1_v_0(unit="1") = 1 "Initial voltage magnitude";

  parameter FMI2Real B1_angle_0(unit="rad", quantity="Angle") = 0 "Initial voltage angle";

  parameter FMI2Boolean B1_displayPF = false "Display power flow:";

  parameter FMI2Real B2_V_b(unit="V", quantity="ElectricPotential") = 400000.0 "Base voltage of the bus";

  parameter FMI2Real B2_P_0(unit="W", quantity="Power") = 1000000.0 "Initial active power";

  parameter FMI2Real B2_Q_0(unit="var", quantity="Power") = 0 "Initial reactive power";

  parameter FMI2Real B2_v_0(unit="1") = 1 "Initial voltage magnitude";

  parameter FMI2Real B2_angle_0(unit="rad", quantity="Angle") = 0 "Initial voltage angle";

  parameter FMI2Boolean B2_displayPF = false "Display power flow:";

  parameter FMI2Real B3_V_b(unit="V", quantity="ElectricPotential") = 400000.0 "Base voltage of the bus";

  parameter FMI2Real B3_P_0(unit="W", quantity="Power") = 1000000.0 "Initial active power";

  parameter FMI2Real B3_Q_0(unit="var", quantity="Power") = 0 "Initial reactive power";

  parameter FMI2Real B3_v_0(unit="1") = 1 "Initial voltage magnitude";

  parameter FMI2Real B3_angle_0(unit="rad", quantity="Angle") = 0 "Initial voltage angle";

  parameter FMI2Boolean B3_displayPF = false "Display power flow:";

  parameter FMI2Real transformer_V_b(unit="V", quantity="ElectricPotential") = 400000 "Sending end bus voltage";

  parameter FMI2Real transformer_Sn(unit="V.A", quantity="Power") = 2220000000.0 "Power rating";

  parameter FMI2Real transformer_Vn(unit="V", quantity="ElectricPotential") = 400000 "Voltage rating";

  parameter FMI2Real transformer_rT(unit="1") = 0 "Resistance(transformer base)";

  parameter FMI2Real transformer_xT(unit="1") = 0.15 "Reactance(transformer base)";

  parameter FMI2Real transformer_m = 1.0 "Optional fixed tap ratio";

  parameter FMI2Boolean transformer_displayPF = false "Display power flow results:";

  parameter FMI2Real L1_R(unit="1") = 0 "Resistance";

  parameter FMI2Real L1_X(unit="1") = 0.02252252252252252 "Reactance";

  parameter FMI2Real L1_G(unit="1") = 0 "Shunt half conductance";

  parameter FMI2Real L1_B(unit="1") = 0 "Shunt half susceptance";

  parameter FMI2Real L1_S_b(unit="V.A", quantity="Power") = 100000000 "System base power";

  parameter FMI2Real L1_t1(unit="s", quantity="Time") = 1E+60;

  parameter FMI2Real L1_t2(unit="s", quantity="Time") = 1E+60;

  parameter FMI2Boolean L1_displayPF = false "Display power flow results:";

  parameter FMI2Real L2_R(unit="1") = 0 "Resistance";

  parameter FMI2Real L2_X(unit="1") = 0.041891891891891894 "Reactance";

  parameter FMI2Real L2_G(unit="1") = 0 "Shunt half conductance";

  parameter FMI2Real L2_B(unit="1") = 0 "Shunt half susceptance";

  parameter FMI2Real L2_S_b(unit="V.A", quantity="Power") = 100000000 "System base power";

  parameter FMI2Real L2_t1(unit="s", quantity="Time") = 1E+60;

  parameter FMI2Real L2_t2(unit="s", quantity="Time") = 1E+60;

  parameter FMI2Boolean L2_displayPF = false "Display power flow results:";

  parameter FMI2Real infiniteBus_V_b(unit="V", quantity="ElectricPotential") = 400000.0 "Base voltage of the bus";

  parameter FMI2Real infiniteBus_P_0(unit="W", quantity="Power") = -1998000000 "Initial active power";

  parameter FMI2Real infiniteBus_Q_0(unit="var", quantity="Power") = 87066000 "Initial reactive power";

  parameter FMI2Real infiniteBus_v_0(unit="1") = 0.90081 "Initial voltage magnitude";

  parameter FMI2Real infiniteBus_angle_0(unit="rad", quantity="Angle") = 0 "Initial voltage angle";

  parameter FMI2Boolean infiniteBus_displayPF = false "Display power flow:";

  parameter FMI2Real G1_V_b(unit="V", quantity="ElectricPotential") = 400000.0 "Base voltage of the bus";

  parameter FMI2Real G1_P_0(unit="W", quantity="Power") = 1997999999.9936 "Initial active power";

  parameter FMI2Real G1_Q_0(unit="var", quantity="Power") = 967924969.90658 "Initial reactive power";

  parameter FMI2Real G1_v_0(unit="1") = 1.0 "Initial voltage magnitude";

  parameter FMI2Real G1_angle_0(unit="rad", quantity="Angle") = 0.49467717698916 "Initial voltage angle";

  parameter FMI2Boolean G1_displayPF = false "Display power flow:";

  parameter FMI2Boolean G1_machine_displayPF = false "Display power flow:";

  parameter FMI2Real G1_machine_Sn(unit="V.A", quantity="Power") = 2220000000.0 "Power rating";

  parameter FMI2Real G1_machine_Vn(unit="V", quantity="ElectricPotential") = 400000 "Voltage rating";

  parameter FMI2Real G1_machine_ra(unit="1") = 0.003 "Armature resistance";

  parameter FMI2Real G1_machine_x1d(unit="1") = 0.3 "d-axis transient reactance";

  parameter FMI2Real G1_machine_M(unit="s", quantity="Time") = 7 "Mechanical starting time, 2H [Ws/VA]";

  parameter FMI2Real G1_machine_xd(unit="1") = 1.81 "d-axis synchronous reactance";

  parameter FMI2Real G1_machine_xq(unit="1") = 1.76 "q-axis synchronous reactance";

  parameter FMI2Real G1_machine_x1q(unit="1") = 0.65 "q-axis transient reactance";

  parameter FMI2Real G1_machine_x2d(unit="1") = 0.23 "d-axis sub-transient reactance";

  parameter FMI2Real G1_machine_x2q(unit="1") = 0.25 "q-axis sub-transient reactance";

  parameter FMI2Real G1_machine_T1d0(unit="s", quantity="Time") = 8 "d-axis open circuit transient time constant";

  parameter FMI2Real G1_machine_T1q0(unit="s", quantity="Time") = 1 "q-axis open circuit transient time constant";

  parameter FMI2Real G1_machine_T2d0(unit="s", quantity="Time") = 0.03 "d-axis open circuit sub-transient time constant";

  parameter FMI2Real G1_machine_T2q0(unit="s", quantity="Time") = 0.07 "q-axis open circuit sub-transient time constant";

  parameter FMI2Real G1_machine_Taa(unit="s", quantity="Time") = 0.002 "d-axis additional leakage time constant";

  parameter FMI2Real G1_gainVf0_k(unit="1") = -1 "Gain value multiplied with input signal";

  parameter FMI2Real vf_start(unit="1") = 0.0 annotation(Dialog(tab="Initial", group="Start Values"));

  parameter FMI2Boolean fault_start = false annotation(Dialog(tab="Initial", group="Start Values"));

  FMI2RealInput vf(start=vf_start, unit="1")  annotation(Placement(transformation(extent={ { -140, -70 }, { -100, -30 } }), iconTransformation(extent={ { -140, -70 }, { -100, -30 } })));

  FMI2BooleanInput fault(start=fault_start)  annotation(Placement(transformation(extent={ { -140, 30 }, { -100, 70 } }), iconTransformation(extent={ { -140, 30 }, { -100, 70 } })));

  FMI2RealOutput w(unit="1") "Speed [pu]" annotation(Placement(transformation(extent={ { 100, 70.0 }, { 120, 90.0 } }), iconTransformation(extent={ { 100, 70.0 }, { 120, 90.0 } })));

  FMI2RealOutput vf0OUT(unit="1") "Initial field voltage [pu]" annotation(Placement(transformation(extent={ { 100, 30.0 }, { 120, 50.0 } }), iconTransformation(extent={ { 100, 30.0 }, { 120, 50.0 } })));

  FMI2RealOutput v(unit="1") "Generator terminal voltage [pu]" annotation(Placement(transformation(extent={ { 100, -10.0 }, { 120, 10.0 } }), iconTransformation(extent={ { 100, -10.0 }, { 120, 10.0 } })));

  FMI2RealOutput Pgen(unit="W") "Active power [pu]" annotation(Placement(transformation(extent={ { 100, -50.0 }, { 120, -30.0 } }), iconTransformation(extent={ { 100, -50.0 }, { 120, -30.0 } })));

  FMI2RealOutput Qgen(unit="var") "Reactive power [pu]" annotation(Placement(transformation(extent={ { 100, -90.0 }, { 120, -70.0 } }), iconTransformation(extent={ { 100, -90.0 }, { 120, -70.0 } })));

protected

  parameter Boolean startValuesSet(start=false, fixed=false);

  Boolean initialized(start=false, fixed=true);

  record OutputVariables
    Real w;
    Real vf0OUT;
    Real v;
    Real Pgen;
    Real Qgen;
  end OutputVariables;

  OutputVariables outputVariables;

initial algorithm

  FMI.Internal.loadFMU(
    instance=instance,
    unzipdir=Modelica.Utilities.Files.loadResource("modelica://PSSDesignFMUs/Resources/FMUs/042a579"),
    fmiVersion=2,
    modelIdentifier="fmuV2ExpEulerGridForHILTesting",
    instanceName=getInstanceName(),
    interfaceType=1,
    instantiationToken="{08b51f79-dc85-49a3-9c37-c72b90634cac}",
    visible=visible,
    loggingOn=loggingOn,
    logFMICalls=logFMICalls,
    logToFile=logToFile,
    logFile=logFile,
    copyPlatformBinary=false);

  FMI.Internal.Logging.logMessages(instance);

  if not startValuesSet then
    startTime := time;
    FMI2SetReal(instance, valueReferences={16777216}, nValues=1, values={SysData_S_b});
    FMI2SetReal(instance, valueReferences={16777217}, nValues=1, values={SysData_fn});
    FMI2SetReal(instance, valueReferences={16777218}, nValues=1, values={B1_V_b});
    FMI2SetReal(instance, valueReferences={16777219}, nValues=1, values={B1_P_0});
    FMI2SetReal(instance, valueReferences={16777220}, nValues=1, values={B1_Q_0});
    FMI2SetReal(instance, valueReferences={16777221}, nValues=1, values={B1_v_0});
    FMI2SetReal(instance, valueReferences={16777222}, nValues=1, values={B1_angle_0});
    FMI2SetBoolean(instance, valueReferences={16777223}, nValues=1, values={B1_displayPF});
    FMI2SetReal(instance, valueReferences={16777224}, nValues=1, values={B2_V_b});
    FMI2SetReal(instance, valueReferences={16777225}, nValues=1, values={B2_P_0});
    FMI2SetReal(instance, valueReferences={16777226}, nValues=1, values={B2_Q_0});
    FMI2SetReal(instance, valueReferences={16777227}, nValues=1, values={B2_v_0});
    FMI2SetReal(instance, valueReferences={16777228}, nValues=1, values={B2_angle_0});
    FMI2SetBoolean(instance, valueReferences={16777229}, nValues=1, values={B2_displayPF});
    FMI2SetReal(instance, valueReferences={16777230}, nValues=1, values={B3_V_b});
    FMI2SetReal(instance, valueReferences={16777231}, nValues=1, values={B3_P_0});
    FMI2SetReal(instance, valueReferences={16777232}, nValues=1, values={B3_Q_0});
    FMI2SetReal(instance, valueReferences={16777233}, nValues=1, values={B3_v_0});
    FMI2SetReal(instance, valueReferences={16777234}, nValues=1, values={B3_angle_0});
    FMI2SetBoolean(instance, valueReferences={16777235}, nValues=1, values={B3_displayPF});
    FMI2SetReal(instance, valueReferences={16777236}, nValues=1, values={transformer_V_b});
    FMI2SetReal(instance, valueReferences={16777237}, nValues=1, values={transformer_Sn});
    FMI2SetReal(instance, valueReferences={16777238}, nValues=1, values={transformer_Vn});
    FMI2SetReal(instance, valueReferences={16777239}, nValues=1, values={transformer_rT});
    FMI2SetReal(instance, valueReferences={16777240}, nValues=1, values={transformer_xT});
    FMI2SetReal(instance, valueReferences={16777241}, nValues=1, values={transformer_m});
    FMI2SetBoolean(instance, valueReferences={16777242}, nValues=1, values={transformer_displayPF});
    FMI2SetReal(instance, valueReferences={16777243}, nValues=1, values={L1_R});
    FMI2SetReal(instance, valueReferences={16777244}, nValues=1, values={L1_X});
    FMI2SetReal(instance, valueReferences={16777245}, nValues=1, values={L1_G});
    FMI2SetReal(instance, valueReferences={16777246}, nValues=1, values={L1_B});
    FMI2SetReal(instance, valueReferences={16777247}, nValues=1, values={L1_S_b});
    FMI2SetReal(instance, valueReferences={16777248}, nValues=1, values={L1_t1});
    FMI2SetReal(instance, valueReferences={16777249}, nValues=1, values={L1_t2});
    FMI2SetBoolean(instance, valueReferences={16777250}, nValues=1, values={L1_displayPF});
    FMI2SetReal(instance, valueReferences={16777251}, nValues=1, values={L2_R});
    FMI2SetReal(instance, valueReferences={16777252}, nValues=1, values={L2_X});
    FMI2SetReal(instance, valueReferences={16777253}, nValues=1, values={L2_G});
    FMI2SetReal(instance, valueReferences={16777254}, nValues=1, values={L2_B});
    FMI2SetReal(instance, valueReferences={16777255}, nValues=1, values={L2_S_b});
    FMI2SetReal(instance, valueReferences={16777256}, nValues=1, values={L2_t1});
    FMI2SetReal(instance, valueReferences={16777257}, nValues=1, values={L2_t2});
    FMI2SetBoolean(instance, valueReferences={16777258}, nValues=1, values={L2_displayPF});
    FMI2SetReal(instance, valueReferences={16777259}, nValues=1, values={infiniteBus_V_b});
    FMI2SetReal(instance, valueReferences={16777260}, nValues=1, values={infiniteBus_P_0});
    FMI2SetReal(instance, valueReferences={16777261}, nValues=1, values={infiniteBus_Q_0});
    FMI2SetReal(instance, valueReferences={16777262}, nValues=1, values={infiniteBus_v_0});
    FMI2SetReal(instance, valueReferences={16777263}, nValues=1, values={infiniteBus_angle_0});
    FMI2SetBoolean(instance, valueReferences={16777264}, nValues=1, values={infiniteBus_displayPF});
    FMI2SetReal(instance, valueReferences={16777265}, nValues=1, values={G1_V_b});
    FMI2SetReal(instance, valueReferences={16777266}, nValues=1, values={G1_P_0});
    FMI2SetReal(instance, valueReferences={16777267}, nValues=1, values={G1_Q_0});
    FMI2SetReal(instance, valueReferences={16777268}, nValues=1, values={G1_v_0});
    FMI2SetReal(instance, valueReferences={16777269}, nValues=1, values={G1_angle_0});
    FMI2SetBoolean(instance, valueReferences={16777270}, nValues=1, values={G1_displayPF});
    FMI2SetBoolean(instance, valueReferences={16777271}, nValues=1, values={G1_machine_displayPF});
    FMI2SetReal(instance, valueReferences={16777272}, nValues=1, values={G1_machine_Sn});
    FMI2SetReal(instance, valueReferences={16777273}, nValues=1, values={G1_machine_Vn});
    FMI2SetReal(instance, valueReferences={16777274}, nValues=1, values={G1_machine_ra});
    FMI2SetReal(instance, valueReferences={16777275}, nValues=1, values={G1_machine_x1d});
    FMI2SetReal(instance, valueReferences={16777276}, nValues=1, values={G1_machine_M});
    FMI2SetReal(instance, valueReferences={16777277}, nValues=1, values={G1_machine_xd});
    FMI2SetReal(instance, valueReferences={16777278}, nValues=1, values={G1_machine_xq});
    FMI2SetReal(instance, valueReferences={16777279}, nValues=1, values={G1_machine_x1q});
    FMI2SetReal(instance, valueReferences={16777280}, nValues=1, values={G1_machine_x2d});
    FMI2SetReal(instance, valueReferences={16777281}, nValues=1, values={G1_machine_x2q});
    FMI2SetReal(instance, valueReferences={16777282}, nValues=1, values={G1_machine_T1d0});
    FMI2SetReal(instance, valueReferences={16777283}, nValues=1, values={G1_machine_T1q0});
    FMI2SetReal(instance, valueReferences={16777284}, nValues=1, values={G1_machine_T2d0});
    FMI2SetReal(instance, valueReferences={16777285}, nValues=1, values={G1_machine_T2q0});
    FMI2SetReal(instance, valueReferences={16777286}, nValues=1, values={G1_machine_Taa});
    FMI2SetReal(instance, valueReferences={16777287}, nValues=1, values={G1_gainVf0_k});
    FMI2SetupExperiment(instance,
      toleranceDefined=tolerance > 0.0,
      tolerance=tolerance,
      startTime=startTime,
      stopTimeDefined=stopTime < Modelica.Constants.inf,
      stopTime=stopTime);
    FMI2EnterInitializationMode(instance);
    FMI2SetReal(instance, valueReferences={620756992}, nValues=1, values={vf_start});
    FMI2SetBoolean(instance, valueReferences={620756993}, nValues=1, values={fault_start});
    startValuesSet := true;
  end if;

algorithm

  when {initial(), sample(startTime, communicationStepSize)} then

    FMI2SetReal(instance, valueReferences={620756992}, nValues=1, values={pre(vf)});
    FMI2SetBoolean(instance, valueReferences={620756993}, nValues=1, values={pre(fault)});

    if not initialized and not initial() then
      FMI2ExitInitializationMode(instance);
      initialized := true;
    end if;

    if time >= startTime + communicationStepSize then
      FMI2DoStep(instance,
        currentCommunicationPoint=time - communicationStepSize,
        communicationStepSize=communicationStepSize,
        noSetFMUStatePriorToCurrentPoint=true);
    end if;

    if not initial() then
      outputVariables.w := FMI2GetReal(instance, valueReference=603979776);
      outputVariables.vf0OUT := FMI2GetReal(instance, valueReference=67108865);
      outputVariables.v := FMI2GetReal(instance, valueReference=603979778);
      outputVariables.Pgen := FMI2GetReal(instance, valueReference=603979779);
      outputVariables.Qgen := FMI2GetReal(instance, valueReference=603979780);
    end if;

  end when;

equation

  if initial() then
    w = pure(FMI2GetInitialReal(instance, startTime, valueReference=603979776));
  else
    w = outputVariables.w;
  end if;

  if initial() then
    vf0OUT = pure(FMI2GetInitialReal(instance, startTime, valueReference=67108865));
  else
    vf0OUT = outputVariables.vf0OUT;
  end if;

  if initial() then
    v = pure(FMI2GetInitialReal(instance, startTime, booleanInputValueReferences={620756993}, booleanInputValues={fault}, valueReference=603979778));
  else
    v = outputVariables.v;
  end if;

  if initial() then
    Pgen = pure(FMI2GetInitialReal(instance, startTime, booleanInputValueReferences={620756993}, booleanInputValues={fault}, valueReference=603979779));
  else
    Pgen = outputVariables.Pgen;
  end if;

  if initial() then
    Qgen = pure(FMI2GetInitialReal(instance, startTime, booleanInputValueReferences={620756993}, booleanInputValues={fault}, valueReference=603979780));
  else
    Qgen = outputVariables.Qgen;
  end if;

  annotation (
   Icon(coordinateSystem(
      preserveAspectRatio=false,
      extent={{-100,-100},{100,100}}),
      graphics={Bitmap(extent={{-90,-90},{90,90}}, fileName="modelica://PSSDesignFMUs/Resources/FMUs/042a579/model.png")}
    ),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    experiment(StopTime=10.0),
    uses(FMI(version="0.0.8")),
    Documentation(info="<html>
<p>For more information open the FMU's <a href=\"modelica://PSSDesignFMUs/Resources/FMUs/042a579/documentation/index.html\">original documentation</a>.</p>
</html>")
  );
end package;