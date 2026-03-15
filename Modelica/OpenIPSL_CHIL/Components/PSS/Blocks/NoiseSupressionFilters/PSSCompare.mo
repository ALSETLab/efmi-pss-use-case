within OpenIPSL_CHIL.Components.PSS.Blocks.NoiseSupressionFilters;
model PSSCompare
  "Model to compare the PSSTypeIIParam model vs the PSSTypeIISimpleHPF models."
  PSSTypeIISimpleHPF pssHPF
    annotation (Placement(transformation(extent={{-20,-80},{20,-40}})));
  PSSTypeIIParam pssDL
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealInput vSI "PSS input signal "
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput vsOUT_pssDL "PSS output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput vsOUT_pssHPF "PSS output signal"
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
  OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(
    Kw=10.8,
    T1=0,
    T2=0,
    T3=0,
    T4=0,
    Tw=5.0,
    vsmax=1.5,
    vsmin=-1.5)                                                                                                                                                                                         annotation(
    Placement(transformation(origin={60,60},     extent={{-80,-20},{-40,20}})));
  Modelica.Blocks.Interfaces.RealOutput vsOUT_original "PSS output signal"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
equation
  connect(pssDL.vSI, vSI) annotation (Line(points={{-24,0},{-120,0}},
                    color={0,0,127}));
  connect(pssHPF.vSI, vSI) annotation (Line(points={{-24,-60},{-90,-60},{-90,0},
          {-120,0}}, color={0,0,127}));
  connect(pssDL.vs, vsOUT_pssDL)
    annotation (Line(points={{22,0},{110,0}},   color={0,0,127}));
  connect(pssHPF.vs, vsOUT_pssHPF)
    annotation (Line(points={{22,-60},{110,-60}}, color={0,0,127}));
  connect(pss.vSI, vSI) annotation (Line(points={{-24,60},{-90,60},{-90,0},{
          -120,0}}, color={0,0,127}));
  connect(pss.vs, vsOUT_original)
    annotation (Line(points={{22,60},{110,60}}, color={0,0,127}));
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
