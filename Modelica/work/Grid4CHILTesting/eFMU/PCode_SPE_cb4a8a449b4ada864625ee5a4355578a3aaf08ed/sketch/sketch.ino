/*
  This file has been automatically generated with eFMPy 0.1.0.
*/

#include "sii_block_interface.h"

void setup() {

  sii_Startup_H283cd02180511b024b59731032fd3290f8675b29_cb4a8a449b4ada864625ee5a4355578a3aaf08ed();

  // tunable parameters:
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.K0

  sii_Recalibrate_H283cd02180511b024b59731032fd3290f8675b29_cb4a8a449b4ada864625ee5a4355578a3aaf08ed();
}

// the loop function runs over and over again forever
void loop() {

  // inputs:
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.fault
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vf

  sii_DoStep_H283cd02180511b024b59731032fd3290f8675b29_cb4a8a449b4ada864625ee5a4355578a3aaf08ed();

  // outputs:
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.Pgen
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.Qgen
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.v
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vf0OUT
  // block_state_H283cd02180511b024b59731032fd3290f8675b29_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.w
}