within PSSDesign.FMUs4RTHIL;
model TestGridForHILReIO "Tests the model for HIL testing"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Step step(
    height=0.05,
    offset=0,
    startTime=5)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  GridForHilTestingReIO        G4HIL
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Pulse
                             pulse(
    amplitude=1,
    period=0.07,
    nperiod=1,
    startTime=0.5)                           annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,-70})));
  Modelica.Blocks.Interfaces.RealOutput w "Speed [pu]"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput v "Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput Pgen "Active power [pu]"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput Qgen "Reactive power [pu]"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
  Modelica.Blocks.Interfaces.RealOutput vf0OUT1
                                               "Initial field voltage [pu]"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,108})));
equation
  connect(G4HIL.w, w)
    annotation (Line(points={{22,16},{22,60},{110,60}}, color={0,0,127}));
  connect(G4HIL.v, v) annotation (Line(points={{22,12},{96,12},{96,40},{110,40}},
        color={0,0,127}));
  connect(G4HIL.Pgen, Pgen)
    annotation (Line(points={{22,8},{94,8},{94,0},{110,0}}, color={0,0,127}));
  connect(G4HIL.Qgen, Qgen) annotation (Line(points={{22,4},{90,4},{90,-40},{
          110,-40}}, color={0,0,127}));
  connect(step.y, G4HIL.vf)
    annotation (Line(points={{-79,0},{-24,0}}, color={0,0,127}));
  connect(pulse.y, G4HIL.u1)
    annotation (Line(points={{-79,-70},{0,-70},{0,-24}}, color={0,0,127}));
  connect(G4HIL.vf0OUT, vf0OUT1) annotation (Line(points={{-16,22},{-16,80},{
          -60,80},{-60,108}}, color={0,0,127}));
end TestGridForHILReIO;
