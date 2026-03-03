within OpenIPSL_CHIL.Network.Test;
model PartNet4efmu "Tests the PartialNetwork4efmu model"
  extends OpenIPSL_CHIL.Network.PartialNetwork4efmu;
  extends Modelica.Icons.Example;
  Components.Auxiliary.FaultTimerLogic faultTimerLogic(ton=0.5, toff=0.57)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,-70})));
  Generator.GenPSSDesign G1
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
equation
  connect(faultTimerLogic.y, pwFault4efmi.trip)
    annotation (Line(points={{59,-70},{43.3333,-70}}, color={255,0,255}));
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-69,0},{-60,0}}, color={0,0,255}));
end PartNet4efmu;
