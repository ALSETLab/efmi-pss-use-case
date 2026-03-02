within PSSDesign.Components;
package PSSBlocks "Sub-blocks used in the PSS model variants"
  extends Modelica.Icons.VariantsPackage;

  block DLHPF "High-pass filter replacement for OpenIPSL DerivativeLag"
    extends Modelica.Blocks.Interfaces.SISO;

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
    parameter Real x_start = 0
      "Start value of state variable"
      annotation (Dialog(group="Initialization"));

    // 1st-order Butterworth High-Pass Filter
    Modelica.Blocks.Continuous.Filter highPassFilter(
      order = 1,
      f_cut = 1 / (2 * Modelica.Constants.pi * Tw),
      analogFilter = Modelica.Blocks.Types.AnalogFilter.Butterworth,
      filterType = Modelica.Blocks.Types.FilterType.HighPass,
      init = initType,
      x_start = {x_start},
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
            extent={{-98,98},{98,-98}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,170,213},
            fillPattern=FillPattern.Solid,
            lineThickness=1),
        Text(extent={{-60,82},{60,22}}, textColor={0,0,255}, textString="Kw*Tw*s"),
        Text(extent={{-60,-20},{60,-80}}, textColor={0,0,255}, textString="1+sTw"),
        Line(points={{-62,0},{66,0}}, color={0,0,255}, smooth=Smooth.Bezier, thickness=0.5)}));
  end DLHPF;

  model TestHPFdevlagReplacementLin
    "Test model to compare the frequency domain response of the derivative filters"
    parameter Real Kw = 10.5;
    parameter Real Tw = 5.0;
    DLHPF HPvariant(Kw=Kw, Tw=Tw)
      annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
    OpenIPSL.NonElectrical.Continuous.DerivativeLag
                                           derivativeLag(
      K=Kw*Tw,
      T=Tw,
      y_start=0,
      x_start=0)
      annotation (Placement(transformation(extent={{-10,10},{10,30}})));
    Modelica.Blocks.Interfaces.RealOutput yDL "Derivative lag output"
      annotation (Placement(transformation(extent={{100,10},{120,30}})));
    Modelica.Blocks.Interfaces.RealOutput yHP "HPF variant output"
      annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
    Modelica.Blocks.Interfaces.RealInput u "Input signal"
      annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  equation
    connect(derivativeLag.y, yDL)
      annotation (Line(points={{11,20},{110,20}}, color={0,0,127}));
    connect(HPvariant.y, yHP)
      annotation (Line(points={{11,-20},{110,-20}}, color={0,0,127}));
    connect(HPvariant.u, u) annotation (Line(points={{-12,-20},{-80,-20},{-80,0},{
            -120,0}}, color={0,0,127}));
    connect(derivativeLag.u, u) annotation (Line(points={{-12,20},{-80,20},{-80,0},
            {-120,0}}, color={0,0,127}));
    annotation (Icon(graphics={             Text(
            extent={{-100,-100},{100,-140}},
            textColor={28,108,200},
            textString="Der. Lag Block and HP Filter
"),       Polygon(lineColor={0,0,255},
                  fillColor={28,108,200},
                  pattern = LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  points={{92,-10},{112,-20},{92,-30},{92,-10}}),
        Rectangle(lineColor={160,160,164},
          fillColor={255,255,255},
          fillPattern=FillPattern.Backward,
          extent={{-80,-80},{22,8}}),
        Line(origin={3.333,-8.667},   points = {{-83.333,34.667},{24.667,34.667},{42.667,-71.333}}, color = {0,0,127}, smooth = Smooth.Bezier),
        Line(points={{-80,78},{-80,-90}},
          color={192,192,192}),
        Polygon(lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          points={{-80,90},{-88,68},{-72,68},{-80,90}}),
        Polygon(lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          points={{90,-80},{68,-72},{68,-88},{90,-80}}),
        Line(points={{-90,-80},{82,-80}},
          color={192,192,192}),
          Polygon(lineColor={0,0,255},
                  fillColor={28,108,200},
                  pattern = LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  points={{94,30},{114,20},{94,10},{94,30}})}));
  end TestHPFdevlagReplacementLin;

  function bodeDLandHPF
    "Plots the bode response for the derivative lag and high pass filter parametrized to replace it."
    extends Modelica.Icons.Function;
  algorithm
    Modelica_LinearSystems2.ModelAnalysis.TransferFunctions("PSSDesign.Components.PSSBlocks.TestHPFdevlagReplacementLin");
  end bodeDLandHPF;

  model TestHPFdevlagReplacementSim
    extends Modelica.Icons.Example;
    TestHPFdevlagReplacementLin testHPFdevlagReplacementLin
      annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
    Modelica.Blocks.Interfaces.RealOutput yDL "Derivative lag output"
      annotation (Placement(transformation(extent={{100,10},{120,30}})));
    Modelica.Blocks.Interfaces.RealOutput yHP "HPF variant output"
      annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
    Modelica.Blocks.Sources.Step step(startTime=5)
      "Ramps the frequency from smallest to largest value"
      annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  equation
    connect(testHPFdevlagReplacementLin.yDL, yDL) annotation (Line(points={{13,
            2},{20,2},{20,20},{110,20}}, color={0,0,127}));
    connect(testHPFdevlagReplacementLin.yHP, yHP) annotation (Line(points={{13,
            -2},{20,-2},{20,-20},{110,-20}}, color={0,0,127}));
    connect(step.y, testHPFdevlagReplacementLin.u)
      annotation (Line(points={{-59,0},{-10,0}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(
        StopTime=100,
        __Dymola_NumberOfIntervals=5000,
        __Dymola_Algorithm="Dassl"));
  end TestHPFdevlagReplacementSim;
end PSSBlocks;
