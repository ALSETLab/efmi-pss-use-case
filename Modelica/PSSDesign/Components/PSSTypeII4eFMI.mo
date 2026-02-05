within PSSDesign.Components;
model PSSTypeII4eFMI
  "PSS Type II of OpenIPSL with parametrization for eFMI use-case."

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
    vsmin = -0.2);
  // Block icon removes blue background of default model:
  extends Modelica.Blocks.Icons.Block;

  // Tunable start values:
  parameter Real vSI_start = 1.0
    "Default start value for vSI, the PSS input signal.";

  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          textColor={0,140,72},
          textString="PSS for\neFMI export")}));
end PSSTypeII4eFMI;
