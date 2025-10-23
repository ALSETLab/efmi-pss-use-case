within PSSDesign.FMUs4RTHIL.Archive_SimpleModels4TyphoonSupport;
model SimplePI "Simple PI to test FMU export/import"
  extends Modelica.Blocks.Icons.Block;
  Modelica.Blocks.Continuous.PI PI(
    k=1,
    T=0.1,
    initType=Modelica.Blocks.Types.Init.NoInit)
    annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
  Modelica.Blocks.Interfaces.RealInput u "Connector of Real input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(PI.u, u)
    annotation (Line(points={{-48,0},{-120,0}}, color={0,0,127}));
  connect(PI.y, y) annotation (Line(points={{44,0},{110,0}}, color={0,0,127}));
end SimplePI;
