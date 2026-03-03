within OpenIPSL_CHIL.Examples.efmiIntegration;
model PSSTypeIIParamAndGrid4efmiExport
  "System model extending from partial network with modifications for efmi export and plant with modified PSS for efmi export. Serves as basis for comparison with experiments."
  extends Modelica.Icons.Example;
  extends Network.RTNetworkMinimal;

  replaceable Generator.PSSTypeIIParam.GenPSSTypeIIParam
                                           G1(displayPF=false) constrainedby
    Generator.GenTemplate
    annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
      choicesAllMatching=true);
  Components.Auxiliary.FaultTimerLogic faultTimerLogic annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={70,-70})));
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
  connect(faultTimerLogic.y, pwFault4efmi.trip)
    annotation (Line(points={{59,-70},{43.3333,-70}}, color={255,0,255}));
end PSSTypeIIParamAndGrid4efmiExport;
