within OpenIPSL_CHIL.Components.PSS.Blocks.WashoutFilter.HPFfromMSL;
block DerivativeLagHighPass
  "High-pass filter replacement for OpenIPSL DerivativeLag"
  extends Modelica.Blocks.Interfaces.SISO;

  // Filter Order
  parameter Integer order = 2 "Order of the filter";

  // Original parameters
  parameter Real Kw = 10.8 "Proportional gain part";
  parameter Modelica.Units.SI.Time Tw = 5.0 "Time constant";

  // Scaling factor to match OpenIPSL behavior
  parameter Real scaling_factor = Kw "Scaling factor to match OpenIPSL DerivativeLag gain";

  // Initialization parameters matching the OpenIPSL block
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.InitialOutput
    "Type of initialization"
    annotation (Dialog(group="Initialization"));
  parameter Real y_start = 0
    "Output start value"
    annotation (Dialog(group="Initialization"));

  // Dynamically sized array based on the filter order
  parameter Real x_start[order] = fill(0, order)
    "Start values of state variables"
    annotation (Dialog(group="Initialization"));

  // N-th order Butterworth High-Pass Filter
  Modelica.Blocks.Continuous.Filter highPassFilter(
    order = order,
    f_cut = 1 / (2 * Modelica.Constants.pi * Tw),
    analogFilter = Modelica.Blocks.Types.AnalogFilter.Butterworth,
    filterType = Modelica.Blocks.Types.FilterType.HighPass,
    init = initType,
    x_start = x_start,  // Notice the brackets {} are removed here!
    y_start = y_start / max(abs(scaling_factor), Modelica.Constants.eps))
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));

  // Gain block to apply the scaling factor
  Modelica.Blocks.Math.Gain matchGain(k = scaling_factor)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));

equation
  connect(u, highPassFilter.u) annotation (Line(points={{-100,0},{-42,0}}, color={0,0,127}));
  connect(highPassFilter.y, matchGain.u) annotation (Line(points={{-19,0},{18,0}}, color={0,0,127}));
  connect(matchGain.y, y) annotation (Line(points={{41,0},{100,0}}, color={0,0,127}));

  annotation (Icon(graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,170,213},
          fillPattern=FillPattern.Solid),
      Text(extent={{-60,82},{60,22}}, textColor={0,0,255}, textString="Kw*Tw*s"),
      Line(points={{-62,0},{66,0}}, color={0,0,255}, smooth=Smooth.Bezier, thickness=0.5),
      Text(extent={{-60,-20},{60,-80}}, textColor={0,0,255}, textString="1+sTw")}));
end DerivativeLagHighPass;
