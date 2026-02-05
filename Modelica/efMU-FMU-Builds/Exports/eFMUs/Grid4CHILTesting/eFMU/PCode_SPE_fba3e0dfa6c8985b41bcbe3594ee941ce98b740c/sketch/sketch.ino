/*
  This file has been automatically generated with eFMPy 0.1.0.
*/

#include "sii_block_interface.h"

void setup() {

  sii_Startup_H283cd02180511b024b59731032fd3290f8675b29_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();

  // tunable parameters:
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.K0

  sii_Recalibrate_H283cd02180511b024b59731032fd3290f8675b29_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();
}

// the loop function runs over and over again forever
void loop() {

  // inputs:
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.fault
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vf

  sii_DoStep_H283cd02180511b024b59731032fd3290f8675b29_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();

  // outputs:
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.Pgen
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.Qgen
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.v
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vf0OUT
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.w
}