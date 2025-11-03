within PSSDesign.eFMUs4RTHIL.Archive_SimpleModels4TyphoonSupport;
model GridForHilTestingReIO
  "Adds conversion from real-to boolean to GridForHilTesting model to attempt to resolve fmu import issues in Typhoon hil"

  GridForHILTesting gridForHILTesting
    annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
  Modelica.Blocks.Interfaces.RealInput vf "Field voltage"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput vf0OUT "Initial field voltage [pu]"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,110})));
  Modelica.Blocks.Interfaces.RealOutput w "Speed [pu]"
    annotation (Placement(transformation(extent={{100,70},{120,90}})));
  Modelica.Blocks.Interfaces.RealOutput v "Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput Pgen "Active power [pu]"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput Qgen "Reactive power [pu]"
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-72})));
  Modelica.Blocks.Interfaces.RealInput u1
                                "Connector of Real input signal" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
equation
  connect(gridForHILTesting.vf, vf)
    annotation (Line(points={{-48,0},{-120,0}}, color={0,0,127}));
  connect(gridForHILTesting.vf0OUT, vf0OUT) annotation (Line(points={{-32,44},{
          -34,44},{-34,72},{-80,72},{-80,110}}, color={0,0,127}));
  connect(gridForHILTesting.w, w) annotation (Line(points={{44,32},{58,32},{58,
          80},{110,80}}, color={0,0,127}));
  connect(gridForHILTesting.v, v) annotation (Line(points={{44,24},{80,24},{80,
          60},{110,60}}, color={0,0,127}));
  connect(gridForHILTesting.Pgen, Pgen) annotation (Line(points={{44,16},{88,16},
          {88,40},{110,40}}, color={0,0,127}));
  connect(gridForHILTesting.Qgen, Qgen) annotation (Line(points={{44,8},{94,8},
          {94,20},{110,20}}, color={0,0,127}));
  connect(realToBoolean.y, gridForHILTesting.fault)
    annotation (Line(points={{0,-61},{0,-48}}, color={255,0,255}));
  connect(realToBoolean.u, u1)
    annotation (Line(points={{0,-84},{0,-120}}, color={0,0,127}));
end GridForHilTestingReIO;
