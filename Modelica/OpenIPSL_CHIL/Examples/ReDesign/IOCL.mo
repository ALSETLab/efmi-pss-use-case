within OpenIPSL_CHIL.Examples.ReDesign;
model IOCL "I/O Model for Closed Loop Analysis]"
  extends Modelica.Icons.Example;
  IOModelforReDesign iOModelforReDesign
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Components.PSS.PSSTypeIISimpleHPF
                                pss(
    Kw=7.4,
    T1=0.339913009676242,
    T2=0.0583198524063289,
    T3=0.339913009676242,
    T4=0.0583198524063289)
                annotation (Placement(transformation(                 extent={{-20,-10},
            {0,10}})));
  Modelica.Blocks.Interfaces.RealOutput w "Speed [pu]"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,0})));
  Modelica.Blocks.Interfaces.RealInput u "Commanded input"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Math.Gain kFdbk(k=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-30})));
equation
  connect(pss.vs, iOModelforReDesign.vf)
    annotation (Line(points={{1,0},{18,0}}, color={0,0,127}));
  connect(iOModelforReDesign.w, w)
    annotation (Line(points={{41,0},{110,0}}, color={0,0,127}));
  connect(feedback.u1, u)
    annotation (Line(points={{-78,0},{-120,0}}, color={0,0,127}));
  connect(kFdbk.y, feedback.u2)
    annotation (Line(points={{-70,-19},{-70,-8}}, color={0,0,127}));
  connect(kFdbk.u, iOModelforReDesign.w) annotation (Line(points={{-70,-42},{-70,
          -52},{80,-52},{80,0},{41,0}}, color={0,0,127}));
  connect(feedback.y, pss.vSI)
    annotation (Line(points={{-61,0},{-22,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end IOCL;
