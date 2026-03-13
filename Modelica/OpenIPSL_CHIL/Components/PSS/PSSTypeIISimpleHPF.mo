within OpenIPSL_CHIL.Components.PSS;
model PSSTypeIISimpleHPF
  "PSS Type II of OpenIPSL with parametrization for eFMI use-case, replacing the derivative filter with a simplified HPF implementation."

  extends PSSTypeIIParam(       break
      derivativeLag);

  // Block icon removes blue background of default model:
  extends Modelica.Blocks.Icons.Block;

  // Tunable start values:
  parameter Real vSI_start = 1.0
    "Default start value for vSI, the PSS input signal.";

  Blocks.HighPassSimple
            dLHPFreplacement(Kw=Kw, Tw=Tw)
    "HP Filter replacing the derivative lag."
    annotation (Placement(transformation(extent={{-48,-12},{-24,12}})));
  Blocks.LowPass1stOrder lowPass1stOrder(freqHz=freqLow,  K=kLPF)
    annotation (Placement(transformation(extent={{-86,-10},{-66,10}})));

  parameter Real freqLow=15.0
    "Low cutoff frequency (Hz) – attenuates frequencies below this value";
/*  parameter Real freqHigh=60.00
    "High cutoff frequency (Hz) – attenuates frequencies above this value";
*/
  parameter Real kLPF = 1.00 "Low-pass filter gain - attenuate measurement noise";
equation
  connect(dLHPFreplacement.y, imLeadLag.u)
    annotation (Line(points={{-21.6,0},{-12,0}},
                                               color={0,0,127}));
  connect(lowPass1stOrder.u, vSI)
    annotation (Line(points={{-88,0},{-120,0}}, color={0,0,127}));
  connect(lowPass1stOrder.y, dLHPFreplacement.u)
    annotation (Line(points={{-64,0},{-50.4,0}}, color={0,0,127}));
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
