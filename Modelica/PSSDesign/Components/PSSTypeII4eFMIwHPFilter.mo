within PSSDesign.Components;
model PSSTypeII4eFMIwHPFilter
  "PSS Type II of OpenIPSL with parametrization for eFMI use-case, replacing the derivative filter with a high-pass filter."

  extends OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII(
    vSI(
      final start = vSI_start),
    Kw = 9.5,
    T1 = 0.154,
    T2 = 0.033,
    T3 = 1,
    T4 = 1,
    Tw = 1.41,
    vsmax = 0.2,
    vsmin = -0.2,
    break derivativeLag
                );
  // Block icon removes blue background of default model:
  extends Modelica.Blocks.Icons.Block;

  // Tunable start values:
  parameter Real vSI_start = 1.0
    "Default start value for vSI, the PSS input signal.";

  PSSBlocks.DLHPF dLHPFreplacement "HP Filter replacing the derivative lag."
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(dLHPFreplacement.u, vSI)
    annotation (Line(points={{-62,0},{-120,0}}, color={0,0,127}));
  connect(dLHPFreplacement.y, imLeadLag.u)
    annotation (Line(points={{-39,0},{-12,0}}, color={0,0,127}));
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
end PSSTypeII4eFMIwHPFilter;
