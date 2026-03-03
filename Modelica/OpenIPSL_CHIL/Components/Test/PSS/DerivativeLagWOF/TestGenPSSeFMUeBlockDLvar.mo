within OpenIPSL_CHIL.Components.Test.PSS.DerivativeLagWOF;
model TestGenPSSeFMUeBlockDLvar
  "Similar to ../TestGenPSSDesign, configured to test the PSSTypeII4eFMI binary stub."
  extends Network.PartialNetwork;
  extends Modelica.Icons.Example;
  replaceable Generator.GenPSSeFMUeBlockDLvar
                                           G1(displayPF=false)
    constrainedby Generator.GenTemplate
    annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
      choicesAllMatching=true);
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
end TestGenPSSeFMUeBlockDLvar;
