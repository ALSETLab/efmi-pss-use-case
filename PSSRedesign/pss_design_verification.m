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

% Create a table with eigenvalues, natural frequencies, damping ratios, and poles
fprintf('Dominant mode before the design of the PSS:\n');
resultsTable = table(eig_a(4:5), wn(4:5), fn(4:5), Z(4:5)*100, ...
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
resultsTable = table(eig_a(7:8), wn(7:8), fn(7:8), Z(7:8)*100, ...
    'VariableNames', {'Eigenvalues', 'NaturalFrequency_rad_s', 'NaturalFrequency_Hz', 'DampingRatio'});
% Display the results table
format bank
disp(resultsTable);

% Recall from the RL of the designed PSS, that we selected a gain
% that will give us a mode with damping about 15% and freq ~0.78 Hz
% Looking at the table that corresponds to the 4.88 rad/s mode with a 
% damping of ~15.23
% eof