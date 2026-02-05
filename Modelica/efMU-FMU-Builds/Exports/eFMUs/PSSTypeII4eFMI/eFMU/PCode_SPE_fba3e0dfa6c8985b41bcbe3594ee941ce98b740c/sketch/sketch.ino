/*
  This file has been automatically generated with eFMPy 0.1.0.
*/

#include "sii_block_interface.h"

void setup() {

  sii_Startup_H525b873079cf7a65f464c408f25344d5bd630cab_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();

  // tunable parameters:
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.Kw
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T1
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T2
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T3
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T4
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.Tw
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vSI_start
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vsmax
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vsmin

  sii_Recalibrate_H525b873079cf7a65f464c408f25344d5bd630cab_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();
}

// the loop function runs over and over again forever
void loop() {

  // inputs:
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vSI

  sii_DoStep_H525b873079cf7a65f464c408f25344d5bd630cab_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();

  // outputs:
  // block_state_H525b873079cf7a65f464c408f25344d5bd630cab_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vs
}