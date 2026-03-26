%% PSS Design Verification with Linearized Model
clear; clc;
%% Analyze the linearized model of the power system before the design of the PSS, and then after the design of the PSS, to verify the design of the PSS.
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
lmindx = 5:6;

% Create a table with eigenvalues, natural frequencies, damping ratios, and poles
fprintf('Dominant mode before the design of the PSS:\n');
resultsTable = table(eig_a(lmindx), wn(lmindx), fn(lmindx), Z(lmindx)*100, ...
    'VariableNames', {'Eigenvalues', 'NaturalFrequency_rad_s', 'NaturalFrequency_Hz', 'DampingRatio'});
% Display the results table
format bank
disp(resultsTable);

%% Verify the re-design of the PSS by analyzing the linearized model after the design of the PSS
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

% Looking at the table define closed loop local mode indixes 
lmindxCL = 7:8;

%% Display table only for the targeted mode

% Filter the results table for the closed loop local modes
targetedResultsTable = resultsTable(lmindxCL, :);
disp(targetedResultsTable);
% Display the damping ratio and natural frequency of the targeted mode
fprintf('Targeted mode frequency: %.2f Hz with damping: %.2f%%\n', ...
    targetedResultsTable.NaturalFrequency_Hz(1), targetedResultsTable.DampingRatio(1));
% The frequency we observe in the table is 1.45 Hz with a 
% damping of 26.77%
% eof