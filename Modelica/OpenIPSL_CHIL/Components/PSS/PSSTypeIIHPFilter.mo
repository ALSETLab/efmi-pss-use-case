within OpenIPSL_CHIL.Components.PSS;
model PSSTypeIIHPFilter
  "PSS Type II of OpenIPSL with parametrization for eFMI use-case, replacing the derivative filter with a high-pass filter (HPF)."



  extends PSSTypeIIParam(       break
      derivativeLag);

  // Tunable start values:
  parameter Real vSI_start = 1.0
    "Default start value for vSI, the PSS input signal.";

  Blocks.WashoutFilter.HPFfromMSL.DerivativeLagHighPass dLHPFreplacement(
    order=1,
    Kw=Kw,
    Tw=Tw) "HP Filter replacing the derivative lag."
    annotation (Placement(transformation(extent={{-52,-12},{-28,12}})));
equation
  connect(dLHPFreplacement.y, imLeadLag.u)
    annotation (Line(points={{-26.8,0},{-12,0}},
                                               color={0,0,127}));
  connect(lpf.y, dLHPFreplacement.u)
    annotation (Line(points={{-68,0},{-54.4,0}}, color={0,0,127}));
  annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={255,170,213},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-90,106},{30,-54}},
          textColor={0,0,255},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="H"),
        Text(
          extent={{-22,48},{98,-112}},
          textColor={0,0,255},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="P")}));
end PSSTypeIIHPFilter;
