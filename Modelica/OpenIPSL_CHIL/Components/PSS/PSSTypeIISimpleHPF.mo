within OpenIPSL_CHIL.Components.PSS;
model PSSTypeIISimpleHPF
  "PSS Type II of OpenIPSL with parametrization for eFMI use-case, replacing the derivative filter with a simplified HPF implementation."

  extends PSSTypeIIParam(       break
      derivativeLag);

  // Tunable start values:
  parameter Real vSI_start = 1.0
    "Default start value for vSI, the PSS input signal.";

  Blocks.WashoutFilter.HPFSimple.HighPassSimple dLHPFreplacement(Kw=Kw, Tw=Tw)
    "HP Filter replacing the derivative lag."
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));

equation
  connect(vSI, dLHPFreplacement.u)
    annotation (Line(points={{-120,0},{-82,0}}, color={0,0,127}));
  connect(dLHPFreplacement.y, lpf.u)
    annotation (Line(points={{-58,0},{-48,0}}, color={0,0,127}));
  annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          radius=0),         Rectangle(
          extent={{-96,96},{96,-96}},
          lineColor={170,255,255},
          lineThickness=1,
          radius=15,
          fillColor={213,255,170},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-98,120},{2,-20}},
          textColor={0,0,255},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="H"),
        Text(
          extent={{-56,54},{76,-82}},
          textColor={0,0,255},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="P"),
        Text(
          extent={{8,14},{108,-126}},
          textColor={0,0,255},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="F")}));
end PSSTypeIISimpleHPF;
