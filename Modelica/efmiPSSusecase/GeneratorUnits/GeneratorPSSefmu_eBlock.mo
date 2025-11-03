within efmiPSSusecase.GeneratorUnits;
model GeneratorPSSefmu_eBlock
  "Plant model that replaces with PSS model refactored for efmi export"
  extends OpenIPSL.Interfaces.Generator;
  replaceable
  PSSDesign.Components.Machines.Order6 machine(D = 0, M = 7, P_0 = P_0, Q_0 = Q_0,
    Sn=2220000000,                                                                                  T1d0 = 8, T1q0 = 1, T2d0 = 0.03, T2q0 = 0.07, Taa = 0.002, V_b = V_b,
    Vn=400000,                                                                                                                                                                         angle_0 = angle_0, ra = 0.003, v_0 = v_0, x1d = 0.3, x1q = 0.65, x2d = 0.23, x2q = 0.25, xd = 1.81, xq = 1.76)
    constrainedby PSSDesign.Components.Machines.Base.baseMachine                                                                                                                                                                                                         annotation(
    Placement(visible = true, transformation(origin = {49, 5}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(K0 = 200, T1 = 1, T2 = 1, Te = 0.0001, Tr = 0.015, vfmax = 7, vfmin = -6.40) annotation(
    Placement(visible = true, transformation(origin = {8, 46}, extent = {{-54, -46}, {-14, -6}}, rotation = 0)));
  'efmuPSS.eFMU_SiL_Support'.BinaryStub           pss(Kw = 10.8, T1 = 0.278203917593164, T2 = 0.0551479681529786, T3 = 0.278203917593164, T4 = 0.0551479681529786, Tw = 5.0, vsmax = 0.2, vsmin = -0.2) annotation(
    Placement(transformation(origin={-46,10},    extent={{-40,-10},{-20,10}})));
equation
  connect(avr.vf, machine.vf) annotation(
    Line(points = {{-4.33333, 20}, {4, 20}, {4, 20.5}, {11.8, 20.5}}, color = {0, 0, 127}));
  connect(machine.p, pwPin) annotation(
    Line(points = {{80, 5}, {110, 5}, {110, 0}}, color = {0, 0, 255}));
  connect(machine.v, avr.v) annotation(
    Line(points={{83.1,14.3},{98,14.3},{98,80},{-70,80},{-70,30},{-44.3333,30}},              color = {0, 0, 127}));
  connect(machine.pm0, machine.pm) annotation(
    Line(points = {{24.2, -29.1}, {24.2, -32}, {-6, -32}, {-6, -10.5}, {11.8, -10.5}}, color = {0, 0, 127}));
  connect(machine.vf0, avr.vf0) annotation(
    Line(points={{24.2,39.1},{24.2,60},{-26,60},{-26,38.3333}},          color = {0, 0, 127}));
  connect(pss.vSI, machine.w) annotation (Line(points={{-88,10},{-116,10},{-116,
          -58},{94,-58},{94,32.9},{83.1,32.9}}, color={0,0,127}));
  connect(pss.vs, avr.vs)
    annotation (Line(points={{-65,10},{-44.3333,10}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{100,100}}, grid={2,
            2})), Icon(coordinateSystem(grid={2,2}), graphics={
        Rectangle(
          extent={{-94,-92},{6,-52}},
          lineColor={95,95,95},
          pattern=LinePattern.None,
          fillColor={100,187,75},
          fillPattern=FillPattern.Solid,
          radius=10),
        Rectangle(
          extent={{-78,-88},{-74,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-68,-88},{-64,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-58,-88},{-54,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-48,-88},{-44,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-38,-88},{-34,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-78,-44},{-74,-56}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-68,-44},{-64,-56}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-58,-44},{-54,-56}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-48,-44},{-44,-56}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-38,-44},{-34,-56}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-28,-44},{-24,-56}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-18,-44},{-14,-56}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={6,-56},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={6,-66},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={6,-76},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={6,-86},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-94,-86},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-94,-76},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-94,-66},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-94,-56},
          rotation=90),
        Rectangle(
          extent={{-86,-86},{-4,-58}},
          lineColor={95,95,95},
          pattern=LinePattern.None,
          fillColor={130,238,94},
          fillPattern=FillPattern.Solid,
          radius=10),    Text(
          extent={{-86,-52},{-6,-92}},
          lineColor={0,140,72},
          textString="eFMI"),
        Rectangle(
          extent={{-38,-88},{-34,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-28,-88},{-24,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-18,-88},{-14,-100}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
      Polygon(
        origin={2.102,3.218},
        rotation = -45.0,
        fillColor = {255,255,255},
        fillPattern = FillPattern.Solid,
        points = {{-15.0,87.273},{15.0,87.273},{20.0,82.273},{20.0,27.273},
          {10.0,17.273},{10.0,7.273},{20.0,2.273},{20.0,-2.727},{5.0,-2.727},
          {5.0,-77.727},{10.0,-87.727},{5.0,-112.727},{-5.0,-112.727},
          {-10.0,-87.727},{-5.0,-77.727},{-5.0,-2.727},{-20.0,-2.727},
          {-20.0,2.273},{-10.0,7.273},{-10.0,17.273},{-20.0,27.273},
          {-20.0,82.273}}),
      Polygon(
        origin={-6.617,-6.142},
        rotation = 45.0,
        fillColor = {64,64,64},
        pattern = LinePattern.None,
        fillPattern = FillPattern.Solid,
        points = {{-15.0,93.333},{-15.0,68.333},{0.0,58.333},{15.0,68.333},
          {15.0,93.333},{20.0,93.333},{25.0,83.333},{25.0,58.333},{10.0,43.333},
          {10.0,-41.667},{25.0,-56.667},{25.0,-76.667},{10.0,-91.667},
          {0.0,-91.667},{0.0,-81.667},{5.0,-81.667},{15.0,-71.667},
          {15.0,-61.667},{5.0,-51.667},{-5.0,-51.667},{-15.0,-61.667},
          {-15.0,-71.667},{-5.0,-81.667},{0.0,-81.667},{0.0,-91.667},
          {-10.0,-91.667},{-25.0,-76.667},{-25.0,-56.667},{-10.0,-41.667},
          {-10.0,43.333},{-25.0,58.333},{-25.0,83.333},{-20.0,93.333}})}));
end GeneratorPSSefmu_eBlock;
