within PSSDesign.Components;
package Auxiliary "Auxiliary components for efmi export"
  extends Modelica.Icons.Package;
  model PwLine4efmi
    "Model for a transmission Line based on the pi-equivalent circuit with modifications for efmi export"
    outer OpenIPSL.Electrical.SystemBase SysData;
    import Modelica.ComplexMath.conj;
    import Modelica.ComplexMath.real;
    import Modelica.ComplexMath.imag;
    import Modelica.ComplexMath.j;
    OpenIPSL.Interfaces.PwPin_p p annotation (Placement(transformation(extent={{-100,
              -10},{-80,10}}), iconTransformation(extent={{-100,-10},{-80,10}})));
    OpenIPSL.Interfaces.PwPin_n n annotation (Placement(transformation(extent={{80,
              -10},{100,10}}), iconTransformation(extent={{80,-10},{100,10}})));
    parameter OpenIPSL.Types.PerUnit R "Resistance"
      annotation (Dialog(group="Line parameters"));
    parameter OpenIPSL.Types.PerUnit X "Reactance"
      annotation (Dialog(group="Line parameters"));
    parameter OpenIPSL.Types.PerUnit G "Shunt half conductance"
      annotation (Dialog(group="Line parameters"));
    parameter OpenIPSL.Types.PerUnit B "Shunt half susceptance"
      annotation (Dialog(group="Line parameters"));
    parameter OpenIPSL.Types.ApparentPower S_b=SysData.S_b "System base power"
      annotation (Dialog(group="Line parameters", enable=false));
    parameter OpenIPSL.Types.Time t1=Modelica.Constants.inf
      annotation (Dialog(group="Perturbation parameters"));
    parameter OpenIPSL.Types.Time t2=Modelica.Constants.inf
      annotation (Dialog(group="Perturbation parameters"));
    parameter Integer opening=1 annotation (Dialog(group=
            "Perturbation parameters"), choices(
        choice=1 "Line opening at both ends",
        choice=2 "Line opening at sending end",
        choice=3 "Line opening at receiving end"));
    parameter Boolean displayPF=false "Display power flow results:" annotation (
        Dialog(
        group="Visualisation",
        __Dymola_compact=true,
        __Dymola_descriptionLabel=true), choices(checkBox=true));
    OpenIPSL.Types.ActivePower P12;
    OpenIPSL.Types.ActivePower P21;
    OpenIPSL.Types.ReactivePower Q12;
    OpenIPSL.Types.ReactivePower Q21;
    Complex vs(re=p.vr, im=p.vi);
    Complex is(re=p.ir, im=p.ii);
    Complex vr(re=n.vr, im=n.vi);
    Complex ir(re=n.ir, im=n.ii);
    Modelica.Blocks.Interfaces.BooleanInput trip(start=false)
      "Input trip signal - true: trip on, false: trip off" annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={0,-120}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={0,-60})));
  protected
    parameter Complex Y(re=G, im=B);
    parameter Complex Z(re=R, im=X);
  equation
    //Calculations for the power flow display
    P12 = real(vs*conj(is))*S_b;
    P21 = -real(vr*conj(ir))*S_b;
    Q12 = imag(vs*conj(is))*S_b;
    Q21 = -imag(vr*conj(ir))*S_b;
    //PI model with different line openings
    if trip == true then
      if opening == 1 then
        is = Complex(0);
        ir = Complex(0);
      elseif opening == 2 then
        is = Complex(0);
        ir = (vr - ir*Z)*Y;
      else
        ir = Complex(0);
        is = (vs - is*Z)*Y;
      end if;
    else
      vs - vr = Z*(is - vs*Y);
      vr - vs = Z*(ir - vr*Y);
    end if;
    annotation (Icon(coordinateSystem(preserveAspectRatio=true),
          graphics={Rectangle(
            extent={{-80,40},{80,-40}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),Text(
            visible=displayPF,
            extent={{-200,160},{-20,40}},
            lineColor={255,0,0},
            textString=DynamicSelect("0.0 MW",
              OpenIPSL.NonElectrical.Functions.displayPower(P12, " MW"))),Polygon(
            visible=displayPF,
            points=DynamicSelect({{-120,70},{-120,50},{-80,60},{-120,70}}, if P12
               >= 0 then {{-120,70},{-120,50},{-80,60},{-120,70}} else {{-80,70},
              {-80,50},{-120,60},{-80,70}}),
            lineColor={255,0,0},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid),Text(
            visible=displayPF,
            extent={{20,160},{200,40}},
            lineColor={255,0,0},
            textString=DynamicSelect("0.0 MW",
              OpenIPSL.NonElectrical.Functions.displayPower(P21, " MW"))),Polygon(
            visible=displayPF,
            points=DynamicSelect({{80,70},{80,50},{120,60},{80,70}}, if P21 >= 0
               then {{80,70},{80,50},{120,60},{80,70}} else {{120,70},{120,50},{
              80,60},{120,70}}),
            lineColor={255,0,0},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid),Text(
            visible=displayPF,
            extent={{-200,-40},{-20,-160}},
            lineColor={0,255,0},
            textString=DynamicSelect("0.0 Mvar",
              OpenIPSL.NonElectrical.Functions.displayPower(Q12, " Mvar"))),
            Polygon(
            visible=displayPF,
            points=DynamicSelect({{-120,-70},{-120,-50},{-80,-60},{-120,-70}},
              if Q12 >= 0 then {{-120,-70},{-120,-50},{-80,-60},{-120,-70}} else
              {{-80,-70},{-80,-50},{-120,-60},{-80,-70}}),
            lineColor={0,255,0},
            fillColor={0,255,0},
            fillPattern=FillPattern.Solid),Text(
            visible=displayPF,
            extent={{20,-40},{200,-160}},
            lineColor={0,255,0},
            textString=DynamicSelect("0.0 Mvar",
              OpenIPSL.NonElectrical.Functions.displayPower(Q21, " Mvar"))),
            Polygon(
            visible=displayPF,
            points=DynamicSelect({{80,-70},{80,-50},{120,-60},{80,-70}}, if Q21
               >= 0 then {{80,-70},{80,-50},{120,-60},{80,-70}} else {{120,-70},{
              120,-50},{80,-60},{120,-70}}),
            lineColor={0,255,0},
            fillColor={0,255,0},
            fillPattern=FillPattern.Solid),Text(
            extent={{-80,12},{80,-14}},
            lineColor={0,0,0},
            textString="%name")}));
  end PwLine4efmi;

  model PwFault4efmi
    "Apply a fault at a time specified by the boolean input signal"
    OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{-80,
              -10},{-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
    parameter OpenIPSL.Types.PerUnit R = 0.001 "Resistance";
    parameter OpenIPSL.Types.PerUnit X = 0.01 "Reactance";
    import Modelica.Constants.eps;
    Modelica.Blocks.Interfaces.BooleanInput trip(start=false)
      "Trip input sigal, default false = fault inactive" annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={80,0})));
  protected
    parameter Boolean ground=abs(R) < eps and abs(X) < eps;
  equation
    if trip == false then
      p.ii = 0;
      p.ir = 0;
    elseif trip == true and ground then
      p.vr = Modelica.Constants.small; // This is to avoid numerical problems
      p.vi = 0;
    elseif trip == true then
      p.ii = (R*p.vi - X*p.vr)/(X*X + R*R);
      p.ir = (R*p.vr + X*p.vi)/(R*R + X*X);
    else
      p.ii = 0;
      p.ir = 0;
    end if;
    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-60,-60},{60,60}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
            lineColor={0,0,255}),Rectangle(
            extent={{-28,26},{12,6}},
            lineColor={0,140,72},
            fillColor={128,255,0},
            fillPattern=FillPattern.Solid,
            lineThickness=1),              Line(
            points={{12,16},{26,16},{26,-24}},
            color={0,140,72},
            smooth=Smooth.None,
            thickness=1),       Line(
            points={{14,-24},{38,-24}},
            color={0,140,72},
            smooth=Smooth.None,
            thickness=1),       Line(
            points={{16,-28},{36,-28}},
            color={0,140,72},
            smooth=Smooth.None,
            thickness=1),       Line(
            points={{20,-32},{34,-32}},
            color={0,140,72},
            smooth=Smooth.None,
            thickness=1),       Line(
            points={{22,-36},{30,-36}},
            color={0,140,72},
            smooth=Smooth.None,
            thickness=1),       Rectangle(
            extent={{-38,18},{-28,14}},
            lineColor={0,140,72},
            fillColor={0,140,72},
            fillPattern=FillPattern.Solid),Line(
            points={{-12,34},{-4,16},{-18,16},{-6,-6}},
            color={255,0,0},
            smooth=Smooth.None,
            thickness=1),  Line(
            points={{-12,-4},{-6,-6},{-6,0}},
            color={255,0,0},
            smooth=Smooth.None,
            thickness=1),       Text(
            extent={{-110,110},{110,70}},
            lineColor={0,0,255},
            textString="%name")}),
      Diagram(coordinateSystem(
          extent={{-60,-60},{60,60}},
          preserveAspectRatio=true), graphics));
  end PwFault4efmi;

  model FaultTimerLogic "Enter fault on time and fault off time as thresholds"
    extends Modelica.Blocks.Interfaces.partialBooleanSO;
    Modelica.Blocks.Logical.LessEqualThreshold lessEqThrshld(threshold=toff)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-30,-30})));
    Modelica.Blocks.Sources.ContinuousClock clock "Provides the time signal"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-70,10})));
    Modelica.Blocks.Logical.GreaterEqualThreshold gEqThrshld(threshold=ton)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-30,10})));
    Modelica.Blocks.Logical.And and1
      annotation (Placement(transformation(extent={{0,-10},{20,10}})));
    parameter Real ton=0.5 "Start time of the fault";
    parameter Real toff=0.57 "End time of the fault";

  equation
    connect(clock.y, gEqThrshld.u)
      annotation (Line(points={{-59,10},{-42,10}}, color={0,0,127}));
    connect(lessEqThrshld.u, clock.y) annotation (Line(points={{-42,-30},{-52,-30},
            {-52,10},{-59,10}}, color={0,0,127}));
    connect(gEqThrshld.y, and1.u1) annotation (Line(points={{-19,10},{-10,10},{-10,
            0},{-2,0}}, color={255,0,255}));
    connect(lessEqThrshld.y, and1.u2) annotation (Line(points={{-19,-30},{-10,-30},
            {-10,-8},{-2,-8}}, color={255,0,255}));
    connect(and1.y, y)
      annotation (Line(points={{21,0},{110,0}}, color={255,0,255}));
    annotation (Icon(                                             graphics={
        Polygon(lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          points={{-80,80},{-88,58},{-72,58},{-80,80}}),
        Line(points={{-80,58},{-80,-90}},
          color={192,192,192}),
        Line(points={{-90,-80},{82,-80}},
          color={192,192,192}),
        Polygon(lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          points={{90,-80},{68,-72},{68,-88},{90,-80}}),
          Line(points={{-80,-80},{-50,-80},{-50,60},{40,60},{40,-80},{80,-80}},
              color={255,0,255},
            thickness=1)}),                                        Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end FaultTimerLogic;

  model iSrcLoad "Controlled current source to act as a load"

    OpenIPSL.Electrical.Sources.CurrentSourceReImInput currentSourceReImInput
      annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
    OpenIPSL.Interfaces.PwPin p
      annotation (Placement(transformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Math.PolarToRectangular polarToRectangular
      annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
    Modelica.Blocks.Sources.Constant iAngle(k=0) "Current angle" annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-70,-30})));
    Modelica.Blocks.Interfaces.RealInput iMag "Current inpu"
      annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  equation
    connect(currentSourceReImInput.p, p)
      annotation (Line(points={{22,0},{110,0}}, color={0,0,255}));
    connect(polarToRectangular.y_re, currentSourceReImInput.iRe)
      annotation (Line(points={{-39,6},{-34,8},{-24,8}}, color={0,0,127}));
    connect(polarToRectangular.y_im, currentSourceReImInput.iIm)
      annotation (Line(points={{-39,-6},{-34,-8},{-24,-8}}, color={0,0,127}));
    connect(iAngle.y, polarToRectangular.u_arg)
      annotation (Line(points={{-70,-19},{-70,-6},{-62,-6}}, color={0,0,127}));
    connect(polarToRectangular.u_abs, iMag) annotation (Line(points={{-62,6},{
            -80,6},{-80,0},{-120,0}}, color={0,0,127}));
    annotation (Icon(graphics={ Text(
            extent={{-150,-110},{150,-150}},
            textColor={0,0,255},
            textString="%name"),     Line(points={{100,100},{100,-100},{-100,0},
                {100,100}},
                        color={28,108,200}),
          Text(
            extent={{-40,40},{40,-20}},
            textColor={28,108,200},
            textString="|I| Load")}));
  end iSrcLoad;
end Auxiliary;
