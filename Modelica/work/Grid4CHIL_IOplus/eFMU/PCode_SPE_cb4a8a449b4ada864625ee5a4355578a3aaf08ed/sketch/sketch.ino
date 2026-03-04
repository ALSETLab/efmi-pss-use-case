/*
  This file has been automatically generated with eFMPy 0.1.0.
*/

#include "sii_block_interface.h"

void setup() {

  sii_Startup_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_cb4a8a449b4ada864625ee5a4355578a3aaf08ed();

  // tunable parameters:
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.K0

  sii_Recalibrate_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_cb4a8a449b4ada864625ee5a4355578a3aaf08ed();
}

// the loop function runs over and over again forever
void loop() {

  // inputs:
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.fault
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.faultL1
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.faultL2
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.uPLoad
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vf

  sii_DoStep_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_cb4a8a449b4ada864625ee5a4355578a3aaf08ed();

  // outputs:
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.Pgen
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.Qgen
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.v
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vf0OUT
  // block_state_H96e4298bd9675fbbcb46b0c1f68b039a5627ebc5_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.w
}