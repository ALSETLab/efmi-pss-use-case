within PSSDesign.Components.TestComponents;
model TestLineTripInput "Model line model variant with trip signal as input"
  extends Modelica.Icons.Example;
  PwLine4efmi pwLine4efmi(
    R=1e-3,
    X=0.1,
    G=Modelica.Constants.small,
    B=Modelica.Constants.small,
    t1=1,
    t2=2,
    opening=3,
    displayPF=true)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.BooleanPulse tripPulse(
    width=50,
    period=1,
    startTime=1)
    annotation (Placement(transformation(extent={{-40,-70},{-20,-50}})));
  OpenIPSL.Electrical.Sources.SourceBehindImpedance.VoltageSources.VSource v1(
    P_0=31334800,
    Q_0=6313810,
    v_0=1.0,
    angle_0=0.17453292519943)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(
    v_0=0.975,
    P_0=-35.683e6,
    Q_0=-2.34095,
    angle_0=0,
    displayPF=true)                                                                         annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,0})));
  OpenIPSL.Electrical.Buses.Bus B1
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  OpenIPSL.Electrical.Buses.Bus B2
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,-100},{-60,-80}})));
equation
  connect(tripPulse.y, pwLine4efmi.trip)
    annotation (Line(points={{-19,-60},{0,-60},{0,-12}}, color={255,0,255}));
  connect(v1.p, B1.p)
    annotation (Line(points={{-79,0},{-60,0}}, color={0,0,255}));
  connect(B2.p, infiniteBus.p)
    annotation (Line(points={{60,0},{80,0}}, color={0,0,255}));
  connect(pwLine4efmi.n, B2.p)
    annotation (Line(points={{18,0},{60,0}}, color={0,0,255}));
  connect(pwLine4efmi.p, B1.p)
    annotation (Line(points={{-18,0},{-60,0}}, color={0,0,255}));
  annotation (experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end TestLineTripInput;
