within OpenIPSL_CHIL.Components.PSS;
model PSSTypeIIParam
  "PSS Type II of OpenIPSL with parametrization for efmi export."

  extends OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII(
    vSI(
      final start = vSI_start),
    Kw = 2.7,
    T1 = 0.32417874258802,
    T2 = 0.0556202789619914,
    T3 = 0.32417874258802,
    T4 = 0.0556202789619914,
    Tw = 0.25,
    vsmax = 1.5,
    vsmin = -1.5,
    break derivativeLag
                );

  // input scaling parameter
  parameter Real wscale=10.0 "Speed input scaling" annotation (Dialog(group="Input Scaling"));

  // Noise Supression filter parameters:
  parameter Modelica.Units.SI.Frequency freqLow=5.0
    "Frequency in Hz for noise supression (low-pass filter cutoff frequency) – attenuates noise at frequencies above this value.";
  parameter Real kLPF = 1.00 "Gain for noise supression (low-pass filter gain) – attenuates noise at frequencies above this value.";

  // Tunable start values:
  parameter Real vSI_start = 1.0
    "Default start value for vSI, the PSS input signal.";

  Blocks.NoiseSupressionFilters.LowPass1stOrder lpf(freqHz=freqLow, K=kLPF)
    annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
  OpenIPSL.NonElectrical.Continuous.DerivativeLag derivativeLag(
    K=Kw*Tw,
    T=Tw,
    y_start=0,
    x_start=0)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Math.Gain scale(k=1/wscale)
    annotation (Placement(transformation(extent={{-98,-6},{-86,6}})));
equation
  connect(imLeadLag.u, lpf.y)
    annotation (Line(points={{-12,0},{-24,0}}, color={0,0,127}));
  connect(derivativeLag.y, lpf.u)
    annotation (Line(points={{-59,0},{-48,0}}, color={0,0,127}));
  connect(vSI, scale.u)
    annotation (Line(points={{-120,0},{-99.2,0}}, color={0,0,127}));
  connect(derivativeLag.u, scale.y)
    annotation (Line(points={{-82,0},{-85.4,0}}, color={0,0,127}));
  annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,140,72},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          radius=0),
        Text(
          extent={{-132,130},{68,-70}},
          textColor={0,140,72},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="D"),
        Text(
          extent={{-60,64},{140,-136}},
          textColor={0,140,72},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="L")}));
end PSSTypeIIParam;
