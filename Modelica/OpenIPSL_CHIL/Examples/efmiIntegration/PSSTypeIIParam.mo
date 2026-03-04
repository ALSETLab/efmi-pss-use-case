within OpenIPSL_CHIL.Examples.eFMIIntegration;
model PSSTypeIIParam "Reference system with modified PSS for efmi export"
  extends eFMIIntegration.Templates.RefSysTemplate(redeclare
      Generator.PSSTypeIIParam.GenPSSTypeIIParam G1);
end PSSTypeIIParam;
