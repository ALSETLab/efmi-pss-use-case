/*
  This file has been automatically generated with eFMPy 0.1.0.
*/

#include "sii_block_interface.h"

void setup() {

  sii_Startup_Hb0cb05f437863e9fece1a90bb931dbfeb4ac00f3_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();

  // tunable parameters:

  sii_Recalibrate_Hb0cb05f437863e9fece1a90bb931dbfeb4ac00f3_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();
}

// the loop function runs over and over again forever
void loop() {

  // inputs:
  // block_state_Hb0cb05f437863e9fece1a90bb931dbfeb4ac00f3_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.fault
  // block_state_Hb0cb05f437863e9fece1a90bb931dbfeb4ac00f3_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vf

  sii_DoStep_Hb0cb05f437863e9fece1a90bb931dbfeb4ac00f3_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();

  // outputs:
  // block_state_Hb0cb05f437863e9fece1a90bb931dbfeb4ac00f3_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.Pgen
  // block_state_Hb0cb05f437863e9fece1a90bb931dbfeb4ac00f3_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.Qgen
  // block_state_Hb0cb05f437863e9fece1a90bb931dbfeb4ac00f3_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.v
  // block_state_Hb0cb05f437863e9fece1a90bb931dbfeb4ac00f3_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vf0OUT
  // block_state_Hb0cb05f437863e9fece1a90bb931dbfeb4ac00f3_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.w
}