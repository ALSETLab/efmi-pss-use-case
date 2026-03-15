within OpenIPSL_CHIL.Generator.ReDesign;
model GenPSSReDesign
  "Generator with AVR and designed PSS with noise supression filter"
  extends OpenIPSL_CHIL.Generator.GenTemplate;
  Components.PSS.PSSTypeIISimpleHPF               pss(
    Kw=15.5,
    T1=0.32417874258802,
    T2=0.0556202789619914,
    T3=0.32417874258802,
    T4=0.0556202789619914,                                                                                                                                         Tw = 5.0,
    vsmax=1.5,
    vsmin=-1.5)                                                                                                                                                                                         annotation(
    Placement(transformation(origin={-13,0},     extent={{-38,-10},{-19,10}})));
  GenAVRIOReDesign          genAVRIOReDesign
    annotation (Placement(transformation(extent={{20,-20},{60,20}})));
equation
  connect(pss.vs, genAVRIOReDesign.u)
    annotation (Line(points={{-31.05,0},{16,0}}, color={0,0,127}));
  connect(pss.vSI, genAVRIOReDesign.w) annotation (Line(points={{-52.9,0},{-80,
          0},{-80,40},{80,40},{80,18},{62,18}}, color={0,0,127}));
  connect(genAVRIOReDesign.pwPin, pwPin)
    annotation (Line(points={{62,0},{110,0}}, color={0,0,255}));
end GenPSSReDesign;
