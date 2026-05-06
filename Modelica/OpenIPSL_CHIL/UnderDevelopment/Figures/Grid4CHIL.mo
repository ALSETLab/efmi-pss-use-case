within OpenIPSL_CHIL.UnderDevelopment.Figures;
model Grid4CHIL "System model for CHIL testing"
  extends OpenIPSL_CHIL.UnderDevelopment.Figures.RTNetworkMinimal;
  // output offset and scaling parameter
  parameter Real wscale=10.00
                           "Speed output scaling" annotation (Dialog(group="Output Offset and Scaling"));
  parameter Real woffset=1.0 "Speed output offset"
    annotation (Dialog(group="Output Offset and Scaling"));

  Modelica.Blocks.Interfaces.RealOutput w "Speed [pu]"
    annotation (Placement(transformation(extent={{100,-60},{120,-40}})));
  replaceable Generator.ReDesign.GenAVRIOReDesign
                                           G1(displayPF=false, K0=K0)
    constrainedby Generator.GenTemplate
    annotation (Placement(transformation(extent={{-92,-12},{-68,12}})),
      choicesAllMatching=true);
  Modelica.Blocks.Interfaces.RealInput vf(start=0.0)
                                          "Field voltage"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  parameter OpenIPSL.Types.PerUnit K0=30 "regulator gain"
    annotation (Dialog(group="AVR Parameters"));

  Modelica.Blocks.Sources.RealExpression G1w1(y=G1.w - 1.0)
    annotation (Placement(transformation(extent={{40,-50},{60,-31}})));
  Modelica.Blocks.Math.Add wsum
    annotation (Placement(transformation(extent={{84,-56},{96,-44}})));
  Modelica.Blocks.Math.Gain wOutpt(k=wscale)
    annotation (Placement(transformation(extent={{66,-46},{76,-35}})));
  Modelica.Blocks.Sources.RealExpression wOffst(y=woffset)
    annotation (Placement(transformation(extent={{40,-66},{60,-48}})));
  Modelica.Blocks.Interfaces.BooleanInput fault annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-60}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-60})));
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-66.8,0},{-60,0}},
                                               color={0,0,255}));
  connect(vf, G1.u)
    annotation (Line(points={{-120,0},{-94.4,0}},
                                                color={0,0,127}));
  connect(wsum.u1,wOutpt. y) annotation (Line(points={{82.8,-46.4},{82.8,-46},{
          78,-46},{78,-40.5},{76.5,-40.5}},
                     color={0,0,127}));
  connect(G1w1.y,wOutpt. u)
    annotation (Line(points={{61,-40.5},{65,-40.5}},
                                               color={0,0,127}));
  connect(wsum.y, w)
    annotation (Line(points={{96.6,-50},{110,-50}},
                                                  color={0,0,127}));
  connect(wOffst.y,wsum. u2) annotation (Line(points={{61,-57},{72,-57},{72,
          -53.6},{82.8,-53.6}},
                   color={0,0,127}));
  connect(fault, pwFault4efmi.trip)
    annotation (Line(points={{-10,-60},{-10,-43.3333}}, color={255,0,255}));
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
