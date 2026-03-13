within OpenIPSL_CHIL.Components.PSS.Blocks;
model LeadLagNoiseFilter
  "Lead-lag filter providing noise attenuation with reduced phase lag"

  import Modelica.Blocks.Interfaces.RealInput;
  import Modelica.Blocks.Interfaces.RealOutput;

  parameter Real freqZero = 10
    "Lead zero frequency (Hz)";

  parameter Real freqPole = 60
    "Lag pole frequency (Hz), must be greater than freqZero";

  parameter Real K = 1 "Filter gain";

  parameter Real Tz = 1/(2*Modelica.Constants.pi*freqZero)
    "Zero time constant";

  parameter Real Tp = 1/(2*Modelica.Constants.pi*freqPole)
    "Pole time constant";

  RealInput u annotation(
    Placement(transformation(extent={{-140,-20},{-100,20}})));

  RealOutput y annotation(
    Placement(transformation(extent={{100,-20},{140,20}})));

protected
  Real x(start=0) "Filter state";

equation
  // Lag pole dynamics
  der(x) = (u - x)/Tp;

  // Lead-lag output
  y = K*(x + (Tz/Tp)*(u - x));

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
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
      Text(
        extent={{-90,70},{90,30}},
        textString="Lead-Lag"),
      Text(
        extent={{-90,-16},{90,-56}},
        textString="(1+sTz)/(1+sTp)")}),
  Documentation(info="
<html>

<p>
Lead-lag filter providing phase lead while attenuating high-frequency noise.
</p>

<p>
Transfer function:
</p>

<p>
G(s) = K (1 + sTz)/(1 + sTp)
</p>

<p>
where:
</p>

<p>
Tz = 1/(2π·freqZero)<br>
Tp = 1/(2π·freqPole)
</p>

<p>
The zero introduces phase lead near the control-loop bandwidth,
while the pole attenuates high-frequency measurement noise.
</p>

</html>
"));
end LeadLagNoiseFilter;
