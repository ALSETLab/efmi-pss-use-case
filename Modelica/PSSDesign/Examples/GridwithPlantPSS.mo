within PSSDesign.Examples;
model GridwithPlantPSS
  "System model with plan including AVR and PSS (uses replaceables and partial model)"
  extends Systems.SystemWithReplaceablePlant(redeclare
      Generator.GeneratorPSSDesign G1);
end GridwithPlantPSS;
