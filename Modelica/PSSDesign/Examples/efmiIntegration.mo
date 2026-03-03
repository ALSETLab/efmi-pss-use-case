within PSSDesign.Examples;
package efmiIntegration "Examples for the eFMI Integration Process"
  extends Modelica.Icons.ExamplesPackage;
  package Templates "Template models to be extended and modified in examples"
    extends Modelica.Icons.Package;
    model RefSysTemplate "System model extending from partial network"
      extends Network.PartialNetwork;
      extends Modelica.Icons.Example;
      replaceable Generator.GenPSSDesign       G1(displayPF=false) constrainedby
        Generator.GenTemplate
        annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
          choicesAllMatching=true);
    equation
      connect(G1.pwPin, B1.p)
        annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
    end RefSysTemplate;
  end Templates;

  model RefSys
    "System model with plan including AVR and PSS (uses replaceables and partial model)"
    extends Templates.RefSysTemplate(redeclare Generator.GenPSSDesign G1);
  end RefSys;

  model RefSysWithPSS4efmi "Reference system with modified PSS for efmi export"
    extends efmiIntegration.Templates.RefSysTemplate(redeclare
        Generator.GenPSS4efmiDLvar G1);
  end RefSysWithPSS4efmi;

  model SysWithPSS4eFMIandGrid4efmiExport
    "System model extending from partial network with modifications for efmi export and plant with modified PSS for efmi export. Serves as basis for comparison with experiments."
    extends Modelica.Icons.Example;
    extends Network.PartialNetwork4efmu;

    replaceable Generator.GenPSS4efmiDLvar   G1(displayPF=false) constrainedby
      Generator.GenTemplate
      annotation (Placement(transformation(extent={{-94,-10},{-74,10}})),
        choicesAllMatching=true);
    Components.FaultTimerLogic faultTimerLogic annotation (Placement(
          transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={70,-70})));
  equation
    connect(G1.pwPin, B1.p)
      annotation (Line(points={{-73,0},{-60,0}}, color={0,0,255}));
    connect(faultTimerLogic.y, pwFault4efmi.trip)
      annotation (Line(points={{59,-70},{43.3333,-70}}, color={255,0,255}));
  end SysWithPSS4eFMIandGrid4efmiExport;
end efmiIntegration;
