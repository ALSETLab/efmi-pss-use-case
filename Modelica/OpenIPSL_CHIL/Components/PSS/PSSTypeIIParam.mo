within OpenIPSL_CHIL.Components.PSS;
model PSSTypeIIParam
  "PSS Type II of OpenIPSL with parametrization for efmi export."

  extends OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII(
    vSI(
      final start = vSI_start),
    Kw = 4.45,
    T1 = 0.32417874258802,
    T2 = 0.0556202789619914,
    T3 = 0.32417874258802,
    T4 = 0.0556202789619914,
    Tw = 0.25,
    vsmax = 1.5,
    vsmin = -1.5,
    break connect(vSI, derivativeLag.u)
                );
  // Noise Supression filter parameters:
  parameter Modelica.Units.SI.Frequency freqLow=5.0
    "Frequency in Hz for noise supression (low-pass filter cutoff frequency) – attenuates noise at frequencies above this value.";
  parameter Real kLPF = 1.00 "Gain for noise supression (low-pass filter gain) – attenuates noise at frequencies above this value.";

  // Tunable start values:
  parameter Real vSI_start = 1.0
    "Default start value for vSI, the PSS input signal.";

  Blocks.NoiseSupressionFilters.LowPass1stOrder lpf(freqHz=freqLow, K=kLPF)
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
equation
  connect(vSI, lpf.u)
    annotation (Line(points={{-120,0},{-92,0}}, color={0,0,127}));
  connect(derivativeLag.u, lpf.y)
    annotation (Line(points={{-62,0},{-68,0}}, color={0,0,127}));
  annotation (Icon(graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
                                Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
                             Text(
          extent={{-100,100},{100,-100}},
          textColor={0,140,72},
          textString="PSS for\neFMI export"),
                                Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
                             Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,140,72},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          radius=0),
        Text(
          extent={{-128,128},{72,-72}},
          textColor={0,140,72},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="D"),
        Text(
          extent={{-46,80},{154,-120}},
          textColor={0,140,72},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="L")}));
end PSSTypeIIParam;
