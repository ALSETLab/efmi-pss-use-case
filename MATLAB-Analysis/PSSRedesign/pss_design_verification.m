%% PSS Design Verification with Linearized Power System Model
% This script verifies the design of the PSS by analyzing the linearized model of the 
% power system before and after the design of the PSS. It extracts the eigenvalues, 
% natural frequencies, and damping ratios of the modes, and compares the results to 
% confirm that the design of the PSS has achieved the desired improvement in damping for the targeted mode.
%
% Author: Luigi Vanfretti
% Date: April 2026
%
clear; clc;
% Always write diary next to this script (independent of MATLAB current folder).
thisFile = mfilename('fullpath');
if isempty(thisFile)
    thisFile = which('pss_design_verification.m');
end
scriptDir = fileparts(thisFile);
diaryFile = fullfile(scriptDir, 'pss_design_verification_diary.txt');
diary(diaryFile);
cleanupDiary = onCleanup(@() diary('off')); % Ensure diary is closed even if an error occurs
fprintf('Diary logging to: %s\n', diaryFile);
%% Analyze the linearized model 
% The power system is analyzed before applying the PSS, and then after the design of the PSS, 
% to verify if the designed parameters meet the damping requirements.
%
% The linear model is obtained in Dymola from the model:
% OpenIPSL_CHIL.Examples.ReDesign.IOModelforReDesign
% and then saved in the 'dslin.mat' file, which is loaded below.
%
% Load the linearized model before the design of the PSS, which is stored in a .mat file.
[A, B, C, D, stateVars, inputVars, outputVars] = ...
    linearized_model_dymola('dslin.mat');
% Create a "ss" object containing the model of the power
% system from the linearized model
PS = ss(A,B,C,D,'StateName',stateVars,'InputName',inputVars,'OutputName',outputVars);

% Extract Eigenvalues, 
[M,E] = eig(A);
eig_a = diag(E);
[wn,Z,P] = damp(PS);

% Calculate natural frequencies (fn) in Hz from wn
fn = wn / (2 * pi);

% Define indices of local mode for table
lmindx = 5:6; % To find these indices, we can look at the eigenvalues and identify the ones that correspond to the local mode of interest, which typically have a certain frequency range and damping ratio. In this case, we are interested in the modes that are around 1.45 Hz with a damping ratio of around 27%, which are likely to be the local modes of interest for the PSS design.

% Create a table with eigenvalues, natural frequencies, damping ratios, and poles
fprintf('Dominant mode before the design of the PSS:\n');
resultsTable = table(eig_a(lmindx), wn(lmindx), fn(lmindx), Z(lmindx)*100, ...
    'VariableNames', {'Eigenvalues', 'NaturalFrequency_rad_s', 'NaturalFrequency_Hz', 'DampingRatio'});
% Display the results table
format bank
disp(resultsTable);

%% Verify the re-design of the PSS by analyzing the linearized model after the design of the PSS
% The linearized model after the design of the PSS is obtained in Dymola from the model:
% OpenIPSL_CHIL.Examples.ReDesign.PSSReDesignVerification
% and then saved in the 'dslin_verify.mat' file, which is loaded below.
%
% Load the linearized model obtained with Dymola
[A, B, C, D, stateVars, inputVars, outputVars] = ...
    linearized_model_dymola('dslin_verify.mat');

% Create a "ss" object containing the model of the power
% system from the linearized model
PSSDes = ss(A,B,C,D,'StateName',stateVars,'InputName',inputVars,'OutputName',outputVars);

% Extract Eigenvalues, 
[M,E] = eig(A);
eig_a = diag(E);
[wn,Z,P] = damp(PSSDes);

% Calculate natural frequencies (fn) in Hz from wn
fn = wn / (2 * pi);

% Create a table with eigenvalues, natural frequencies, damping ratios...
fprintf('Dominant mode after the design of the PSS:\n');
resultsTable = table(eig_a(:), wn(:), fn(:), Z(:)*100, ...
    'VariableNames', {'Eigenvalues', 'NaturalFrequency_rad_s', 'NaturalFrequency_Hz', 'DampingRatio'});
% Display the results table
format bank
disp(resultsTable);

% Recall from the RL of the designed PSS, that we selected a gain
% that will give us a mode with damping about ~27% and freq ~1.45 Hz
%
% Looking at the table define closed loop local mode indixes 
lmindxCL = 7:8;

%% Display table only for the targeted mode

% Filter the results table for the closed loop local modes
targetedResultsTable = resultsTable(lmindxCL, :);
disp(targetedResultsTable);
% Display the damping ratio and natural frequency of the targeted mode
fprintf('Targeted mode frequency: %.2f Hz with damping: %.2f%%\n', ...
    targetedResultsTable.NaturalFrequency_Hz(1), targetedResultsTable.DampingRatio(1));
%
% Note:
% The frequency we observe in the table is 1.45 Hz with a 
% damping of 26.77%, just slightly less than the 27% we observed in the RL plot, which is 
% expected due to the approximations due to linearization. Overall, this confirms that the design of the PSS has achieved the desired 
% improvement in damping for the targeted mode.
diary off
clear cleanupDiary
% eof