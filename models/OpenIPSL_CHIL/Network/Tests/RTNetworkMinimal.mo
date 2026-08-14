within OpenIPSL_CHIL.Network.Tests;
model RTNetworkMinimal
  "Tests the partial network model with minimal I/O for RT simulation on an embedded board."
  extends OpenIPSL_CHIL.Network.RTNetworkMinimal;
  extends Modelica.Icons.Example;
  Components.Auxiliary.FaultTimerLogic faultTimerLogic(ton=0.5, toff=0.57)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,-70})));
  Generator.Design.GenPSSDesign G1
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
equation
  connect(faultTimerLogic.y, pwFault4efmi.trip)
    annotation (Line(points={{59,-70},{43.3333,-70}}, color={255,0,255}));
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-69,0},{-60,0}}, color={0,0,255}));
end RTNetworkMinimal;
