within OpenIPSL_CHIL.Components.PSS;
model PSSTypeIIHPFilter
  "PSS Type II of OpenIPSL with parametrization for eFMI use-case, replacing the derivative filter with a high-pass filter (HPF)."



  extends PSSTypeIIParam(       break
      derivativeLag);

  // Block icon removes blue background of default model:
  extends Modelica.Blocks.Icons.Block;

  // Tunable start values:
  parameter Real vSI_start = 1.0
    "Default start value for vSI, the PSS input signal.";

  Blocks.WashoutFilter.DerivativeLagWO.DerivativeLagHighPass dLHPFreplacement(
    order=1,
    Kw=Kw,
    Tw=Tw) "HP Filter replacing the derivative lag."
    annotation (Placement(transformation(extent={{-70,-20},{-30,20}})));
equation
  connect(dLHPFreplacement.u, vSI)
    annotation (Line(points={{-74,0},{-120,0}}, color={0,0,127}));
  connect(dLHPFreplacement.y, imLeadLag.u)
    annotation (Line(points={{-28,0},{-12,0}}, color={0,0,127}));
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
