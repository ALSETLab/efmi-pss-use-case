/*
  This file has been automatically generated with eFMPy 0.1.0.
*/

#include "sii_block_interface.h"

void setup() {

  sii_Startup_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();

  // tunable parameters:
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.K0

  sii_Recalibrate_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();
}

// the loop function runs over and over again forever
void loop() {

  // inputs:
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.fault
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.faultL1
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.faultL2
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.uPLoad
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vf

  sii_DoStep_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();

  // outputs:
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.Pgen
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.Qgen
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.v
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vf0OUT
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.w
}