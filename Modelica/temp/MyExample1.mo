package MyExample1
  extends Modelica.Icons.ExamplesPackage;

  package Generator
    extends Modelica.Icons.Package;

    model Generator
      extends OpenIPSL.Interfaces.Generator;
      OpenIPSL.Electrical.Machines.PSAT.Order6 machine(D = 0, M = 7, P_0 = P_0, Q_0 = Q_0, Sn = 2220000000, T1d0 = 8, T1q0 = 1, T2d0 = 0.03, T2q0 = 0.07, Taa = 0.002, V_b = V_b, Vn = 400000, angle_0 = angle_0, ra = 0.003, v_0 = v_0, x1d = 0.3, x1q = 0.65, x2d = 0.23, x2q = 0.25, xd = 1.81, xq = 1.76) annotation(
        Placement(visible = true, transformation(origin = {49, 5}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(K0 = 200, T1 = 1, T2 = 1, Te = 0.0001, Tr = 0.015, vfmax = 7, vfmin = -6.40) annotation(
        Placement(visible = true, transformation(origin = {8, 46}, extent = {{-54, -46}, {-14, -6}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant pss_off(k = 0) annotation(
        Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(avr.vf, machine.vf) annotation(
        Line(points = {{-4.33333, 20}, {4, 20}, {4, 20.5}, {11.8, 20.5}}, color = {0, 0, 127}));
      connect(machine.p, pwPin) annotation(
        Line(points = {{80, 5}, {110, 5}, {110, 0}}, color = {0, 0, 255}));
      connect(machine.v, avr.v) annotation(
        Line(points = {{83.1, 14.3}, {98, 14.3}, {98, 80}, {-70, 80}, {-70, 30}, {-44.3333, 30}}, color = {0, 0, 127}));
      connect(machine.pm0, machine.pm) annotation(
        Line(points = {{24.2, -29.1}, {24.2, -32}, {-6, -32}, {-6, -10.5}, {11.8, -10.5}}, color = {0, 0, 127}));
      connect(pss_off.y, avr.vs) annotation(
        Line(points = {{-59, 10}, {-44.3333, 10}}, color = {0, 0, 127}));
      connect(machine.vf0, avr.vf0) annotation(
        Line(points = {{24.2, 39.1}, {24.2, 60}, {-26, 60}, {-26, 38.3333}}, color = {0, 0, 127}));
    end Generator;

    model GeneratorEM
      extends OpenIPSL.Interfaces.Generator;
      OpenIPSL.Electrical.Machines.PSAT.Order6 machine(D = 0, M = 7, P_0 = P_0, Q_0 = Q_0, Sn = 2220000000, T1d0 = 8, T1q0 = 1, T2d0 = 0.03, T2q0 = 0.07, Taa = 0.002, V_b = V_b, Vn = 400000, angle_0 = angle_0, ra = 0.003, v_0 = v_0, x1d = 0.3, x1q = 0.65, x2d = 0.23, x2q = 0.25, xd = 1.81, xq = 1.76) annotation(
        Placement(visible = true, transformation(origin = {49, 5}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
    equation
      connect(machine.p, pwPin) annotation(
        Line(points = {{80, 5}, {110, 5}, {110, 0}}, color = {0, 0, 255}));
      connect(machine.pm0, machine.pm) annotation(
        Line(points = {{24.2, -29.1}, {24.2, -32}, {-6, -32}, {-6, -10.5}, {11.8, -10.5}}, color = {0, 0, 127}));
      connect(machine.vf0, machine.vf) annotation(
        Line(points = {{24, 40}, {24, 48}, {-4, 48}, {-4, 20}, {12, 20}}, color = {0, 0, 127}));
    end GeneratorEM;

    model GeneratorPSS
      extends OpenIPSL.Interfaces.Generator;
      OpenIPSL.Electrical.Machines.PSAT.Order6 machine(D = 0, M = 7, P_0 = P_0, Q_0 = Q_0, Sn = 2220000000, T1d0 = 8, T1q0 = 1, T2d0 = 0.03, T2q0 = 0.07, Taa = 0.002, V_b = V_b, Vn = 400000, angle_0 = angle_0, ra = 0.003, v_0 = v_0, x1d = 0.3, x1q = 0.65, x2d = 0.23, x2q = 0.25, xd = 1.81, xq = 1.76) annotation(
        Placement(visible = true, transformation(origin = {49, 5}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(K0 = 200, T1 = 1, T2 = 1, Te = 0.0001, Tr = 0.015, vfmax = 7, vfmin = -6.40) annotation(
        Placement(visible = true, transformation(origin = {8, 46}, extent = {{-54, -46}, {-14, -6}}, rotation = 0)));
      OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(Kw = 9.5, T1 = 0.154, T2 = 0.033, T3 = 1, T4 = 1, Tw = 1.41, vsmax = 0.2, vsmin = -0.2) annotation(
        Placement(transformation(origin = {-43, 10}, extent = {{-40, -10}, {-20, 10}})));
    equation
      connect(avr.vf, machine.vf) annotation(
        Line(points = {{-4.33333, 20}, {4, 20}, {4, 20.5}, {11.8, 20.5}}, color = {0, 0, 127}));
      connect(machine.p, pwPin) annotation(
        Line(points = {{80, 5}, {110, 5}, {110, 0}}, color = {0, 0, 255}));
      connect(machine.v, avr.v) annotation(
        Line(points = {{83.1, 14.3}, {98, 14.3}, {98, 80}, {-70, 80}, {-70, 30}, {-44.3333, 30}}, color = {0, 0, 127}));
      connect(machine.pm0, machine.pm) annotation(
        Line(points = {{24.2, -29.1}, {24.2, -32}, {-6, -32}, {-6, -10.5}, {11.8, -10.5}}, color = {0, 0, 127}));
      connect(machine.vf0, avr.vf0) annotation(
        Line(points = {{24.2, 39.1}, {24.2, 60}, {-26, 60}, {-26, 38.3333}}, color = {0, 0, 127}));
      connect(pss.vs, avr.vs) annotation(
        Line(points = {{-62, 10}, {-44, 10}}, color = {0, 0, 127}));
      connect(machine.w, pss.vSI) annotation(
        Line(points = {{84, 32}, {94, 32}, {94, -42}, {-94, -42}, {-94, 10}, {-84, 10}}, color = {0, 0, 127}));
    end GeneratorPSS;

    model GeneratorAVRIO
      extends OpenIPSL.Interfaces.Generator;
      OpenIPSL.Electrical.Machines.PSAT.Order6 machine(D = 0, M = 7, P_0 = P_0, Q_0 = Q_0, Sn = 2220000000, T1d0 = 8, T1q0 = 1, T2d0 = 0.03, T2q0 = 0.07, Taa = 0.002, V_b = V_b, Vn = 400000, angle_0 = angle_0, ra = 0.003, v_0 = v_0, x1d = 0.3, x1q = 0.65, x2d = 0.23, x2q = 0.25, xd = 1.81, xq = 1.76) annotation(
        Placement(visible = true, transformation(origin = {49, 5}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(K0 = 200, T1 = 1, T2 = 1, Te = 0.0001, Tr = 0.015, vfmax = 7, vfmin = -6.40) annotation(
        Placement(visible = true, transformation(origin = {8, 46}, extent = {{-54, -46}, {-14, -6}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u annotation(
        Placement(transformation(origin = {-120, 10}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}})));
      Modelica.Blocks.Interfaces.RealOutput w annotation(
        Placement(transformation(origin = {114, 34}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}})));
    equation
      connect(avr.vf, machine.vf) annotation(
        Line(points = {{-4.33333, 20}, {4, 20}, {4, 20.5}, {11.8, 20.5}}, color = {0, 0, 127}));
      connect(machine.p, pwPin) annotation(
        Line(points = {{80, 5}, {110, 5}, {110, 0}}, color = {0, 0, 255}));
      connect(machine.v, avr.v) annotation(
        Line(points = {{83.1, 14.3}, {98, 14.3}, {98, 80}, {-70, 80}, {-70, 30}, {-44.3333, 30}}, color = {0, 0, 127}));
      connect(machine.pm0, machine.pm) annotation(
        Line(points = {{24.2, -29.1}, {24.2, -32}, {-6, -32}, {-6, -10.5}, {11.8, -10.5}}, color = {0, 0, 127}));
      connect(machine.vf0, avr.vf0) annotation(
        Line(points = {{24.2, 39.1}, {24.2, 60}, {-26, 60}, {-26, 38.3333}}, color = {0, 0, 127}));
      connect(u, avr.vs) annotation(
        Line(points = {{-120, 10}, {-44, 10}}, color = {0, 0, 127}));
      connect(machine.w, w) annotation(
        Line(points = {{84, 32}, {96, 32}, {96, 34}, {114, 34}}, color = {0, 0, 127}));
    end GeneratorAVRIO;

    model GeneratorPSSDesign
      extends OpenIPSL.Interfaces.Generator;
      OpenIPSL.Electrical.Machines.PSAT.Order6 machine(D = 0, M = 7, P_0 = P_0, Q_0 = Q_0, Sn = 2220000000, T1d0 = 8, T1q0 = 1, T2d0 = 0.03, T2q0 = 0.07, Taa = 0.002, V_b = V_b, Vn = 400000, angle_0 = angle_0, ra = 0.003, v_0 = v_0, x1d = 0.3, x1q = 0.65, x2d = 0.23, x2q = 0.25, xd = 1.81, xq = 1.76) annotation(
        Placement(visible = true, transformation(origin = {49, 5}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(K0 = 200, T1 = 1, T2 = 1, Te = 0.0001, Tr = 0.015, vfmax = 7, vfmin = -6.40) annotation(
        Placement(visible = true, transformation(origin = {8, 46}, extent = {{-54, -46}, {-14, -6}}, rotation = 0)));
      OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(Kw = 10.8, T1 = 0.278203917593164, T2 = 0.0551479681529786, T3 = 0.278203917593164, T4 = 0.0551479681529786, Tw = 5.0, vsmax = 0.2, vsmin = -0.2) annotation(
        Placement(transformation(origin = {-43, 10}, extent = {{-40, -10}, {-20, 10}})));
    equation
      connect(avr.vf, machine.vf) annotation(
        Line(points = {{-4.33333, 20}, {4, 20}, {4, 20.5}, {11.8, 20.5}}, color = {0, 0, 127}));
      connect(machine.p, pwPin) annotation(
        Line(points = {{80, 5}, {110, 5}, {110, 0}}, color = {0, 0, 255}));
      connect(machine.v, avr.v) annotation(
        Line(points = {{83.1, 14.3}, {98, 14.3}, {98, 80}, {-70, 80}, {-70, 30}, {-44.3333, 30}}, color = {0, 0, 127}));
      connect(machine.pm0, machine.pm) annotation(
        Line(points = {{24.2, -29.1}, {24.2, -32}, {-6, -32}, {-6, -10.5}, {11.8, -10.5}}, color = {0, 0, 127}));
      connect(machine.vf0, avr.vf0) annotation(
        Line(points = {{24.2, 39.1}, {24.2, 60}, {-26, 60}, {-26, 38.3333}}, color = {0, 0, 127}));
      connect(pss.vs, avr.vs) annotation(
        Line(points = {{-62, 10}, {-44, 10}}, color = {0, 0, 127}));
      connect(machine.w, pss.vSI) annotation(
        Line(points = {{84, 32}, {94, 32}, {94, -42}, {-94, -42}, {-94, 10}, {-84, 10}}, color = {0, 0, 127}));
    end GeneratorPSSDesign;
  equation

  public
    model GeneratorEMClassical
      extends OpenIPSL.Interfaces.Generator;
      OpenIPSL.Electrical.Machines.PSAT.Order2 machine(D = 0, M = 7, P_0 = P_0, Q_0 = Q_0, Sn = 2220000000, V_b = V_b, Vn = 400000, angle_0 = angle_0, ra = 0, v_0 = v_0, x1d = 0.3) annotation(
        Placement(visible = true, transformation(origin = {49, 5}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
    equation
      connect(machine.p, pwPin) annotation(
        Line(points = {{80, 5}, {110, 5}, {110, 0}}, color = {0, 0, 255}));
      connect(machine.pm0, machine.pm) annotation(
        Line(points = {{24.2, -29.1}, {24.2, -32}, {-6, -32}, {-6, -10.5}, {11.8, -10.5}}, color = {0, 0, 127}));
      connect(machine.vf0, machine.vf) annotation(
        Line(points = {{24, 40}, {24, 48}, {-4, 48}, {-4, 20}, {12, 20}}, color = {0, 0, 127}));
    end GeneratorEMClassical;
  end Generator;

  package Network
    extends Modelica.Icons.Package;

    model Example_1_buses
      OpenIPSL.Electrical.Buses.Bus B1 annotation(
        Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Buses.Bus B2 annotation(
        Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Buses.Bus B3 annotation(
        Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      MyExample1.Generator.Generator G1 annotation(
        Placement(visible = true, transformation(origin = {-72, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
        Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-30, -10}, {30, 10}}, rotation = 0)));
    equation

    end Example_1_buses;

    model Example_1_branches
      OpenIPSL.Electrical.Buses.Bus B1 annotation(
        Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Buses.Bus B2 annotation(
        Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Buses.Bus B3 annotation(
        Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      MyExample1.Generator.Generator G1 annotation(
        Placement(visible = true, transformation(origin = {-72, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
        Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-30, -10}, {30, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
        Placement(visible = true, transformation(origin = {32, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.5*100/2220) annotation(
        Placement(visible = true, transformation(origin = {20, 0}, extent = {{20, 10}, {40, 30}}, rotation = 0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.93*100/2220) annotation(
        Placement(visible = true, transformation(origin = {20, 0}, extent = {{20, -30}, {40, -10}}, rotation = 0)));
    end Example_1_branches;

    model Example_1_g1_parametrization
      OpenIPSL.Electrical.Buses.Bus B1 annotation(
        Placement(transformation(origin = {-60, -1}, extent = {{-10, -10}, {10, 10}})));
      OpenIPSL.Electrical.Buses.Bus B2 annotation(
        Placement(transformation(origin = {0, -1}, extent = {{-10, -10}, {10, 10}})));
      OpenIPSL.Electrical.Buses.Bus B3 annotation(
        Placement(transformation(origin = {60, -1}, extent = {{-10, -10}, {10, 10}})));
      MyExample1.Generator.Generator G1 annotation(
        Placement(transformation(origin = {-80, -1}, extent = {{-10, -10}, {10, 10}})));
      inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
        Placement(transformation(origin = {-70, -31}, extent = {{-30, -10}, {30, 10}})));
      OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
        Placement(transformation(origin = {12, -1}, extent = {{-50, -10}, {-30, 10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.5*100/2220) annotation(
        Placement(transformation(origin = {0, -1}, extent = {{20, 10}, {40, 30}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.93*100/2220) annotation(
        Placement(transformation(origin = {0, -1}, extent = {{20, -30}, {40, -10}})));
    equation

    end Example_1_g1_parametrization;

    model Example_1_addinfbus
      OpenIPSL.Electrical.Buses.Bus B1 annotation(
        Placement(transformation(origin = {-60, -1}, extent = {{-10, -10}, {10, 10}})));
      OpenIPSL.Electrical.Buses.Bus B2 annotation(
        Placement(transformation(origin = {0, -1}, extent = {{-10, -10}, {10, 10}})));
      OpenIPSL.Electrical.Buses.Bus B3 annotation(
        Placement(transformation(origin = {60, -1}, extent = {{-10, -10}, {10, 10}})));
      MyExample1.Generator.Generator G1 annotation(
        Placement(transformation(origin = {-80, -1}, extent = {{-10, -10}, {10, 10}})));
      inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
        Placement(transformation(origin = {-70, -31}, extent = {{-30, -10}, {30, 10}})));
      OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
        Placement(transformation(origin = {12, -1}, extent = {{-50, -10}, {-30, 10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.5*100/2220) annotation(
        Placement(transformation(origin = {0, -1}, extent = {{20, 10}, {40, 30}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.93*100/2220) annotation(
        Placement(transformation(origin = {0, -1}, extent = {{20, -30}, {40, -10}})));
      OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus annotation(
        Placement(transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    equation

    end Example_1_addinfbus;

    model Example_1_infbus_v0angle0data
      OpenIPSL.Electrical.Buses.Bus B1 annotation(
        Placement(transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}})));
      OpenIPSL.Electrical.Buses.Bus B2 annotation(
        Placement(transformation(extent = {{-10, -10}, {10, 10}})));
      OpenIPSL.Electrical.Buses.Bus B3 annotation(
        Placement(transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}})));
      MyExample1.Generator.Generator G1 annotation(
        Placement(transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}})));
      inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
        Placement(transformation(origin = {-70, -30}, extent = {{-30, -10}, {30, 10}})));
      OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
        Placement(transformation(origin = {12, 0}, extent = {{-50, -10}, {-30, 10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.5*100/2220) annotation(
        Placement(transformation(extent = {{20, 10}, {40, 30}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.93*100/2220) annotation(
        Placement(transformation(extent = {{20, -30}, {40, -10}})));
      OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(v_0 = 0.90081, angle_0 = 0) annotation(
        Placement(transformation(origin = {90, 1}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    equation

    end Example_1_infbus_v0angle0data;

    model Example_1_infbus
      OpenIPSL.Electrical.Buses.Bus B1 annotation(
        Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Buses.Bus B2 annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Buses.Bus B3 annotation(
        Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      MyExample1.Generator.Generator G1 annotation(
        Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
        Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-30, -10}, {30, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
        Placement(visible = true, transformation(origin = {12, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.5*100/2220) annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, 10}, {40, 30}}, rotation = 0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.93*100/2220) annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -30}, {40, -10}}, rotation = 0)));
      OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(angle_0 = 0, v_0 = 0.90081, P_0 = -1998.0e6, Q_0 = 87.066e6) annotation(
        Placement(transformation(origin = {91, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    end Example_1_infbus;

    model Example_1_fault
      OpenIPSL.Electrical.Buses.Bus B1 annotation(
        Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Buses.Bus B2 annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Buses.Bus B3 annotation(
        Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      MyExample1.Generator.Generator G1 annotation(
        Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
        Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-30, -10}, {30, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
        Placement(visible = true, transformation(origin = {12, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.5*100/2220) annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, 10}, {40, 30}}, rotation = 0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.93*100/2220) annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -30}, {40, -10}}, rotation = 0)));
      OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(P_0 = -1998000000, Q_0 = 87066000, angle_0 = 0, v_0 = 0.90081) annotation(
        Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
      OpenIPSL.Electrical.Events.PwFault pwFault(R = 0, X = 0.01*100/2220, t1 = 0.5, t2 = 0.57) annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -60}, {40, -40}}, rotation = 0)));
    end Example_1_fault;

    model Example_1_final
      OpenIPSL.Electrical.Buses.Bus B1 annotation(
        Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Buses.Bus B2 annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Buses.Bus B3 annotation(
        Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      MyExample1.Generator.Generator G1(P_0 = 1997999999.99364, Q_0 = 967924969.9065781, angle_0 = 0.4946771769891539) annotation(
        Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
        Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-30, -10}, {30, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
        Placement(visible = true, transformation(origin = {12, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.5*100/2220) annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, 10}, {40, 30}}, rotation = 0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b(displayUnit = "V.A") = 100000000, X = 0.93*100/2220) annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -30}, {40, -10}}, rotation = 0)));
      OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(P_0 = -1998000000, Q_0 = 87066000, angle_0 = 0, v_0 = 0.90081) annotation(
        Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
      OpenIPSL.Electrical.Events.PwFault pwFault(R = 0, X = 0.01*100/2220, t1 = 0.5, t2 = 0.57) annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -60}, {40, -40}}, rotation = 0)));
    equation
      connect(G1.pwPin, B1.p) annotation(
        Line(points = {{-69, 0}, {-60, 0}}, color = {0, 0, 255}));
      connect(B1.p, transformer.p) annotation(
        Line(points = {{-60, 0}, {-39, 0}}, color = {0, 0, 255}));
      connect(transformer.n, B2.p) annotation(
        Line(points = {{-17, 0}, {0, 0}}, color = {0, 0, 255}));
      connect(B2.p, pwLine1.p) annotation(
        Line(points = {{0, 0}, {10, 0}, {10, 20}, {21, 20}}, color = {0, 0, 255}));
      connect(pwLine2.p, B2.p) annotation(
        Line(points = {{21, -20}, {10, -20}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
      connect(pwFault.p, B2.p) annotation(
        Line(points = {{18.3333, -50}, {10, -50}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
      connect(B3.p, pwLine1.n) annotation(
        Line(points = {{60, 0}, {50, 0}, {50, 20}, {39, 20}}, color = {0, 0, 255}));
      connect(pwLine2.n, B3.p) annotation(
        Line(points = {{39, -20}, {50, -20}, {50, 0}, {60, 0}}, color = {0, 0, 255}));
      connect(infiniteBus.p, B3.p) annotation(
        Line(points = {{70, 0}, {60, 0}}, color = {0, 0, 255}));
    end Example_1_final;
  equation

  end Network;

  model Example_1
    extends Modelica.Icons.Example;
    OpenIPSL.Electrical.Buses.Bus B1 annotation(
      Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B2 annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B3 annotation(
      Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MyExample1.Generator.Generator G1(P_0 = 1997999999.99364, Q_0 = 967924969.9065781, angle_0 = 0.4946771769891539) annotation(
      Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
      Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-30, -10}, {30, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
      Placement(visible = true, transformation(origin = {12, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.5*100/2220) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, 10}, {40, 30}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.93*100/2220) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -30}, {40, -10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(P_0 = -1998000000, Q_0 = 87066000, angle_0 = 0, v_0 = 0.90081) annotation(
      Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
    OpenIPSL.Electrical.Events.PwFault pwFault(R = 0, X = 0.01*100/2220, t1 = 0.5, t2 = 0.57) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -60}, {40, -40}}, rotation = 0)));
  equation
    connect(G1.pwPin, B1.p) annotation(
      Line(points = {{-69, 0}, {-60, 0}}, color = {0, 0, 255}));
    connect(B1.p, transformer.p) annotation(
      Line(points = {{-60, 0}, {-39, 0}}, color = {0, 0, 255}));
    connect(transformer.n, B2.p) annotation(
      Line(points = {{-17, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(B2.p, pwLine1.p) annotation(
      Line(points = {{0, 0}, {10, 0}, {10, 20}, {21, 20}}, color = {0, 0, 255}));
    connect(pwLine2.p, B2.p) annotation(
      Line(points = {{21, -20}, {10, -20}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(pwFault.p, B2.p) annotation(
      Line(points = {{18.3333, -50}, {10, -50}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(B3.p, pwLine1.n) annotation(
      Line(points = {{60, 0}, {50, 0}, {50, 20}, {39, 20}}, color = {0, 0, 255}));
    connect(pwLine2.n, B3.p) annotation(
      Line(points = {{39, -20}, {50, -20}, {50, 0}, {60, 0}}, color = {0, 0, 255}));
    connect(infiniteBus.p, B3.p) annotation(
      Line(points = {{70, 0}, {60, 0}}, color = {0, 0, 255}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.0001));
  end Example_1;

  model Example_2_EM
    extends Modelica.Icons.Example;
    OpenIPSL.Electrical.Buses.Bus B1 annotation(
      Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B2 annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B3 annotation(
      Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Generator.GeneratorEM G1(P_0 = 1997999999.99364, Q_0 = 967924969.9065781, angle_0 = 0.4946771769891539) annotation(
      Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
      Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-30, -10}, {30, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
      Placement(visible = true, transformation(origin = {12, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.5*100/2220) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, 10}, {40, 30}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.93*100/2220) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -30}, {40, -10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(P_0 = -1998000000, Q_0 = 87066000, angle_0 = 0, v_0 = 0.90081) annotation(
      Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
    OpenIPSL.Electrical.Events.PwFault pwFault(R = 0, X = 0.01*100/2220, t1 = 0.5, t2 = 0.57) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -60}, {40, -40}}, rotation = 0)));
  equation
    connect(G1.pwPin, B1.p) annotation(
      Line(points = {{-69, 0}, {-60, 0}}, color = {0, 0, 255}));
    connect(B1.p, transformer.p) annotation(
      Line(points = {{-60, 0}, {-39, 0}}, color = {0, 0, 255}));
    connect(transformer.n, B2.p) annotation(
      Line(points = {{-17, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(B2.p, pwLine1.p) annotation(
      Line(points = {{0, 0}, {10, 0}, {10, 20}, {21, 20}}, color = {0, 0, 255}));
    connect(pwLine2.p, B2.p) annotation(
      Line(points = {{21, -20}, {10, -20}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(pwFault.p, B2.p) annotation(
      Line(points = {{18.3333, -50}, {10, -50}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(B3.p, pwLine1.n) annotation(
      Line(points = {{60, 0}, {50, 0}, {50, 20}, {39, 20}}, color = {0, 0, 255}));
    connect(pwLine2.n, B3.p) annotation(
      Line(points = {{39, -20}, {50, -20}, {50, 0}, {60, 0}}, color = {0, 0, 255}));
    connect(infiniteBus.p, B3.p) annotation(
      Line(points = {{70, 0}, {60, 0}}, color = {0, 0, 255}));
    annotation(
      experiment(StopTime = 10, Interval = 0.0001, Tolerance = 1e-06, StartTime = 0));
  end Example_2_EM;

  model Example_2_PSS
    extends Modelica.Icons.Example;
    OpenIPSL.Electrical.Buses.Bus B1 annotation(
      Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B2 annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B3 annotation(
      Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Generator.GeneratorPSS G1(P_0 = 1997999999.99364, Q_0 = 967924969.9065781, angle_0 = 0.4946771769891539) annotation(
      Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
      Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-30, -10}, {30, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
      Placement(visible = true, transformation(origin = {12, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.5*100/2220) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, 10}, {40, 30}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.93*100/2220) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -30}, {40, -10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(P_0 = -1998000000, Q_0 = 87066000, angle_0 = 0, v_0 = 0.90081) annotation(
      Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
    OpenIPSL.Electrical.Events.PwFault pwFault(R = 0, X = 0.01*100/2220, t1 = 0.5, t2 = 0.57) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -60}, {40, -40}}, rotation = 0)));
  equation
    connect(G1.pwPin, B1.p) annotation(
      Line(points = {{-69, 0}, {-60, 0}}, color = {0, 0, 255}));
    connect(B1.p, transformer.p) annotation(
      Line(points = {{-60, 0}, {-39, 0}}, color = {0, 0, 255}));
    connect(transformer.n, B2.p) annotation(
      Line(points = {{-17, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(B2.p, pwLine1.p) annotation(
      Line(points = {{0, 0}, {10, 0}, {10, 20}, {21, 20}}, color = {0, 0, 255}));
    connect(pwLine2.p, B2.p) annotation(
      Line(points = {{21, -20}, {10, -20}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(pwFault.p, B2.p) annotation(
      Line(points = {{18.3333, -50}, {10, -50}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(B3.p, pwLine1.n) annotation(
      Line(points = {{60, 0}, {50, 0}, {50, 20}, {39, 20}}, color = {0, 0, 255}));
    connect(pwLine2.n, B3.p) annotation(
      Line(points = {{39, -20}, {50, -20}, {50, 0}, {60, 0}}, color = {0, 0, 255}));
    connect(infiniteBus.p, B3.p) annotation(
      Line(points = {{70, 0}, {60, 0}}, color = {0, 0, 255}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.0001));
  end Example_2_PSS;

  model Example_3_AVRIO
    extends Modelica.Icons.Example;
    OpenIPSL.Electrical.Buses.Bus B1 annotation(
      Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B2 annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B3 annotation(
      Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Generator.GeneratorAVRIO G1(P_0 = 1997999999.99364, Q_0 = 967924969.9065781, angle_0 = 0.4946771769891539) annotation(
      Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
      Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-30, -10}, {30, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
      Placement(visible = true, transformation(origin = {12, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.5*100/2220) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, 10}, {40, 30}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.93*100/2220) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -30}, {40, -10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(P_0 = -1998000000, Q_0 = 87066000, angle_0 = 0, v_0 = 0.90081) annotation(
      Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
    OpenIPSL.Electrical.Events.PwFault pwFault(R = 0, X = 0.01*100/2220, t1 = 0.5, t2 = 0.57) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -60}, {40, -40}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u annotation(
      Placement(transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-106, -2}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Interfaces.RealOutput w annotation(
      Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {108, -2}, extent = {{-10, -10}, {10, 10}})));
  equation
    connect(G1.pwPin, B1.p) annotation(
      Line(points = {{-69, 0}, {-60, 0}}, color = {0, 0, 255}));
    connect(B1.p, transformer.p) annotation(
      Line(points = {{-60, 0}, {-39, 0}}, color = {0, 0, 255}));
    connect(transformer.n, B2.p) annotation(
      Line(points = {{-17, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(B2.p, pwLine1.p) annotation(
      Line(points = {{0, 0}, {10, 0}, {10, 20}, {21, 20}}, color = {0, 0, 255}));
    connect(pwLine2.p, B2.p) annotation(
      Line(points = {{21, -20}, {10, -20}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(pwFault.p, B2.p) annotation(
      Line(points = {{18.3333, -50}, {10, -50}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(B3.p, pwLine1.n) annotation(
      Line(points = {{60, 0}, {50, 0}, {50, 20}, {39, 20}}, color = {0, 0, 255}));
    connect(pwLine2.n, B3.p) annotation(
      Line(points = {{39, -20}, {50, -20}, {50, 0}, {60, 0}}, color = {0, 0, 255}));
    connect(infiniteBus.p, B3.p) annotation(
      Line(points = {{70, 0}, {60, 0}}, color = {0, 0, 255}));
    connect(G1.u, u) annotation(
      Line(points = {{-88, 0}, {-120, 0}}, color = {0, 0, 127}));
    connect(G1.w, w) annotation(
      Line(points = {{-68, 6}, {-64, 6}, {-64, 40}, {94, 40}, {94, 0}, {110, 0}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.0001));
  end Example_3_AVRIO;

  model Example_3_PSSDesign
    extends Modelica.Icons.Example;
    OpenIPSL.Electrical.Buses.Bus B1 annotation(
      Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B2 annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B3 annotation(
      Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Generator.GeneratorPSSDesign G1(P_0 = 1997999999.99364, Q_0 = 967924969.9065781, angle_0 = 0.4946771769891539) annotation(
      Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
      Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-30, -10}, {30, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
      Placement(visible = true, transformation(origin = {12, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.5*100/2220) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, 10}, {40, 30}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.93*100/2220) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -30}, {40, -10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(P_0 = -1998000000, Q_0 = 87066000, angle_0 = 0, v_0 = 0.90081) annotation(
      Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
    OpenIPSL.Electrical.Events.PwFault pwFault(R = 0, X = 0.01*100/2220, t1 = 0.5, t2 = 0.57) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -60}, {40, -40}}, rotation = 0)));
  equation
    connect(G1.pwPin, B1.p) annotation(
      Line(points = {{-69, 0}, {-60, 0}}, color = {0, 0, 255}));
    connect(B1.p, transformer.p) annotation(
      Line(points = {{-60, 0}, {-39, 0}}, color = {0, 0, 255}));
    connect(transformer.n, B2.p) annotation(
      Line(points = {{-17, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(B2.p, pwLine1.p) annotation(
      Line(points = {{0, 0}, {10, 0}, {10, 20}, {21, 20}}, color = {0, 0, 255}));
    connect(pwLine2.p, B2.p) annotation(
      Line(points = {{21, -20}, {10, -20}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(pwFault.p, B2.p) annotation(
      Line(points = {{18.3333, -50}, {10, -50}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(B3.p, pwLine1.n) annotation(
      Line(points = {{60, 0}, {50, 0}, {50, 20}, {39, 20}}, color = {0, 0, 255}));
    connect(pwLine2.n, B3.p) annotation(
      Line(points = {{39, -20}, {50, -20}, {50, 0}, {60, 0}}, color = {0, 0, 255}));
    connect(infiniteBus.p, B3.p) annotation(
      Line(points = {{70, 0}, {60, 0}}, color = {0, 0, 255}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.0001));
  end Example_3_PSSDesign;

  model Example_2_EM_Classical
    extends Modelica.Icons.Example;
    OpenIPSL.Electrical.Buses.Bus B1 annotation(
      Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B2 annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B3 annotation(
      Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Generator.GeneratorEMClassical G1(P_0 = 1997999999.99364, Q_0 = 967924969.9065781, angle_0 = 0.4946771769891539) annotation(
      Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation(
      Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-30, -10}, {30, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn(displayUnit = "V.A") = 2220000000, V_b = 400000, Vn = 400000, rT = 0, xT = 0.15) annotation(
      Placement(visible = true, transformation(origin = {12, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.5*100/2220) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, 10}, {40, 30}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0, G = 0, R = 0, S_b = 1e8, X = 0.93*100/2220) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -30}, {40, -10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(P_0 = -1998000000, Q_0 = 87066000, angle_0 = 0, v_0 = 0.90081) annotation(
      Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
    OpenIPSL.Electrical.Events.PwFault pwFault(R = 0, X = 0.01*100/2220, t1 = 0.5, t2 = 0.57) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{20, -60}, {40, -40}}, rotation = 0)));
  equation
    connect(G1.pwPin, B1.p) annotation(
      Line(points = {{-69, 0}, {-60, 0}}, color = {0, 0, 255}));
    connect(B1.p, transformer.p) annotation(
      Line(points = {{-60, 0}, {-39, 0}}, color = {0, 0, 255}));
    connect(transformer.n, B2.p) annotation(
      Line(points = {{-17, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(B2.p, pwLine1.p) annotation(
      Line(points = {{0, 0}, {10, 0}, {10, 20}, {21, 20}}, color = {0, 0, 255}));
    connect(pwLine2.p, B2.p) annotation(
      Line(points = {{21, -20}, {10, -20}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(pwFault.p, B2.p) annotation(
      Line(points = {{18.3333, -50}, {10, -50}, {10, 0}, {0, 0}}, color = {0, 0, 255}));
    connect(B3.p, pwLine1.n) annotation(
      Line(points = {{60, 0}, {50, 0}, {50, 20}, {39, 20}}, color = {0, 0, 255}));
    connect(pwLine2.n, B3.p) annotation(
      Line(points = {{39, -20}, {50, -20}, {50, 0}, {60, 0}}, color = {0, 0, 255}));
    connect(infiniteBus.p, B3.p) annotation(
      Line(points = {{70, 0}, {60, 0}}, color = {0, 0, 255}));
    annotation(
      experiment(StopTime = 10, Interval = 0.0001, Tolerance = 1e-06, __Dymola_fixedstepsize = 0.035, __Dymola_Algorithm = "Rkfix2"));
  end Example_2_EM_Classical;
  annotation(
    uses(OpenIPSL(version = "3.0.1"), Modelica(version = "4.0.0")));
end MyExample1;
