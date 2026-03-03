within OpenIPSL_CHIL.Examples.efmiIntegration;
model RefSysWithPSS4efmi "Reference system with modified PSS for efmi export"
  extends efmiIntegration.Templates.RefSysTemplate(redeclare
      Generator.GenPSS4efmiDLvar G1);
end RefSysWithPSS4efmi;
