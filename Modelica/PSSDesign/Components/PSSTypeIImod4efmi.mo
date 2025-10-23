within PSSDesign.Components;
model PSSTypeIImod4efmi
  "Extends the PSS Type II in OpenIPSL with parametrization for eFMI use case"
  // Sets parameters for the model and assigns start value
  extends OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII(vSI(start = vSI_start),
    Kw = 9.5,
    T1 = 0.154,
    T2 = 0.033,
    T3 = 1,
    T4 = 1,
    Tw = 1.41,
    vsmax = 0.2,
    vsmin = -0.2);
  // Applies block icon (removing blue background of default model)
  extends Modelica.Blocks.Icons.Block;
  // Provide start value as parameter
  parameter Real vSI_start = 1.0
    "Default start value for vSI, the PSS input signal.";
  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          textColor={0,140,72},
          textString="PSS 4 
efmi Export")}));
end PSSTypeIImod4efmi;
