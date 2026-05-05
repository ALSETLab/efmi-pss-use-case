within OpenIPSL_CHIL.Components.PSS.Blocks.WashoutFilter.HPFSimple;
block HighPassSimple
  "First-order high-pass Butterworth filter (Derivative-Lag replacement)"

  import Modelica.Blocks.Interfaces.RealInput;
  import Modelica.Blocks.Interfaces.RealOutput;

  parameter Real Kw = 10.8 "High-frequency gain";
  parameter Real Tw = 5.0  "Time constant (s)";

  parameter Real K = Kw*Tw "Equivalent gain K = Kw*Tw";
  parameter Real T = Tw    "Time constant T = Tw";

  RealInput u "Input voltage (pu)"
                                  annotation(
    Placement(transformation(extent={{-140,-20},{-100,20}})));

  RealOutput y "Output voltage (pu)" annotation(
    Placement(transformation(extent={{100,-20},{140,20}})));

protected
  Real x(start=0) "Filter Internal State";

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
          extent={{-100,140},{100,102}},
          textColor={0,0,255},
          textString="%name"),
      Line(points={{78,-80},{-94,-80}},
        color={0,0,255},
          thickness=1),
      Line(points={{-84,78},{-84,-90}},
        color={0,0,255},
          thickness=1),
      Polygon(lineColor={0,0,255},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{-84,90},{-76,68},{-92,68},{-84,90}},
          lineThickness=1),
      Line(origin={-26.667,-6.667}, points={{83.333,34.667},{-24.667,34.667},{
              -42.667,-71.333}},                                                                  color={0,0,255},   smooth = Smooth.Bezier,
          thickness=1),
        Rectangle(
          extent={{-34,16},{64,-76}},
          lineColor={0,0,255},
          fillColor={210,252,168},
          fillPattern=FillPattern.Backward),
      Polygon(lineColor={0,0,255},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{90,-80},{68,-72},{68,-88},{90,-80}},
          lineThickness=1),
        Text(
          extent={{-80,120},{20,-20}},
          textColor={0,0,255},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="H"),
        Text(
          extent={{-26,46},{74,-94}},
          textColor={0,0,255},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="P")}),
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
