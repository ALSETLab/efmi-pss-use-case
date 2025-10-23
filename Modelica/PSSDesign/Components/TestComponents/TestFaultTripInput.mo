within PSSDesign.Components.TestComponents;
model TestFaultTripInput "Model fault model variant with trip signal as input"
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
    annotation (Placement(transformation(extent={{-22,-20},{18,20}})));
  Modelica.Blocks.Sources.BooleanConstant tripLine(k=false)
    annotation (Placement(transformation(extent={{-42,-50},{-22,-30}})));
  OpenIPSL.Electrical.Sources.SourceBehindImpedance.VoltageSources.VSource v1(
    P_0=31334800,
    Q_0=6313810,
    v_0=1.0,
    angle_0=0.17453292519943)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS
                                        gENCLS(
    v_0=0.975,
    P_0=-35683000,
    Q_0=-2.34095,
    angle_0=0,
    displayPF=true,
    H=100,
    D=1.0,
    R_a=0.001,
    X_d=0.2)                                                                                annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,0})));
  OpenIPSL.Electrical.Buses.Bus B1
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  OpenIPSL.Electrical.Buses.Bus B2
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  PwFault4efmi pwFault4efmi(R=0.1, X=0.5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,-50})));
  Modelica.Blocks.Sources.BooleanPulse tripPulse(
    width=50,
    period=2,
    startTime=0.5)
    annotation (Placement(transformation(extent={{20,-100},{40,-80}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,-100},{-60,-80}})));
equation
  connect(tripLine.y, pwLine4efmi.trip)
    annotation (Line(points={{-21,-40},{-2,-40},{-2,-12}}, color={255,0,255}));
  connect(v1.p, B1.p)
    annotation (Line(points={{-79,0},{-60,0}}, color={0,0,255}));
  connect(pwLine4efmi.p, B1.p)
    annotation (Line(points={{-20,0},{-60,0}}, color={0,0,255}));
  connect(tripPulse.y, pwFault4efmi.trip) annotation (Line(points={{41,-90},{50,
          -90},{50,-63.3333}}, color={255,0,255}));
  connect(pwFault4efmi.p, B2.p)
    annotation (Line(points={{50,-38.3333},{50,0},{60,0}}, color={0,0,255}));
  connect(pwLine4efmi.n, B2.p)
    annotation (Line(points={{16,0},{60,0}}, color={0,0,255}));
  connect(B2.p, gENCLS.p)
    annotation (Line(points={{60,0},{76,0},{76,0},{80,0}}, color={0,0,255}));
  annotation (experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end TestFaultTripInput;
