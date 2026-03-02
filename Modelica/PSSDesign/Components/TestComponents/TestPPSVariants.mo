within PSSDesign.Components.TestComponents;
package TestPPSVariants "Sub-package with PSS Variant Test Examples"
  extends Modelica.Icons.ExamplesPackage;
  model TestGenPSSDesign
    "Extends partial network model and adds replaceable model configured to test the reference generator configuration with modified machine and designed PSS parameters."
    extends Network.PartialNetwork;
    extends Modelica.Icons.Example;
    replaceable Generator.GenPSSDesign       G1(displayPF=false) constrainedby
      Generator.GenTemplate
      annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
        choicesAllMatching=true);
  equation
    connect(G1.pwPin, B1.p)
      annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
  end TestGenPSSDesign;

  package DerivativeLagWOF
    "Test PSS models that use a derivative lag as wash-out filter."
    extends Modelica.Icons.ExamplesPackage;
    model TestGenPSS4efmiDLvar
      "Similar to ../TestGenPSSDesign, configured test the PSSTypeII4eFMI model."
      extends Network.PartialNetwork;
      extends Modelica.Icons.Example;
      replaceable Generator.GenPSS4efmiDLvar   G1(displayPF=false)
        constrainedby Generator.GenTemplate
        annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
          choicesAllMatching=true);
    equation
      connect(G1.pwPin, B1.p)
        annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
    end TestGenPSS4efmiDLvar;

    model TestGenPSS4efmiDLvarClocked
      "Similar to ../TestGenPSSDesign, configured the PSSTypeII4eFMI model with a clocked partition."
      extends Network.PartialNetwork;
      extends Modelica.Icons.Example;
      replaceable Generator.GenPSS4efmiDLvarClocked
                                               G1(displayPF=false)
        constrainedby Generator.GenTemplate
        annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
          choicesAllMatching=true);
    equation
      connect(G1.pwPin, B1.p)
        annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
    end TestGenPSS4efmiDLvarClocked;

    model TestGenPSSeFMUeBlockDLvar
      "Similar to ../TestGenPSSDesign, configured to test the PSSTypeII4eFMI binary stub."
      extends Network.PartialNetwork;
      extends Modelica.Icons.Example;
      replaceable Generator.GenPSSeFMUeBlockDLvar
                                               G1(displayPF=false)
        constrainedby Generator.GenTemplate
        annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
          choicesAllMatching=true);
    equation
      connect(G1.pwPin, B1.p)
        annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
    end TestGenPSSeFMUeBlockDLvar;
  end DerivativeLagWOF;

  package HighPassFilterWOF
    "Test PSS models that use a high pass filter as wash-out filter."
    extends Modelica.Icons.ExamplesPackage;
    model TestGenPSS4efmiHPFvar
      "Similar to ../TestGenPSSDesign, configured test the PSSTypeII4eFMIwHPFilter model."
      extends Network.PartialNetwork;
      extends Modelica.Icons.Example;
      replaceable Generator.GenPSS4efmiHPFvar  G1(displayPF=false)
        constrainedby Generator.GenTemplate
        annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
          choicesAllMatching=true);
    equation
      connect(G1.pwPin, B1.p)
        annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
    end TestGenPSS4efmiHPFvar;

    model TestGenPSS4efmiHPFvarClocked
      "Similar to ../TestGenPSSDesign, configured to test PSSTypeII4eFMIwHPFilter with a clocked partition"
      extends Network.PartialNetwork;
      extends Modelica.Icons.Example;
      replaceable Generator.GenPSS4efmiHPFvarClocked
                                               G1(displayPF=false)
        constrainedby Generator.GenTemplate
        annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
          choicesAllMatching=true);
    equation
      connect(G1.pwPin, B1.p)
        annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
    end TestGenPSS4efmiHPFvarClocked;

    model TestGenPSSeFMUeBlockHPFvar
      "Similar to ../TestGenPSSDesign, configured to test the PSSTypeII4eFMIwHPFilter binary stub."
      extends Network.PartialNetwork;
      extends Modelica.Icons.Example;
      replaceable Generator.GenPSSeFMUeBlockHPFvar
                                               G1(displayPF=false)
        constrainedby Generator.GenTemplate
        annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
          choicesAllMatching=true);
    equation
      connect(G1.pwPin, B1.p)
        annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
    end TestGenPSSeFMUeBlockHPFvar;
  end HighPassFilterWOF;
end TestPPSVariants;
