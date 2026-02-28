within PSSDesign.Examples;
model RefSysWithPSS4efmi "Reference system with modified PSS for efmi export"
  extends Systems.RefSysWithReplaceablePlant(redeclare
      Generator.GeneratorPSSDesign4efmi G1);
end RefSysWithPSS4efmi;
