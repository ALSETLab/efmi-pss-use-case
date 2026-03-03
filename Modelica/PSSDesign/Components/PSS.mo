within PSSDesign.Components;
package PSS "PSS model variants"
  extends Modelica.Icons.VariantsPackage;

  model PSSTypeII4eFMI
    "PSS Type II of OpenIPSL with parametrization for eFMI use-case."

    extends OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII(
      vSI(
        final start = vSI_start),
      Kw = 9.5,
      T1 = 0.154,
      T2 = 0.033,
      T3 = 1,
      T4 = 1,
      Tw = 1.41,
      vsmax = 0.2,
      vsmin = -0.2);
    // Block icon removes blue background of default model:
    extends Modelica.Blocks.Icons.Block;

    // Tunable start values:
    parameter Real vSI_start = 1.0
      "Default start value for vSI, the PSS input signal.";

    annotation (Icon(graphics={Text(
            extent={{-100,100},{100,-100}},
            textColor={0,140,72},
            textString="PSS for\neFMI export")}));
  end PSSTypeII4eFMI;

  model PSSTypeII4eFMIwHPFilter
    "PSS Type II of OpenIPSL with parametrization for eFMI use-case, replacing the derivative filter with a high-pass filter."

    extends OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII(
      vSI(
        final start = vSI_start),
      Kw = 9.5,
      T1 = 0.154,
      T2 = 0.033,
      T3 = 1,
      T4 = 1,
      Tw = 1.41,
      vsmax = 0.2,
      vsmin = -0.2,
      break derivativeLag
                  );
    // Block icon removes blue background of default model:
    extends Modelica.Blocks.Icons.Block;

    // Tunable start values:
    parameter Real vSI_start = 1.0
      "Default start value for vSI, the PSS input signal.";

    PSS.DLHPF dLHPFreplacement(Kw=Kw, Tw=Tw)
      "HP Filter replacing the derivative lag."
      annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  equation
    connect(dLHPFreplacement.u, vSI)
      annotation (Line(points={{-62,0},{-120,0}}, color={0,0,127}));
    connect(dLHPFreplacement.y, imLeadLag.u)
      annotation (Line(points={{-39,0},{-12,0}}, color={0,0,127}));
    annotation (Icon(graphics={Rectangle(
            extent={{-98,98},{98,-98}},
            lineColor={28,108,200},
            lineThickness=1,
            fillColor={255,170,213},
            fillPattern=FillPattern.Solid),
                               Text(
            extent={{-100,100},{100,-100}},
            textColor={0,0,255},
            textString="PSS4eFMI 
export
HPF")}));
  end PSSTypeII4eFMIwHPFilter;

  package Blocks "Blocks used for the PSS variants"
    extends Modelica.Icons.Package;
    block DerivativeLagHighPass
      "High-pass filter replacement for OpenIPSL DerivativeLag"
      extends Modelica.Blocks.Interfaces.SISO;

      // Filter Order
      parameter Integer order = 2 "Order of the filter";

      // Original parameters
      parameter Real Kw = 10.8 "Proportional gain part";
      parameter Modelica.Units.SI.Time Tw = 5.0 "Time constant";

      // Scaling factor to match OpenIPSL behavior
      parameter Real scaling_factor = Kw "Scaling factor to match OpenIPSL DerivativeLag gain";

      // Initialization parameters matching the OpenIPSL block
      parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.InitialOutput
        "Type of initialization"
        annotation (Dialog(group="Initialization"));
      parameter Real y_start = 0
        "Output start value"
        annotation (Dialog(group="Initialization"));

      // Dynamically sized array based on the filter order
      parameter Real x_start[order] = fill(0, order)
        "Start values of state variables"
        annotation (Dialog(group="Initialization"));

      // N-th order Butterworth High-Pass Filter
      Modelica.Blocks.Continuous.Filter highPassFilter(
        order = order,
        f_cut = 1 / (2 * Modelica.Constants.pi * Tw),
        analogFilter = Modelica.Blocks.Types.AnalogFilter.Butterworth,
        filterType = Modelica.Blocks.Types.FilterType.HighPass,
        init = initType,
        x_start = x_start,  // Notice the brackets {} are removed here!
        y_start = y_start / max(abs(scaling_factor), Modelica.Constants.eps))
        annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));

      // Gain block to apply the scaling factor
      Modelica.Blocks.Math.Gain matchGain(k = scaling_factor)
        annotation (Placement(transformation(extent={{20,-10},{40,10}})));

    equation
      connect(u, highPassFilter.u) annotation (Line(points={{-100,0},{-42,0}}, color={0,0,127}));
      connect(highPassFilter.y, matchGain.u) annotation (Line(points={{-19,0},{18,0}}, color={0,0,127}));
      connect(matchGain.y, y) annotation (Line(points={{41,0},{100,0}}, color={0,0,127}));

      annotation (Icon(graphics={
          Text(extent={{-60,82},{60,22}}, textColor={0,0,255}, textString="Kw*Tw*s"),
          Line(points={{-62,0},{66,0}}, color={0,0,255}, smooth=Smooth.Bezier, thickness=0.5),
          Text(extent={{-60,-20},{60,-80}}, textColor={0,0,255}, textString="1+sTw")}));
    end DerivativeLagHighPass;

    model TestHPFdevlagReplacementLin
      "Test model to compare the frequency domain response of the derivative filters"
      parameter Real Kw = 10.5;
      parameter Real Tw = 5.0;
      Blocks.DerivativeLagHighPass HPvariant(
        order=1,
        Kw=Kw,
        Tw=Tw)
        annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
      OpenIPSL.NonElectrical.Continuous.DerivativeLag
                                             derivativeLag(
        K=Kw*Tw,
        T=Tw,
        y_start=0,
        x_start=0)
        annotation (Placement(transformation(extent={{-10,10},{10,30}})));
      Modelica.Blocks.Interfaces.RealOutput yDL "Derivative lag output"
        annotation (Placement(transformation(extent={{100,10},{120,30}})));
      Modelica.Blocks.Interfaces.RealOutput yHP "HPF variant output"
        annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
      Modelica.Blocks.Interfaces.RealInput u "Input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
    equation
      connect(derivativeLag.y, yDL)
        annotation (Line(points={{11,20},{110,20}}, color={0,0,127}));
      connect(HPvariant.y, yHP)
        annotation (Line(points={{11,-20},{110,-20}}, color={0,0,127}));
      connect(HPvariant.u, u) annotation (Line(points={{-12,-20},{-80,-20},{-80,0},{
              -120,0}}, color={0,0,127}));
      connect(derivativeLag.u, u) annotation (Line(points={{-12,20},{-80,20},{-80,0},
              {-120,0}}, color={0,0,127}));
      annotation (Icon(graphics={             Text(
              extent={{-100,-100},{100,-140}},
              textColor={28,108,200},
              textString="Der. Lag Block and HP Filter
"),         Polygon(lineColor={0,0,255},
                    fillColor={28,108,200},
                    pattern = LinePattern.None,
                    fillPattern=FillPattern.Solid,
                    points={{92,-10},{112,-20},{92,-30},{92,-10}}),
          Rectangle(lineColor={160,160,164},
            fillColor={255,255,255},
            fillPattern=FillPattern.Backward,
            extent={{-80,-80},{22,8}}),
          Line(origin={3.333,-8.667},   points = {{-83.333,34.667},{24.667,34.667},{42.667,-71.333}}, color = {0,0,127}, smooth = Smooth.Bezier),
          Line(points={{-80,78},{-80,-90}},
            color={192,192,192}),
          Polygon(lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            points={{-80,90},{-88,68},{-72,68},{-80,90}}),
          Polygon(lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            points={{90,-80},{68,-72},{68,-88},{90,-80}}),
          Line(points={{-90,-80},{82,-80}},
            color={192,192,192}),
            Polygon(lineColor={0,0,255},
                    fillColor={28,108,200},
                    pattern = LinePattern.None,
                    fillPattern=FillPattern.Solid,
                    points={{94,30},{114,20},{94,10},{94,30}})}));
    end TestHPFdevlagReplacementLin;

    function bodeDLandHPF
      "Plots the bode response for the derivative lag and high pass filter parametrized to replace it."
      extends Modelica.Icons.Function;
    algorithm
      Modelica_LinearSystems2.ModelAnalysis.TransferFunctions("PSSDesign.Components.PSSBlocks.TestHPFdevlagReplacementLin");
    end bodeDLandHPF;

    model TestHPFdevlagReplacementSim
      extends Modelica.Icons.Example;
      Blocks.TestHPFdevlagReplacementLin testHPFdevlagReplacementLin
        annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
      Modelica.Blocks.Interfaces.RealOutput yDL "Derivative lag output"
        annotation (Placement(transformation(extent={{100,10},{120,30}})));
      Modelica.Blocks.Interfaces.RealOutput yHP "HPF variant output"
        annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
      Modelica.Blocks.Sources.Step step(startTime=5)
        "Ramps the frequency from smallest to largest value"
        annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
    equation
      connect(testHPFdevlagReplacementLin.yDL, yDL) annotation (Line(points={{13,
              2},{20,2},{20,20},{110,20}}, color={0,0,127}));
      connect(testHPFdevlagReplacementLin.yHP, yHP) annotation (Line(points={{13,
              -2},{20,-2},{20,-20},{110,-20}}, color={0,0,127}));
      connect(step.y, testHPFdevlagReplacementLin.u)
        annotation (Line(points={{-59,0},{-10,0}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        experiment(
          StopTime=100,
          __Dymola_NumberOfIntervals=5000,
          __Dymola_Algorithm="Dassl"));
    end TestHPFdevlagReplacementSim;
  end Blocks;

  package eFMUConfig "eFMU generation configurations for PSS variants"

    package PSSTypeII4eFMI_eFMU
      "eFMU Configuration by extending from DymolaEmbedded.EmbeddedConfiguration"
      extends DymolaEmbedded.EmbeddedConfiguration(
        model_configuration(model_name=
              "PSSDesign.Components.PSS.PSSTypeII4eFMI"),
        integrator_configuration(sample_period=0.001, solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
        code_configuration(
          obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
        efmu_configuration(name="PSSTypeII4eFMI")
                                          );
      package SiLTest
        extends
          'eFMU experiment package (PSSTypeII4eFMI, PSSDesign.Components.TestComponents.Example_3_PSSDesign4PSSVariantClocked)'
          (tolerances_default(
            absolute_x32(vs=1.0e-3),
            relative_x32(vs=1.0e-4),
            absolute_x64(vs=1.0e-6),
            relative_x64(vs=1.0e-8)),
          Test_SiL_Scenario_1_PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed(eBlock(Kw = 10.8, T1 = 0.278203917593164, T2 = 0.0551479681529786, T3 = 0.278203917593164, T4 = 0.0551479681529786, Tw = 5.0, vsmax = 0.2, vsmin = -0.2)),
          Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c(eBlock(Kw = 10.8, T1 = 0.278203917593164, T2 = 0.0551479681529786, T3 = 0.278203917593164, T4 = 0.0551479681529786, Tw = 5.0, vsmax = 0.2, vsmin = -0.2)));
      end SiLTest;
    end PSSTypeII4eFMI_eFMU;

    package PSSTypeII4eFMIwHPFilter_eFMU
      "eFMU Configuration by extending from DymolaEmbedded.EmbeddedConfiguration"
      extends DymolaEmbedded.EmbeddedConfiguration(
        model_configuration(model_name=
              "PSSDesign.Components.PSS.PSSTypeII4eFMIwHPFilter"),
        integrator_configuration(sample_period=0.001, solver_method=DymolaEmbedded.BuildUtilities.AlgorithmCode.Integrator.SolverMethod.Explicit_Euler),
        code_configuration(
          obfuscate=DymolaEmbedded.BuildUtilities.AlgorithmCode.Code.ObfuscationLevel.None),
        efmu_configuration(name="PSSTypeII4eFMIwHPF")
                                          );
      package SiLTest
        extends PSSTypeII4eFMIwHPF_SiLTest_generated(
          tolerances_default(
            absolute_x32(vs=1.0e-3),
            relative_x32(vs=1.0e-4),
            absolute_x64(vs=1.0e-6),
            relative_x64(vs=1.0e-8)),
          Test_SiL_Scenario_1_PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed(
              eBlock(
              Kw=10.8,
              T1=0.278203917593164,
              T2=0.0551479681529786,
              T3=0.278203917593164,
              T4=0.0551479681529786,
              vsmax=0.2,
              vsmin=-0.2)),
          Test_SiL_Scenario_1_PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c(
              eBlock(
              Kw=10.8,
              T1=0.278203917593164,
              T2=0.0551479681529786,
              T3=0.278203917593164,
              T4=0.0551479681529786,
              vsmax=0.2,
              vsmin=-0.2)));
      end SiLTest;
    end PSSTypeII4eFMIwHPFilter_eFMU;
    annotation (Icon(graphics={
          Rectangle(
            lineColor={200,200,200},
            fillColor={248,248,248},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{-100,-100},{100,100}},
            radius=25.0),
          Rectangle(
            lineColor={128,128,128},
            extent={{-100,-100},{100,100}},
            radius=25.0),
          Rectangle(
            extent={{-82,-80},{80,80}},
            lineColor={95,95,95},
            pattern=LinePattern.None,
            fillColor={100,187,75},
            fillPattern=FillPattern.Solid,
            radius=10),
          Rectangle(
            extent={{-72,86},{-68,74}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-62,86},{-58,74}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-52,86},{-48,74}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-42,86},{-38,74}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-32,86},{-28,74}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-22,86},{-18,74}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-12,86},{-8,74}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-2,86},{2,74}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{8,86},{12,74}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{18,86},{22,74}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{28,86},{32,74}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{38,86},{42,74}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{48,86},{52,74}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{58,86},{62,74}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{68,86},{72,74}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-72,-76},{-68,-88}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-62,-76},{-58,-88}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-52,-76},{-48,-88}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-42,-76},{-38,-88}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-32,-76},{-28,-88}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-22,-76},{-18,-88}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-12,-76},{-8,-88}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-2,-76},{2,-88}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{8,-76},{12,-88}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{18,-76},{22,-88}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{28,-76},{32,-88}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{38,-76},{42,-88}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{48,-76},{52,-88}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{58,-76},{62,-88}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{68,-76},{72,-88}},
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
            origin={82,70},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={82,60},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={82,50},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={82,40},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={82,30},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={82,20},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={82,10},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={82,0},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={82,-10},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={82,-20},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={82,-30},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={82,-40},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={82,-50},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={82,-60},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={82,-70},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={-84,-70},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={-84,-60},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={-84,-50},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={-84,-40},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={-84,-30},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={-84,-20},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={-84,-10},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={-84,0},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={-84,10},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={-84,20},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={-84,30},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={-84,40},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={-84,50},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={-84,60},
            rotation=90),
          Rectangle(
            extent={{-2,6},{2,-6}},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            radius=10,
            pattern=LinePattern.None,
            lineColor={0,0,0},
            origin={-84,70},
            rotation=90),
          Rectangle(
            extent={{-20,-18},{20,20}},
            lineColor={95,95,95},
            pattern=LinePattern.None,
            fillColor={130,238,94},
            fillPattern=FillPattern.Solid,
            radius=10),
        Polygon(
          origin={1.3835,-4.1418},
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
            {-10.0,43.333},{-25.0,58.333},{-25.0,83.333},{-20.0,93.333}}),
        Polygon(
          origin={10.1018,5.218},
          rotation = -45.0,
          fillColor = {255,255,255},
          fillPattern = FillPattern.Solid,
          points = {{-15.0,87.273},{15.0,87.273},{20.0,82.273},{20.0,27.273},
            {10.0,17.273},{10.0,7.273},{20.0,2.273},{20.0,-2.727},{5.0,-2.727},
            {5.0,-77.727},{10.0,-87.727},{5.0,-112.727},{-5.0,-112.727},
            {-10.0,-87.727},{-5.0,-77.727},{-5.0,-2.727},{-20.0,-2.727},
            {-20.0,2.273},{-10.0,7.273},{-10.0,17.273},{-20.0,27.273},
            {-20.0,82.273}})}));
  end eFMUConfig;
end PSS;
