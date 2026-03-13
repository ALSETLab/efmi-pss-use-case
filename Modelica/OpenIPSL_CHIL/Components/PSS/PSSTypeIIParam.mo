within OpenIPSL_CHIL.Components.PSS;
model PSSTypeIIParam
  "PSS Type II of OpenIPSL with parametrization for efmi export."

  extends OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII(
    vSI(
      final start = vSI_start),
    Kw = 10.8,
    T1 = 0.278203917593164,
    T2 = 0.0551479681529786,
    T3 = 0.278203917593164,
    T4 = 0.0551479681529786,
    Tw = 5.0,
    vsmax = 1.5,
    vsmin = -1.5);

  // Tunable start values:
  parameter Real vSI_start = 1.0
    "Default start value for vSI, the PSS input signal.";

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
