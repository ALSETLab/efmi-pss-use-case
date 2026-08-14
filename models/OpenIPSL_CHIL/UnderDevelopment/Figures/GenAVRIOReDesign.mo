within OpenIPSL_CHIL.UnderDevelopment.Figures;
model GenAVRIOReDesign "Generator with AVR and I/O for linearization"
  extends OpenIPSL_CHIL.Generator.GenTemplate;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    K0=K0,                                                       T1 = 1, T2 = 1,
    Te=0.1,                                                                                   Tr = 0.015, vfmax = 7, vfmin = -6.40) annotation(
    Placement(visible = true, transformation(origin={8.3,44.8},extent={{-78.3,
            -36.8},{-20.3,-4.8}},                                                                rotation = 0)));
  replaceable OpenIPSL_CHIL.Components.Machines.Order6 machine(
    D=0,
    M=7,
    P_0=P_0,
    Q_0=Q_0,
    Sn=2220000000,
    T1d0=8,
    T1q0=1,
    T2d0=0.03,
    T2q0=0.07,
    Taa=0.002,
    V_b=V_b,
    Vn=400000,
    angle_0=angle_0,
    ra=0.003,
    v_0=v_0,
    x1d=0.3,
    x1q=0.65,
    x2d=0.23,
    x2q=0.25,
    xd=1.81,
    xq=1.76) constrainedby Components.Machines.Base.baseMachine annotation (
      Placement(visible=true, transformation(
        origin={45,1},
        extent={{-31,-31},{31,31}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput w annotation(
    Placement(transformation(origin={113,23},    extent={{-13,-13},{13,13}}),      iconTransformation(origin={110,90},    extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u(start=0.0)
                                         annotation(
    Placement(transformation(origin={-94,16},     extent={{-12,-12},{12,12}}),      iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}})));
  parameter OpenIPSL.Types.PerUnit K0=20 "regulator gain"
    annotation (Dialog(group="AVR Parameters"));
  Modelica.Blocks.Sources.RealExpression Vt(y=machine.v)
    annotation (Placement(transformation(extent={{-96,22},{-76,42}})));
equation
  connect(avr.vf, machine.vf) annotation(
    Line(points={{-9.58333,24},{-4,24},{-4,14},{7.8,14},{7.8,16.5}},  color = {0, 0, 127}));
  connect(machine.p, pwPin) annotation(
    Line(points={{76,1},{76,0},{110,0}},         color = {0, 0, 255}));
  connect(machine.pm0, machine.pm) annotation(
    Line(points={{20.2,-33.1},{20.2,-38},{-6,-38},{-6,-14.5},{7.8,-14.5}},             color = {0, 0, 127}));
  connect(machine.vf0, avr.vf0) annotation(
    Line(points={{20.2,35.1},{20.2,46},{-41,46},{-41,38.6667}},          color = {0, 0, 127}));
  connect(u, avr.vs) annotation(
    Line(points={{-94,16},{-67.5833,16}},  color = {0, 0, 127}));
  connect(machine.w, w) annotation (Line(points={{79.1,28.9},{94.55,28.9},{
          94.55,23},{113,23}},
                     color={0,0,127}));
  connect(pwPin, pwPin)
    annotation (Line(points={{110,0},{110,0}}, color={0,0,255}));
  connect(Vt.y, avr.v)
    annotation (Line(points={{-75,32},{-67.5833,32}}, color={0,0,127}));
  annotation (Icon(graphics={Text(
          extent={{-62,-60},{60,-100}},
          textColor={238,46,47},
          textString="AVR IO")}));
end GenAVRIOReDesign;
