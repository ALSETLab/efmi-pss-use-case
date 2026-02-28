within PSSDesign.Components.TestComponents;
model TestRefGenWithPSS4efmiExportClocked
  "Similar to *.TestRefGenWithPSS, configured with plant variant configured to test Components.PSSTypeII4eFMI with a clocked partition"
  extends Network.PartialNetwork;
  extends Modelica.Icons.Example;
  replaceable Generator.GeneratorPSSefmuVariantClocked
                                           G1(displayPF=false) constrainedby
    Generator.GeneratorTemplate
    annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
      choicesAllMatching=true);
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
end TestRefGenWithPSS4efmiExportClocked;
