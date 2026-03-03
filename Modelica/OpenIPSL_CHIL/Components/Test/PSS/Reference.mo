within OpenIPSL_CHIL.Components.Test.PSS;
model Reference
  "Extends partial network model and adds replaceable model configured to test the plant with modified machine and using designed PSS parameters. Uses OpenIPSL original PSS."
  extends Network.PartialNetwork;
  extends Modelica.Icons.Example;
  replaceable Generator.GenPSSDesign       G1(displayPF=false) constrainedby
    Generator.GenTemplate
    annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
      choicesAllMatching=true);
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
end Reference;
