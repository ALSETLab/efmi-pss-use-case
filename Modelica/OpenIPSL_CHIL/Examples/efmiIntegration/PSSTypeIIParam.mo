within OpenIPSL_CHIL.Examples.efmiIntegration;
model PSSTypeIIParam "Reference system with modified PSS for efmi export"
  extends efmiIntegration.Templates.RefSysTemplate(redeclare
      Generator.PSSTypeIIParam.GenPSSTypeIIParam G1);
end PSSTypeIIParam;
