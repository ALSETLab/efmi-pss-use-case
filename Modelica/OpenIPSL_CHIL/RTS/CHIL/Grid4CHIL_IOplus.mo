within OpenIPSL_CHIL.RTS.CHIL;
model Grid4CHIL_IOplus
  "System model for CHIL testing with more I/O"
  extends Network.RTNetwork;

  // output offset and scaling parameter
  parameter Real wscale=100.00 "Speed output scaling" annotation (Dialog(group="Output Offset and Scaling"));
  parameter Real woffset=1.00 "Speed output offset"
    annotation (Dialog(group="Output Offset and Scaling"));

  replaceable Generator.ReDesign.GenAVRIOReDesign
                                           G1(displayPF=false, K0=K0)
    constrainedby Generator.GenTemplate
    annotation (Placement(transformation(extent={{-98,-14},{-70,14}})),
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
  Modelica.Blocks.Interfaces.RealInput vf(start=0.0) "Field voltage"
    annotation (Placement(transformation(extent={{-160,40},{-120,80}}),
        iconTransformation(extent={{-160,40},{-120,80}})));
  Modelica.Blocks.Sources.RealExpression G1vf0(y=G1.vf0OUT)
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Sources.RealExpression G1v(y=G1.v)
    annotation (Placement(transformation(extent={{60,50},{80,70}})));
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
        origin={-60,-120})));
  parameter OpenIPSL.Types.PerUnit K0=30 "regulator gain"
    annotation (Dialog(group="AVR Parameters"));
  Modelica.Blocks.Interfaces.BooleanInput faultL1
    "Fault input sigal, default false = fault inactive" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  Modelica.Blocks.Interfaces.BooleanInput faultL2
    "Fault input sigal, default false = fault inactive" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={60,-120})));
  Modelica.Blocks.Interfaces.RealInput uPLoad(start=0.0)
    "Input to modulate the active power of the load" annotation (Placement(
        transformation(extent={{-160,-80},{-120,-40}}), iconTransformation(
          extent={{-160,-80},{-120,-40}})));
  Modelica.Blocks.Sources.RealExpression uPLoadIn(y=uPLoad)
    "Maps in the input pin uPLoad"
    annotation (Placement(transformation(extent={{-38,40},{-24,60}})));
  Modelica.Blocks.Sources.BooleanExpression faultL1In(y=faultL1)
    "Maps the input faultL1"
    annotation (Placement(transformation(extent={{12,-4},{26,16}})));
  Modelica.Blocks.Sources.BooleanExpression faultL2In(y=faultL2)
    "Maps the input faultL2"
    annotation (Placement(transformation(extent={{12,-48},{26,-28}})));
  Modelica.Blocks.Sources.RealExpression G1w1(y=G1.w - 1.0)
    annotation (Placement(transformation(extent={{4,85},{18,99}})));
  Modelica.Blocks.Math.Add wsum
    annotation (Placement(transformation(extent={{50,75},{60,85}})));
  Modelica.Blocks.Sources.RealExpression wOffst(y=woffset)
    annotation (Placement(transformation(extent={{20,69},{32,85}})));
  Modelica.Blocks.Math.Gain wOutpt(k=wscale)
    annotation (Placement(transformation(extent={{28,87},{38,97}})));
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-68.6,0},{-60,0}},
                                               color={0,0,255}));
  connect(vf0OUT, G1vf0.y)
    annotation (Line(points={{-80,110},{-80,90},{-79,90}}, color={0,0,127}));
  connect(G1P.y, Pgen)
    annotation (Line(points={{81,40},{110,40}}, color={0,0,127}));
  connect(G1Q.y, Qgen)
    annotation (Line(points={{81,20},{110,20}}, color={0,0,127}));
  connect(pwFault4efmi.trip, fault) annotation (Line(points={{43.3333,-70},{52,
          -70},{52,-94},{-60,-94},{-60,-120}},
                                           color={255,0,255}));
  connect(faultL1In.y, L1.trip)
    annotation (Line(points={{26.7,6},{30,6},{30,14}}, color={255,0,255}));
  connect(faultL2In.y, L2.trip) annotation (Line(points={{26.7,-38},{30,-38},{
          30,-26}}, color={255,0,255}));
  connect(G1.u, vf) annotation (Line(points={{-100.8,0},{-114,0},{-114,60},{
          -140,60}}, color={0,0,127}));
  connect(uPLoadIn.y, iSrcLoad.iMag)
    annotation (Line(points={{-23.3,50},{-17.6,50}},
                                                 color={0,0,127}));
  connect(wsum.u1,wOutpt. y) annotation (Line(points={{49,83},{46,83},{46,92},{
          38.5,92}}, color={0,0,127}));
  connect(G1w1.y,wOutpt. u)
    annotation (Line(points={{18.7,92},{27,92}},
                                               color={0,0,127}));
  connect(wsum.y, w)
    annotation (Line(points={{60.5,80},{110,80}}, color={0,0,127}));
  connect(wOffst.y,wsum. u2) annotation (Line(points={{32.6,77},{49,77}},
                   color={0,0,127}));
  connect(G1v.y, v)
    annotation (Line(points={{81,60},{110,60}}, color={0,0,127}));
  annotation (Icon(graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={198,198,198},
          fillPattern=FillPattern.Solid,
          radius=15),
        Ellipse(
          extent={{-82,-56},{-40,-98}},
          lineThickness=1,
          fillColor={213,255,170},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Polygon(
          points={{-58,135},{-64,123},{14,-17},{60,3},{-58,135}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier,
          origin={-67,26},
          rotation=-90),                  Text(
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
          radius=15),
        Ellipse(
          extent={{-126,60},{-6,-60}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          startAngle=0,
          endAngle=360),
        Polygon(
          points={{-74,56},{-104,-16},{-76,16},{-64,-56},{-34,16},{-60,-16},{
              -74,56}},
          lineColor={215,215,215},
          fillColor={213,255,170},
          fillPattern=FillPattern.Solid,
          lineThickness=2),
        Polygon(
          points={{-72,54},{-102,-18},{-74,14},{-62,-58},{-32,14},{-58,-18},{
              -72,54}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          lineThickness=1),
        Ellipse(
          extent={{34,110},{86,58}},
          lineThickness=1,
          fillColor={213,255,170},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Text(
          extent={{-44,40},{116,-120}},
          textColor={0,0,255},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="C")}),    Diagram(coordinateSystem(extent={{-120,-100},{
            100,100}}, grid={2,2})));
end Grid4CHIL_IOplus;
