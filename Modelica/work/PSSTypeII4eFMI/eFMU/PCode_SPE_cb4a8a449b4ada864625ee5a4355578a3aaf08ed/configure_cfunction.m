function configure_cfunction(block)
% CONFIGURE_CFUNCTION  Configure a C Function block to interface with the
%   eFMI production code. This function has been automatically generated
%   with eFMPy 0.1.0.
%
%   CONFIGURE_CFUNCTION() configure the current block.
%
%   CONFIGURE_CFUNCTION(BLOCK) configure BLOCK.

if nargin == 0
    block = gcb;
end

if ~strcmp(get_param(block, 'BlockType'), 'CFunction')
    error('Block to configure must be of type CFunction.')
end

set_param(block, 'SampleTime', '1.00000000000000002e-3')

[pcode_dir, ~, ~] = fileparts(mfilename('fullpath'));

StartCode = [
'sii_Startup_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed();' newline ...
'' newline ...
'#ifdef RT' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.Kw = Kw;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.T1 = T1;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.T2 = T2;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.T3 = T3;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.T4 = T4;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.Tw = Tw;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vSI_start = vSI_start;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vsmax = vsmax;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vsmin = vsmin;' newline ...
'#else' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.Kw = Kw;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.T1 = T1;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.T2 = T2;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.T3 = T3;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.T4 = T4;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.Tw = Tw;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vSI_start = vSI_start;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vsmax = vsmax;' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vsmin = vsmin;' newline ...
'#endif' newline ...
'' newline ...
'sii_Recalibrate_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed();' newline ...
'' newline ...
'#ifdef RT' newline ...
'vs = block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vs;' newline ...
'#else' newline ...
'vs = block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vs;' newline ...
'#endif' newline ...
];

set_param(block, 'StartCode', StartCode);

OutputCode = [
'#ifdef RT' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vSI = vSI;' newline ...
'#else' newline ...
'block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vSI = vSI;' newline ...
'#endif' newline ...
'' newline ...
'sii_DoStep_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed();' newline ...
'' newline ...
'#ifdef RT' newline ...
'vs = block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vs;' newline ...
'#else' newline ...
'vs = block_state_H525b873079cf7a65f464c408f25344d5bd630cab_cb4a8a449b4ada864625ee5a4355578a3aaf08ed.vs;' newline ...
'#endif' newline ...
];

set_param(block, 'OutputCode', OutputCode);

SimCustomHeaderFile = [
'#include "sii_block_interface.h"' newline ...
];

set_param(block, 'SimCustomHeaderFile', SimCustomHeaderFile)

SimCustomSourceFile = [
fullfile(pcode_dir, 'sii_block_interface.c') newline ...
fullfile(pcode_dir, 'galec_stl.c') newline ...
fullfile(pcode_dir, 'block.c') newline ...
];

set_param(block, 'SimCustomSourceFile', SimCustomSourceFile)

SimCustomSearchDirectory = [
fullfile(pcode_dir, '.') newline ...
];

set_param(block, 'SimCustomSearchDirectory', SimCustomSearchDirectory)

symbols = get_param(block, 'SymbolSpec');

% parameters

symbol = addSymbol(symbols, 'Kw');
symbol.Type  = 'single';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'Kw';

symbol = addSymbol(symbols, 'T1');
symbol.Type  = 'single';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'T1';

symbol = addSymbol(symbols, 'T2');
symbol.Type  = 'single';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'T2';

symbol = addSymbol(symbols, 'T3');
symbol.Type  = 'single';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'T3';

symbol = addSymbol(symbols, 'T4');
symbol.Type  = 'single';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'T4';

symbol = addSymbol(symbols, 'Tw');
symbol.Type  = 'single';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'Tw';

symbol = addSymbol(symbols, 'vSI_start');
symbol.Type  = 'single';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'vSI_start';

symbol = addSymbol(symbols, 'vsmax');
symbol.Type  = 'single';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'vsmax';

symbol = addSymbol(symbols, 'vsmin');
symbol.Type  = 'single';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'vsmin';

% inputs

symbol = addSymbol(symbols, 'vSI');
symbol.Type  = 'single';
symbol.Size  = '1';
symbol.Scope = 'Input';
symbol.Label = 'vSI';

% outputs

symbol = addSymbol(symbols, 'vs');
symbol.Type  = 'single';
symbol.Size  = '1';
symbol.Scope = 'Output';
symbol.Label = 'vs';

% block parameters
set_param(block, 'Kw', '9.5');
set_param(block, 'T1', '1.53999999999999998e-1');
set_param(block, 'T2', '3.30000000000000016e-2');
set_param(block, 'T3', '1.0');
set_param(block, 'T4', '1.0');
set_param(block, 'Tw', '1.40999999999999992');
set_param(block, 'vSI_start', '1.0');
set_param(block, 'vsmax', '2.00000000000000011e-1');
set_param(block, 'vsmin', '-2.00000000000000011e-1');

end