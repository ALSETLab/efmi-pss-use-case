within OpenIPSL_CHIL.Components.PSS.Blocks.NoiseSupressionFilters;
model PSSCompare
  "Model to compare the PSSTypeIIParam model vs the PSSTypeIISimpleHPF models."
  PSSTypeIISimpleHPF pssHPF
    annotation (Placement(transformation(extent={{-20,-60},{20,-20}})));
  PSSTypeIIParam pssDL
    annotation (Placement(transformation(extent={{-20,40},{20,80}})));
  Modelica.Blocks.Interfaces.RealInput vSI "PSS input signal "
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput vsOUT_pssDL "PSS output signal"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput vsOUT_pssHPF "PSS output signal"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
equation
  connect(pssDL.vSI, vSI) annotation (Line(points={{-24,60},{-90,60},{-90,0},{
          -120,0}}, color={0,0,127}));
  connect(pssHPF.vSI, vSI) annotation (Line(points={{-24,-40},{-90,-40},{-90,0},
          {-120,0}}, color={0,0,127}));
  connect(pssDL.vs, vsOUT_pssDL)
    annotation (Line(points={{22,60},{110,60}}, color={0,0,127}));
  connect(pssHPF.vs, vsOUT_pssHPF)
    annotation (Line(points={{22,-40},{110,-40}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                             Rectangle(extent={{-100,100},{100,-100}},
            lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,100},{100,-100}},
          textColor={0,85,255},
          fontName="Geist",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="PSS
Comp")}),                                                        Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PSSCompare;
