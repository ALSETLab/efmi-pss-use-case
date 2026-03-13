within OpenIPSL_CHIL.Components.PSS.Blocks;
model LowPass1stOrder
  "Simple first-order low-pass filter"

  import Modelica.Blocks.Interfaces.RealInput;
  import Modelica.Blocks.Interfaces.RealOutput;

  parameter Real freqHz = 2.5 "Cutoff frequency in Hz";
  parameter Real K = 1 "Filter gain";
  parameter Real T = 1/(2*Modelica.Constants.pi*freqHz)
    "Time constant derived from cutoff frequency";

  RealInput u annotation(
    Placement(transformation(extent={{-140,-20},{-100,20}})));

  RealOutput y annotation(
    Placement(transformation(extent={{100,-20},{140,20}})));

protected
  Real x(start=0) "Internal filter state";

equation
  // First-order low-pass dynamics
  der(x) = (u - x)/T;

  // Output equation
  y = K*x;

initial equation
  // Steady-state initialization
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
        textString="Low-Pass"),
      Text(
        extent={{-90,12},{90,-28}},
        textString="K/(1+T*s)")}),
  Diagram(
    coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}})),
  Documentation(info="
<html>

<p>
Simple first-order low-pass filter.
</p>

<p>
Transfer function:
</p>

<p>
G(s) = K / (1 + T s)
</p>

<p>
The filter cutoff frequency is defined by:
</p>

<p>
f<sub>c</sub> = 1 / (2πT)
</p>

<p>
The parameter <code>freqHz</code> specifies the cutoff frequency in Hz, and
the corresponding time constant is computed internally as:
</p>

<p>
T = 1 / (2π · freqHz)
</p>

<p>
State-space realization:
</p>

<p>
der(x) = (u − x)/T <br>
y = K · x
</p>

<p>
The initialization enforces steady-state conditions at the start of the simulation.
</p>

</html>
"));
end LowPass1stOrder;
