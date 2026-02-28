within PSSDesign.Components.TestComponents;
model TestRefGenWithPSS
  "Extends partial network model and adds replaceable model configured to test the reference generator configuration with modified machine"
  extends Network.PartialNetwork;
  extends Modelica.Icons.Example;
  replaceable Generator.GeneratorPSSDesign G1(displayPF=false) constrainedby
    Generator.GeneratorTemplate
    annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
      choicesAllMatching=true);
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
end TestRefGenWithPSS;
