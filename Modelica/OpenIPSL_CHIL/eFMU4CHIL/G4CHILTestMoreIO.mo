within OpenIPSL_CHIL.eFMU4CHIL;
model G4CHILTestMoreIO "System model for CHIL testing with more I/O"
  extends Modelica.Icons.Example;
  extends Network.PartialNetwork4efmuVariant;

  replaceable Generator.Design.GenAVRIO    G1(displayPF=false, K0=K0)
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
    annotation (Placement(transformation(extent={{-140,40},{-100,80}}),
        iconTransformation(extent={{-140,40},{-100,80}})));
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
        transformation(extent={{-140,-80},{-100,-40}}), iconTransformation(
          extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Sources.RealExpression uPLoadIn(y=uPLoad)
    "Maps in the input pin uPLoad"
    annotation (Placement(transformation(extent={{0,74},{20,94}})));
  Modelica.Blocks.Sources.BooleanExpression faultL1In(y=faultL1)
    "Maps the input faultL1"
    annotation (Placement(transformation(extent={{12,-4},{26,16}})));
  Modelica.Blocks.Sources.BooleanExpression faultL2In(y=faultL2)
    "Maps the input faultL2"
    annotation (Placement(transformation(extent={{12,-48},{26,-28}})));
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-68.6,0},{-60,0}},
                                               color={0,0,255}));
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
          -70},{52,-94},{-60,-94},{-60,-120}},
                                           color={255,0,255}));
  connect(faultL1In.y, L1.trip)
    annotation (Line(points={{26.7,6},{30,6},{30,14}}, color={255,0,255}));
  connect(faultL2In.y, L2.trip) annotation (Line(points={{26.7,-38},{30,-38},{
          30,-26}}, color={255,0,255}));
  connect(G1.u, vf) annotation (Line(points={{-100.8,0},{-110,0},{-110,60},{
          -120,60}}, color={0,0,127}));
  connect(uPLoadIn.y, iSrcLoad.iMag) annotation (Line(points={{21,84},{52,84},{
          52,60},{42,60}}, color={0,0,127}));
  annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-84,42},{88,-38}},
          textColor={28,108,200},
          textString="%name"),
        Text(
          extent={{-100,-60},{100,-98}},
          textColor={238,46,47},
          textString="CHIL")}), Diagram(coordinateSystem(extent={{-120,-100},{
            100,100}}, grid={2,2})));
end G4CHILTestMoreIO;
