/*
  This file has been automatically generated with eFMPy 0.1.0.
*/

#include "sii_block_interface.h"

void setup() {

  sii_Startup_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed();

  // tunable parameters:
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.Kw
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.T1
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.T2
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.T3
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.T4
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.Tw
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vSI_start
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vsmax
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vsmin

  sii_Recalibrate_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed();
}

// the loop function runs over and over again forever
void loop() {

  // inputs:
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vSI

  sii_DoStep_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed();

  // outputs:
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vs
}