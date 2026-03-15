within OpenIPSL_CHIL.Examples.eFMIIntegration;
model RefSys
  "System model with plan including AVR and PSS (uses replaceables and partial model)"
  extends Templates.RefSysTemplate(redeclare Generator.ReDesign.GenPSSReDesign
                                                                           G1);
end RefSys;
