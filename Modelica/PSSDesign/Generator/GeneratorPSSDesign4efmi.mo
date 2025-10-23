within PSSDesign.Generator;
model GeneratorPSSDesign4efmi
  "Generator with AVR and designed PSS modified for efmi export"
  extends PSSDesign.Generator.GeneratorTemplate;
  OpenIPSL.Electrical.Machines.PSAT.Order6 machine(D = 0, M = 7, P_0 = P_0, Q_0 = Q_0, Sn = 2220000000, T1d0 = 8, T1q0 = 1, T2d0 = 0.03, T2q0 = 0.07, Taa = 0.002, V_b = V_b, Vn = 400000, angle_0 = angle_0, ra = 0.003, v_0 = v_0, x1d = 0.3, x1q = 0.65, x2d = 0.23, x2q = 0.25, xd = 1.81, xq = 1.76) annotation(
    Placement(visible = true, transformation(origin = {49, 5}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(K0 = 200, T1 = 1, T2 = 1, Te = 0.0001, Tr = 0.015, vfmax = 7, vfmin = -6.40) annotation(
    Placement(visible = true, transformation(origin = {8, 46}, extent = {{-54, -46}, {-14, -6}}, rotation = 0)));
  Components.PSSTypeIImod4efmi pss(
    Kw=10.8,
    T1=0.278203917593164,
    T2=0.0551479681529786,
    T3=0.278203917593164,
    T4=0.0551479681529786,
    Tw=5.0,
    vsmax=0.2,
    vsmin=-0.2) annotation (Placement(transformation(origin={-41,10}, extent={{-38,
            -10},{-19,10}})));
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
  connect(pss.vs, avr.vs)
    annotation (Line(points={{-59.05,10},{-44.3333,10}}, color={0,0,127}));
  connect(pss.vSI, machine.w) annotation (Line(points={{-80.9,10},{-92,10},{-92,
          -38},{94,-38},{94,32.9},{83.1,32.9}}, color={0,0,127}));
  annotation (Icon(graphics={
        Rectangle(
          extent={{-46,-96},{54,-56}},
          lineColor={95,95,95},
          pattern=LinePattern.None,
          fillColor={100,187,75},
          fillPattern=FillPattern.Solid,
          radius=10),
        Rectangle(
          extent={{-30,-92},{-26,-104}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-20,-92},{-16,-104}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-10,-92},{-6,-104}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{0,-92},{4,-104}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{10,-92},{14,-104}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-30,-48},{-26,-60}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-20,-48},{-16,-60}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-10,-48},{-6,-60}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{0,-48},{4,-60}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{10,-48},{14,-60}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{20,-48},{24,-60}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{30,-48},{34,-60}},
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
          origin={54,-60},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={54,-70},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={54,-80},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={54,-90},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-46,-90},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-46,-80},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-46,-70},
          rotation=90),
        Rectangle(
          extent={{-2,6},{2,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-46,-60},
          rotation=90),
        Rectangle(
          extent={{-38,-90},{44,-62}},
          lineColor={95,95,95},
          pattern=LinePattern.None,
          fillColor={130,238,94},
          fillPattern=FillPattern.Solid,
          radius=10),    Text(
          extent={{-38,-56},{42,-96}},
          lineColor={0,140,72},
          textString="eFMI"),
        Rectangle(
          extent={{10,-92},{14,-104}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{20,-92},{24,-104}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{30,-92},{34,-104}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          radius=10,
          pattern=LinePattern.None,
          lineColor={0,0,0})}));
end GeneratorPSSDesign4efmi;
