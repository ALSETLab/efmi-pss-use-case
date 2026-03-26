within OpenIPSL_CHIL.RTS.CHIL;
model Grid4CHIL "System model for CHIL testing"
  extends Network.RTNetworkMinimal;
  // output offset and scaling parameter
  parameter Real wscale=10.00
                           "Speed output scaling" annotation (Dialog(group="Output Offset and Scaling"));
  parameter Real woffset=1.0 "Speed output offset"
    annotation (Dialog(group="Output Offset and Scaling"));

  replaceable Generator.ReDesign.GenAVRIOReDesign
                                           G1(displayPF=false, K0=K0)
    constrainedby Generator.GenTemplate
    annotation (Placement(transformation(extent={{-88,-8},{-72,8}})),
      choicesAllMatching=true);
  Modelica.Blocks.Interfaces.RealOutput w "Speed [pu]"
    annotation (Placement(transformation(extent={{100,70},{120,90}})));
  Modelica.Blocks.Interfaces.RealOutput vf0OUT "Initial field voltage [pu]"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,110})));
  Modelica.Blocks.Interfaces.RealOutput v "Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput Pgen "Active power [pu]"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput Qgen "Reactive power [pu]"
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Interfaces.RealInput vf(start=0.0)
                                          "Field voltage"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Sources.RealExpression G1vf0(y=G1.vf0OUT)
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Sources.RealExpression G1P(y=
        OpenIPSL.NonElectrical.Functions.div0protect(G1.P, SysData.S_b))
    annotation (Placement(transformation(extent={{60,30},{80,50}})));
  Modelica.Blocks.Sources.RealExpression G1Q(y=
        OpenIPSL.NonElectrical.Functions.div0protect(G1.Q, SysData.S_b))
    annotation (Placement(transformation(extent={{60,10},{80,30}})));
  Modelica.Blocks.Interfaces.BooleanInput fault
    "Fault input sigal, default false = fault inactive" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  parameter OpenIPSL.Types.PerUnit K0=30 "regulator gain"
    annotation (Dialog(group="AVR Parameters"));

  Modelica.Blocks.Sources.RealExpression G1v(y=G1.v)
    annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Modelica.Blocks.Sources.RealExpression G1w1(y=G1.w - 1.0)
    annotation (Placement(transformation(extent={{40,85},{54,99}})));
  Modelica.Blocks.Math.Add wsum
    annotation (Placement(transformation(extent={{86,75},{96,85}})));
  Modelica.Blocks.Sources.RealExpression wOffst(y=woffset)
    annotation (Placement(transformation(extent={{56,69},{68,85}})));
  Modelica.Blocks.Math.Gain wOutpt(k=wscale)
    annotation (Placement(transformation(extent={{64,87},{74,97}})));
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-71.2,0},{-60,0}},
                                               color={0,0,255}));
  connect(vf, G1.u)
    annotation (Line(points={{-120,0},{-89.6,0}},
                                                color={0,0,127}));
  connect(vf0OUT, G1vf0.y)
    annotation (Line(points={{-80,110},{-80,90},{-79,90}}, color={0,0,127}));
  connect(G1P.y, Pgen)
    annotation (Line(points={{81,40},{110,40}}, color={0,0,127}));
  connect(G1Q.y, Qgen)
    annotation (Line(points={{81,20},{110,20}}, color={0,0,127}));
  connect(pwFault4efmi.trip, fault) annotation (Line(points={{43.3333,-70},{52,
          -70},{52,-94},{0,-94},{0,-120}}, color={255,0,255}));
  connect(wsum.u1,wOutpt. y) annotation (Line(points={{85,83},{82,83},{82,92},{
          74.5,92}}, color={0,0,127}));
  connect(G1w1.y,wOutpt. u)
    annotation (Line(points={{54.7,92},{63,92}},
                                               color={0,0,127}));
  connect(wsum.y, w)
    annotation (Line(points={{96.5,80},{110,80}}, color={0,0,127}));
  connect(wOffst.y,wsum. u2) annotation (Line(points={{68.6,77},{85,77}},
                   color={0,0,127}));
  connect(G1v.y, v)
    annotation (Line(points={{81,60},{110,60}}, color={0,0,127}));
  annotation (Icon(graphics={             Text(
          extent={{-72,180},{100,100}},
          textColor={0,0,255},
          textString="%name"),
                  Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          lineThickness=1,
          radius=15),
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={198,198,198},
          fillPattern=FillPattern.Solid,
          radius=15),
        Polygon(
          points={{76,92},{36,72},{-36,-18},{-54,38},{76,92}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Polygon(
          points={{68,-68},{70,-64},{-44,32},{-88,-20},{68,-68}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Ellipse(
          extent={{-98,56},{22,-64}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          startAngle=0,
          endAngle=360),
        Polygon(
          points={{-48,52},{-78,-20},{-50,12},{-38,-60},{-8,12},{-34,-20},{-48,
              52}},
          lineColor={215,215,215},
          fillColor={213,255,170},
          fillPattern=FillPattern.Solid,
          lineThickness=2),
        Ellipse(
          extent={{44,-44},{96,-96}},
          lineThickness=1,
          fillColor={213,255,170},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Polygon(
          points={{-46,52},{-76,-20},{-48,12},{-36,-60},{-6,12},{-32,-20},{-46,
              52}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          lineThickness=1),
        Text(
          extent={{-26,128},{134,-32}},
          textColor={0,0,255},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="C")}));
end Grid4CHIL;
