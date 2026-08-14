within OpenIPSL_CHIL.Components.Tests.PSS.PSSTypeIISimpleHPF;
model PSSTypeIISimpleHPF_IO "Model for linear analysis"
  extends Modelica.Icons.Example;
  OpenIPSL_CHIL.Components.PSS.PSSTypeIISimpleHPF pss(
    Kw=7.04,
    Tw=2.0,
    T1=0.339913009676242,
    T2=0.0583198524063289,
    T3=0.339913009676242,
    T4=0.0583198524063289)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput vSI "PSS input signal "
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput vs "PSS output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.Gain wscale(k=pss.wscale)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
equation
  connect(pss.vs, vs)
    annotation (Line(points={{11,0},{110,0}}, color={0,0,127}));
  connect(wscale.y, pss.vSI)
    annotation (Line(points={{-29,0},{-12,0}}, color={0,0,127}));
  connect(wscale.u, vSI)
    annotation (Line(points={{-52,0},{-120,0}}, color={0,0,127}));
end PSSTypeIISimpleHPF_IO;
