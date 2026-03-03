within OpenIPSL_CHIL.Components.Test.PSS.DerivativeLagWOF;
model TestGenPSS4efmiDLvarClocked
  "Similar to ../TestGenPSSDesign, configured the PSSTypeII4eFMI model with a clocked partition."
  extends Network.PartialNetwork;
  extends Modelica.Icons.Example;
  replaceable Generator.GenPSS4efmiDLvarClocked
                                           G1(displayPF=false)
    constrainedby Generator.GenTemplate
    annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
      choicesAllMatching=true);
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
end TestGenPSS4efmiDLvarClocked;
