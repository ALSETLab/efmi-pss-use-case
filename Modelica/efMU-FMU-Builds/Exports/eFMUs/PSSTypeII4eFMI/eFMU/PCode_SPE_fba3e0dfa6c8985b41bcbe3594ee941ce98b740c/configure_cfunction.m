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
'sii_Startup_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();' newline ...
'' newline ...
'#ifdef RT' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.Kw = Kw;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T1 = T1;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T2 = T2;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T3 = T3;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T4 = T4;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.Tw = Tw;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vSI_start = vSI_start;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vsmax = vsmax;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vsmin = vsmin;' newline ...
'#else' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.Kw = Kw;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T1 = T1;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T2 = T2;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T3 = T3;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.T4 = T4;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.Tw = Tw;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vSI_start = vSI_start;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vsmax = vsmax;' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vsmin = vsmin;' newline ...
'#endif' newline ...
'' newline ...
'sii_Recalibrate_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();' newline ...
'' newline ...
'#ifdef RT' newline ...
'vs = block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vs;' newline ...
'#else' newline ...
'vs = block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vs;' newline ...
'#endif' newline ...
];

set_param(block, 'StartCode', StartCode);

OutputCode = [
'#ifdef RT' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vSI = vSI;' newline ...
'#else' newline ...
'block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vSI = vSI;' newline ...
'#endif' newline ...
'' newline ...
'sii_DoStep_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c();' newline ...
'' newline ...
'#ifdef RT' newline ...
'vs = block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vs;' newline ...
'#else' newline ...
'vs = block_state_H9afd54c31629c3b9b38b82c0e527e0842907ae86_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c.vs;' newline ...
'#endif' newline ...
];

set_param(block, 'OutputCode', OutputCode);

SimCustomHeaderFile = [
'#include "sii_block_interface.h"' newline ...
];

set_param(block, 'SimCustomHeaderFile', SimCustomHeaderFile)

SimCustomSourceFile = [
fullfile(pcode_dir, 'block.c') newline ...
fullfile(pcode_dir, 'sii_block_interface.c') newline ...
fullfile(pcode_dir, 'galec_stl.c') newline ...
];

set_param(block, 'SimCustomSourceFile', SimCustomSourceFile)

SimCustomSearchDirectory = [
fullfile(pcode_dir, '.') newline ...
];

set_param(block, 'SimCustomSearchDirectory', SimCustomSearchDirectory)

symbols = get_param(block, 'SymbolSpec');

% parameters

symbol = addSymbol(symbols, 'Kw');
symbol.Type  = 'double';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'Kw';

symbol = addSymbol(symbols, 'T1');
symbol.Type  = 'double';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'T1';

symbol = addSymbol(symbols, 'T2');
symbol.Type  = 'double';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'T2';

symbol = addSymbol(symbols, 'T3');
symbol.Type  = 'double';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'T3';

symbol = addSymbol(symbols, 'T4');
symbol.Type  = 'double';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'T4';

symbol = addSymbol(symbols, 'Tw');
symbol.Type  = 'double';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'Tw';

symbol = addSymbol(symbols, 'vSI_start');
symbol.Type  = 'double';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'vSI_start';

symbol = addSymbol(symbols, 'vsmax');
symbol.Type  = 'double';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'vsmax';

symbol = addSymbol(symbols, 'vsmin');
symbol.Type  = 'double';
symbol.Size  = '1';
symbol.Scope = 'Parameter';
symbol.Label = 'vsmin';

% inputs

symbol = addSymbol(symbols, 'vSI');
symbol.Type  = 'double';
symbol.Size  = '1';
symbol.Scope = 'Input';
symbol.Label = 'vSI';

% outputs

symbol = addSymbol(symbols, 'vs');
symbol.Type  = 'double';
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