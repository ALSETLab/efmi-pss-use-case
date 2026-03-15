within OpenIPSL_CHIL.Components.PSS.Blocks.NoiseSupressionFilters;
model LowPass1stOrder "Simple first-order low-pass filter"

  import Modelica.Blocks.Interfaces.RealInput;
  import Modelica.Blocks.Interfaces.RealOutput;

  parameter Real freqHz = 15.0 "Cutoff frequency in Hz";
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
        extent={{-100,100},{100,60}},
          textColor={0,0,255},
          textString="LPF"),
      Text(
        extent={{-88,68},{92,28}},
          textColor={0,0,255},
          textString="K/(1+T*s)"),      Text(
        extent={{-148,148},{152,108}},
        textString="%name",
        textColor={0,0,255}),
      Line(points={{-78,78},{-78,-90}},
        color={192,192,192}),
      Polygon(lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{-78,90},{-86,68},{-70,68},{-78,90}}),
      Line(points={{-88,-80},{84,-80}},
        color={192,192,192}),
      Polygon(lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{92,-80},{70,-72},{70,-88},{92,-80}}),
      Rectangle(lineColor={160,160,164},
        fillColor={255,255,255},
        fillPattern=FillPattern.Backward,
        extent={{-78,-80},{24,8}}),
      Line(origin={5.333,-8.667},   points = {{-83.333,34.667},{24.667,34.667},{42.667,-71.333}}, color = {0,0,127}, smooth = Smooth.Bezier)}),
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
