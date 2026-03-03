within OpenIPSL_CHIL.Network.Test;
model PartNet "Tests the PartialNetwork model"
  extends OpenIPSL_CHIL.Network.PartialNetwork;
  extends Modelica.Icons.Example;
  Generator.Design.GenPSSDesign G1
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-69,0},{-60,0}}, color={0,0,255}));
end PartNet;
