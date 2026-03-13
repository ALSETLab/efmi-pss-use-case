within OpenIPSL_CHIL.Components.PSS.Blocks;
model BandPass1stOrder
  "Simple band-pass filter using cascaded first-order high-pass and low-pass filters"

  import Modelica.Blocks.Interfaces.RealInput;
  import Modelica.Blocks.Interfaces.RealOutput;

  parameter Real freqLow = 0.1
    "Low cutoff frequency (Hz) – attenuates frequencies below this value";

  parameter Real freqHigh = 2.5
    "High cutoff frequency (Hz) – attenuates frequencies above this value";

  parameter Real K = 1 "Filter gain";

  parameter Real Tlow = 1/(2*Modelica.Constants.pi*freqLow)
    "Time constant of high-pass section";

  parameter Real Thigh = 1/(2*Modelica.Constants.pi*freqHigh)
    "Time constant of low-pass section";

  RealInput u annotation(
    Placement(transformation(extent={{-140,-20},{-100,20}})));

  RealOutput y annotation(
    Placement(transformation(extent={{100,-20},{140,20}})));

protected
  Real xHP(start=0) "High-pass internal state";
  Real xLP(start=0) "Low-pass internal state";
  Real hpOut "High-pass output";

equation
  // High-pass stage
  der(xHP) = (u - xHP)/Tlow;
  hpOut = (u - xHP);

  // Low-pass stage
  der(xLP) = (hpOut - xLP)/Thigh;

  // Output
  y = K*xLP;

initial equation
  der(xHP) = 0;
  der(xLP) = 0;

annotation (
  Icon(
    coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}}),
    graphics={
      Rectangle(
        extent={{-100,100},{100,-100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
      Text(
        extent={{-90,70},{90,30}},
        textString="Band-Pass"),
      Text(
        extent={{-92,6},{88,-34}},
        textString="HP + LP")}),
  Diagram(
    coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}})),
  Documentation(info="
<html>

<p>
Simple band-pass filter implemented as a cascade of:
</p>

<ul>
<li>First-order high-pass filter</li>
<li>First-order low-pass filter</li>
</ul>

<p>
The resulting transfer function is:
</p>

<p>
G(s) = K · (sT<sub>low</sub>)/(1+sT<sub>low</sub>) · 1/(1+sT<sub>high</sub>)
</p>

<p>
Cutoff frequencies:
</p>

<p>
f<sub>low</sub> = freqLow<br>
f<sub>high</sub> = freqHigh
</p>

<p>
Time constants are computed internally:
</p>

<p>
T<sub>low</sub> = 1/(2π·freqLow)<br>
T<sub>high</sub> = 1/(2π·freqHigh)
</p>

<p>
State-space implementation:
</p>

<p>
der(xHP) = (u − xHP)/Tlow<br>
der(xLP) = (hpOut − xLP)/Thigh
</p>

</html>
"));
end BandPass1stOrder;
