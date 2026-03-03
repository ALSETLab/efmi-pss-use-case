within OpenIPSL_CHIL.Examples.efmiIntegration;
model RefSys
  "System model with plan including AVR and PSS (uses replaceables and partial model)"
  extends Templates.RefSysTemplate(redeclare Generator.Design.GenPSSDesign G1);
end RefSys;
