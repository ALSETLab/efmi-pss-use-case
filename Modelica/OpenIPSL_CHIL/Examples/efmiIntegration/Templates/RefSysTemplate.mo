within OpenIPSL_CHIL.Examples.eFMIIntegration.Templates;
model RefSysTemplate "System model extending from partial network"
  extends Network.PartialNetwork;
  extends Modelica.Icons.Example;
  replaceable Generator.Design.GenPSSDesign G1(
                                              displayPF=false) constrainedby
    Generator.GenTemplate
    annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
      choicesAllMatching=true);
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
end RefSysTemplate;
