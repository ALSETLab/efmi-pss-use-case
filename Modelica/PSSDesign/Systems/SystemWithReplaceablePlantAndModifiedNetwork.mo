within PSSDesign.Systems;
model SystemWithReplaceablePlantAndModifiedNetwork
  "System model extending from partial network with modifications for efmi export"
  extends Modelica.Icons.Example;
  extends Network.PartialNetwork4efmu;

  replaceable Generator.GeneratorPSSDesign4efmi
                                           G1(displayPF=false) constrainedby
    Generator.GeneratorTemplate
    annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
      choicesAllMatching=true);
  Components.FaultTimerLogic faultTimerLogic annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={70,-70})));
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
  connect(pwFault4efmi.trip, faultTimerLogic.y)
    annotation (Line(points={{43.3333,-70},{59,-70}}, color={255,0,255}));
end SystemWithReplaceablePlantAndModifiedNetwork;
