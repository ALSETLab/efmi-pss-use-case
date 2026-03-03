within OpenIPSL_CHIL.Components.PSS.Blocks;
block HighPassSimple
  "First-order high-pass Butterworth filter (Derivative-Lag replacement)"

  import Modelica.Blocks.Interfaces.RealInput;
  import Modelica.Blocks.Interfaces.RealOutput;

  parameter Real Kw = 10.8 "High-frequency gain";
  parameter Real Tw = 5.0  "Time constant (s)";

  parameter Real K = Kw*Tw "Equivalent gain K = Kw*Tw";
  parameter Real T = Tw    "Time constant T = Tw";

  RealInput u annotation(
    Placement(transformation(extent={{-140,-20},{-100,20}})));

  RealOutput y annotation(
    Placement(transformation(extent={{100,-20},{140,20}})));

protected
  Real x(start=0) "Low-pass internal state";

equation
  der(x) = (u - x)/T;
  y = K/T*(u - x);

initial equation
  der(x) = 0;

annotation (
  Icon(
    coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}}),
    graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={213,255,170},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-84,80},{78,-80}},
          textColor={0,0,255},
          textString="der(x) = (u - x)/T
y = (K/T)*(u - x)"),
        Text(
          extent={{-100,140},{100,102}},
          textColor={0,0,255},
          textString="%name")}),
  Diagram(
    coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}})),
  Documentation(info="
<html>
<p>
First-order high-pass Butterworth filter implemented in state-space form.
</p>

<p>
Transfer function:
</p>

<p>
G(s) = (Kw*Tw*s) / (1 + Tw*s)
</p>

<p>
This block replaces the DerivativeLag block while preserving the same parametrization:
</p>

<ul>
<li>K = Kw*Tw</li>
<li>T = Tw</li>
</ul>

<p>
State-space realization:
</p>

<p>
der(x) = (u - x)/T<br>
y = (K/T)*(u - x)
</p>

<p>
Initialization enforces steady-state (der(x)=0), resulting in zero initial output.
</p>
</html>
"));

end HighPassSimple;
