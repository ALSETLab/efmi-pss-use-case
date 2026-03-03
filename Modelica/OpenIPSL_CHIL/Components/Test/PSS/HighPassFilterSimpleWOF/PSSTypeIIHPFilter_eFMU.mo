within OpenIPSL_CHIL.Components.Test.PSS.HighPassFilterSimpleWOF;
model PSSTypeIIHPFilter_eFMU
  "Similar to ../TestGenPSSDesign, configured to test the PSSTypeII4eFMIwHPFilter binary stub."
  extends Network.PartialNetwork;
  extends Modelica.Icons.Example;
  replaceable Generator.PSSTypeIIHPFilterSimple.GenPSSTypeIISimpleHPF_eFMU
                                           G1(displayPF=false)
    constrainedby Generator.GenTemplate
    annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
      choicesAllMatching=true);
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
  annotation (Diagram(graphics={
                           Text(
          extent={{-96,-22},{-10,-70}},
          textColor={238,46,47},
          textString="Needs to be 
replaced with 
corresponding 
binary stub!"), Rectangle(
          extent={{-48,-74},{-14,-84}},
          lineColor={28,108,200},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid)}));
end PSSTypeIIHPFilter_eFMU;
