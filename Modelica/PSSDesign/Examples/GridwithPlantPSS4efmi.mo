within PSSDesign.Examples;
model GridwithPlantPSS4efmi
  "System model with plan including AVR and PSS with modifications for efmi export (uses replaceables and partial model)"
  extends Systems.SystemWithReplaceablePlant(redeclare
      Generator.GeneratorPSSDesign4efmi G1);
end GridwithPlantPSS4efmi;
