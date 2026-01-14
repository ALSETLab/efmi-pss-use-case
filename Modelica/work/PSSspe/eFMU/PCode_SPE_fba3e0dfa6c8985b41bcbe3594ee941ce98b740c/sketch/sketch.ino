/*
  This file has been automatically generated with eFMPy 0.1.0.
*/

#include "sii_block_interface.h"

void setup() {

  sii_Startup_He61c9e6d5af0d56a3b757d54a04e861698c3a4f4_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();

  // tunable parameters:
  // block_state_He61c9e6d5af0d56a3b757d54a04e861698c3a4f4_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.Kw
  // block_state_He61c9e6d5af0d56a3b757d54a04e861698c3a4f4_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T1
  // block_state_He61c9e6d5af0d56a3b757d54a04e861698c3a4f4_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T2
  // block_state_He61c9e6d5af0d56a3b757d54a04e861698c3a4f4_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T3
  // block_state_He61c9e6d5af0d56a3b757d54a04e861698c3a4f4_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T4
  // block_state_He61c9e6d5af0d56a3b757d54a04e861698c3a4f4_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.Tw
  // block_state_He61c9e6d5af0d56a3b757d54a04e861698c3a4f4_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vSI_start
  // block_state_He61c9e6d5af0d56a3b757d54a04e861698c3a4f4_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vsmax
  // block_state_He61c9e6d5af0d56a3b757d54a04e861698c3a4f4_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vsmin

  sii_Recalibrate_He61c9e6d5af0d56a3b757d54a04e861698c3a4f4_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();
}

// the loop function runs over and over again forever
void loop() {

  // inputs:
  // block_state_He61c9e6d5af0d56a3b757d54a04e861698c3a4f4_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vSI

  sii_DoStep_He61c9e6d5af0d56a3b757d54a04e861698c3a4f4_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();

  // outputs:
  // block_state_He61c9e6d5af0d56a3b757d54a04e861698c3a4f4_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vs
}