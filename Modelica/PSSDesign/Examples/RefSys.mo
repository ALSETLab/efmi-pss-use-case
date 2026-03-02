within PSSDesign.Examples;
model RefSys
  "System model with plan including AVR and PSS (uses replaceables and partial model)"
  extends Templates.RefSysTemplate(          redeclare
      Generator.GeneratorPSSDesign G1);
end RefSys;
