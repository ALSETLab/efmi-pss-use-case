within OpenIPSL_CHIL.RTS.HIL;
model Grid4HIL "System model for HIL testing"
  extends Network.RTNetworkMinimal;

  replaceable Generator.Design.GenIO       G1(displayPF=false) constrainedby
    Generator.GenTemplate
    annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
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
  Modelica.Blocks.Interfaces.RealInput vf "Field voltage"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Sources.RealExpression G1vf0(y=G1.vf0OUT)
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Sources.RealExpression G1w(y=G1.w)
    annotation (Placement(transformation(extent={{60,70},{80,90}})));
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
        origin={0,-120})));
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
  connect(vf, G1.u)
    annotation (Line(points={{-120,0},{-96,0}}, color={0,0,127}));
  connect(vf0OUT, G1vf0.y)
    annotation (Line(points={{-80,110},{-80,90},{-79,90}}, color={0,0,127}));
  connect(G1w.y, w)
    annotation (Line(points={{81,80},{110,80}}, color={0,0,127}));
  connect(G1v.y, v)
    annotation (Line(points={{81,60},{110,60}}, color={0,0,127}));
  connect(G1P.y, Pgen)
    annotation (Line(points={{81,40},{110,40}}, color={0,0,127}));
  connect(G1Q.y, Qgen)
    annotation (Line(points={{81,20},{110,20}}, color={0,0,127}));
  connect(pwFault4efmi.trip, fault) annotation (Line(points={{43.3333,-70},{52,
          -70},{52,-94},{0,-94},{0,-120}}, color={255,0,255}));
  annotation (Icon(graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={198,198,198},
          fillPattern=FillPattern.Solid,
          radius=15),
        Polygon(
          points={{62,66},{62,66},{-36,-18},{-54,38},{62,66}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Polygon(
          points={{62,-60},{66,-54},{-44,32},{-88,-20},{62,-60}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
    Text( extent={{-72,180},{100,100}},
          textColor={28,108,200},
    textString="%name"),
        Ellipse(
          extent={{-100,56},{20,-64}},
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
          fillColor={255,0,128},
          fillPattern=FillPattern.Solid,
          lineThickness=2),
        Ellipse(
          extent={{42,98},{94,46}},
          lineThickness=1,
          fillColor={255,0,128},
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
          extent={{-28,28},{132,-132}},
          textColor={255,0,128},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="H")}));
end Grid4HIL;
