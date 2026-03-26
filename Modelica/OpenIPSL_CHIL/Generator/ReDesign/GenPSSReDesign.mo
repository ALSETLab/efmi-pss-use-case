within OpenIPSL_CHIL.Generator.ReDesign;
model GenPSSReDesign
  "Generator with AVR and designed PSS with noise supression filter"
  extends OpenIPSL_CHIL.Generator.GenTemplate;
  Components.PSS.PSSTypeIISimpleHPF               pss                                                                                                                                                   annotation(
    Placement(transformation(origin={-13,0},     extent={{-38,-10},{-19,10}})));
  GenAVRIOReDesign          genAVRIOReDesign
    annotation (Placement(transformation(extent={{20,-20},{60,20}})));
  Modelica.Blocks.Math.Gain wscale(k=pss.wscale)
    annotation (Placement(transformation(extent={{-74,-6},{-62,6}})));
equation
  connect(pss.vs, genAVRIOReDesign.u)
    annotation (Line(points={{-31.05,0},{16,0}}, color={0,0,127}));
  connect(genAVRIOReDesign.pwPin, pwPin)
    annotation (Line(points={{62,0},{110,0}}, color={0,0,255}));
  connect(pss.vSI, wscale.y)
    annotation (Line(points={{-52.9,0},{-61.4,0}}, color={0,0,127}));
  connect(genAVRIOReDesign.w, wscale.u) annotation (Line(points={{62,18},{80,18},
          {80,40},{-90,40},{-90,0},{-75.2,0}}, color={0,0,127}));
end GenPSSReDesign;
