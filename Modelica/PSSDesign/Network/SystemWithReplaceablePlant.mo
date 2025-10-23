within PSSDesign.Network;
model SystemWithReplaceablePlant "System model extending from partial network"
  extends PartialNetwork;
  replaceable Generator.GeneratorPSSDesign G1 constrainedby
    Generator.GeneratorTemplate
    annotation (Placement(transformation(extent={{-94,-10},{-74,10}})));
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
end SystemWithReplaceablePlant;
