within OpenIPSL_CHIL.Components.Tests.PSS.HighPassFilterWOF;
model PSSTypeIIHPFilter_Clocked
  "Similar to ../TestGenPSSDesign, configured to test PSSTypeII4eFMIwHPFilter with a clocked partition"
  extends Network.PartialNetwork;
  extends Modelica.Icons.Example;
  replaceable Generator.PSSTypeIIHPFilterMSL.GenPSSTypeIIHPFilter_Clocked
                                           G1(displayPF=false)
    constrainedby Generator.GenTemplate
    annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
      choicesAllMatching=true);
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
end PSSTypeIIHPFilter_Clocked;
