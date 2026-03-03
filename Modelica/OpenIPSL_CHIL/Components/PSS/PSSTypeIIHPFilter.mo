within OpenIPSL_CHIL.Components.PSS;
model PSSTypeIIHPFilter
  "PSS Type II of OpenIPSL with parametrization for eFMI use-case, replacing the derivative filter with a high-pass filter."

  extends PSSTypeIIParam(       break
      derivativeLag);

  // Block icon removes blue background of default model:
  extends Modelica.Blocks.Icons.Block;

  // Tunable start values:
  parameter Real vSI_start = 1.0
    "Default start value for vSI, the PSS input signal.";

  Blocks.DerivativeLagHighPass
            dLHPFreplacement(
    order=1,                 Kw=Kw, Tw=Tw)
    "HP Filter replacing the derivative lag."
    annotation (Placement(transformation(extent={{-52,-10},{-32,10}})));
equation
  connect(dLHPFreplacement.u, vSI)
    annotation (Line(points={{-54,0},{-120,0}}, color={0,0,127}));
  connect(dLHPFreplacement.y, imLeadLag.u)
    annotation (Line(points={{-31,0},{-12,0}}, color={0,0,127}));
  annotation (Icon(graphics={Rectangle(
          extent={{-98,98},{98,-98}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,170,213},
          fillPattern=FillPattern.Solid),
                             Text(
          extent={{-100,100},{100,-100}},
          textColor={0,0,255},
          textString="PSS4eFMI 
export
HPF")}));
end PSSTypeIIHPFilter;
