within PSSDesign.Systems;
model ReferenceSystemWitPSS "Reference model with PSS"
  extends PSSDesign.Network.PartialNetwork;
  extends Modelica.Icons.Example;

  PSSDesign.Generator.GeneratorAVR G1
                                annotation (Placement(visible=true,
        transformation(
        origin={-80,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-69,0},{-60,0}}, color={0,0,255}));
end ReferenceSystemWitPSS;
