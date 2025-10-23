within PSSDesign.Components;
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
