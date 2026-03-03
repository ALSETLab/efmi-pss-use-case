within OpenIPSL_CHIL.Components.Test.Auxiliary;
model iSourceLoad "Test the current source load"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine4efmi(
    R=1e-3,
    X=0.1,
    G=Modelica.Constants.small,
    B=Modelica.Constants.small,
    t1=1,
    t2=2,
    opening=3,
    displayPF=true)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  OpenIPSL.Electrical.Sources.SourceBehindImpedance.VoltageSources.VSource v1(
    P_0=10000000,
    Q_0=0,
    v_0=1.0,
    angle_0=0)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  OpenIPSL.Electrical.Buses.Bus B1
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  OpenIPSL.Electrical.Buses.Bus B2
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,-100},{-60,-80}})));
  .OpenIPSL_CHIL.Components.Auxiliary.iSrcLoad iSrcLoad annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,-30})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=1,
    duration=5,
    offset=10,
    startTime=1)  "Introduce a step at the load input"
    annotation (Placement(transformation(extent={{40,-80},{60,-60}})));
equation
  connect(v1.p, B1.p)
    annotation (Line(points={{-79,0},{-60,0}}, color={0,0,255}));
  connect(pwLine4efmi.n, B2.p)
    annotation (Line(points={{18,0},{60,0}}, color={0,0,255}));
  connect(pwLine4efmi.p, B1.p)
    annotation (Line(points={{-18,0},{-60,0}}, color={0,0,255}));
  connect(iSrcLoad.p, B2.p)
    annotation (Line(points={{80,-19},{80,0},{60,0}}, color={0,0,255}));
  connect(ramp.y, iSrcLoad.iMag)
    annotation (Line(points={{61,-70},{80,-70},{80,-42}}, color={0,0,127}));
  annotation (experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end iSourceLoad;
