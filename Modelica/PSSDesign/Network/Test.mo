within PSSDesign.Network;
package Test "Test partial network models"
  extends Modelica.Icons.ExamplesPackage;
  model PartNet "Tests the PartialNetwork model"
    extends PSSDesign.Network.PartialNetwork;
    extends Modelica.Icons.Example;
    Generator.GenPSSDesign G1
      annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  equation
    connect(G1.pwPin, B1.p)
      annotation (Line(points={{-69,0},{-60,0}}, color={0,0,255}));
  end PartNet;

  model PartNet4efmu "Tests the PartialNetwork4efmu model"
    extends PSSDesign.Network.PartialNetwork4efmu;
    extends Modelica.Icons.Example;
    Components.FaultTimerLogic faultTimerLogic(ton=0.5, toff=0.57)
                                               annotation (Placement(
          transformation(
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

  model PartNet4efmuVariant "Tests the PartialNetwork4efmuVariant model"
    extends PSSDesign.Network.PartialNetwork4efmuVariant(L2(opening=1));
    extends Modelica.Icons.Example;
    Modelica.Blocks.Sources.Sine sine(
      amplitude=5,
      f=0.78,
      phase=0,
      continuous=false,
      offset=0,
      startTime=25) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={70,80})));
    Components.FaultTimerLogic faultTimerLogic(ton=0.5, toff=0.57)
                                               annotation (Placement(
          transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={70,-70})));
    Generator.GenPSSDesign G1
      annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
    Modelica.Blocks.Math.Add add annotation (Placement(transformation(
          extent={{-5,-5},{5,5}},
          rotation=270,
          origin={25,69})));
    Modelica.Blocks.Sources.Step step(height=5, startTime=20)
      annotation (Placement(transformation(extent={{-20,70},{0,90}})));
    Components.FaultTimerLogic faultL1(ton=10.5, toff=10.525) annotation (
        Placement(transformation(
          extent={{5,-5},{-5,5}},
          rotation=0,
          origin={39,5})));
    Components.FaultTimerLogic faultL2(ton=15.5, toff=15.525) annotation (
        Placement(transformation(
          extent={{5,-5},{-5,5}},
          rotation=0,
          origin={41,-35})));
  equation
    connect(faultTimerLogic.y, pwFault4efmi.trip)
      annotation (Line(points={{59,-70},{43.3333,-70}}, color={255,0,255}));
    connect(G1.pwPin, B1.p)
      annotation (Line(points={{-69,0},{-60,0}}, color={0,0,255}));
    connect(add.y, load_ExtInput.u) annotation (Line(points={{25,63.5},{25,60},
            {24.5,60},{24.5,58.1}}, color={0,0,127}));
    connect(add.u1, sine.y)
      annotation (Line(points={{28,75},{28,80},{59,80}}, color={0,0,127}));
    connect(step.y, add.u2)
      annotation (Line(points={{1,80},{22,80},{22,75}}, color={0,0,127}));
    connect(faultL1.y, L1.trip)
      annotation (Line(points={{33.5,5},{30,5},{30,14}}, color={255,0,255}));
    connect(faultL2.y, L2.trip) annotation (Line(points={{35.5,-35},{30,-35},{
            30,-26}}, color={255,0,255}));
    annotation (
      experiment(
        StopTime=35,
        Interval=0.0001,
        Tolerance=1e-06,
        __Dymola_Algorithm="Dassl"),
      Diagram(coordinateSystem(grid={2,2})),
      Icon(coordinateSystem(grid={2,2})));
  end PartNet4efmuVariant;
end Test;
