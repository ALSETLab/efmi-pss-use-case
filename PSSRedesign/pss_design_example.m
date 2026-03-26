% Perform PSS design for the linear model of the SMIB
% obtained from OpenIPSL_CHIL.Examples.ReDesign.GenAVRIOReDesign 
% model using Root-Locus Method
clear; clc;
%% RL Step 1 - Obtain linear model and analyze modes
% Load the linearized model obtained with Dymola, which is stored in a .mat file. 
% The linearized model is represented in state-space form, where A, B, C, and D are the state-space matrices, and stateVars, inputVars, and outputVars are the names of the states, inputs, and outputs respectively.
% The function linearized_model_dymola reads the .mat file and extracts the necessary information to construct the state-space representation of the system. The resulting state-space model is stored in the variable PS, 
% which can be used for further analysis and design of the Power System Stabilizer (PSS).
[A, B, C, D, stateVars, inputVars, outputVars] = ...
    linearized_model_dymola('dslin.mat');
% Create a "ss" object containing the model of the power
% system from the linearized model
PS = ss(A,B,C,D,'StateName',stateVars,'InputName',inputVars,'OutputName',outputVars)

%% Extract Eigenvalues, 
[M,E] = eig(A);
eig_a = diag(E);
[wn,Z,P] = damp(PS);

% Calculate natural frequencies (fn) in Hz from wn
fn = wn / (2 * pi);

% Create a table with eigenvalues, natural frequencies, damping ratios, and poles
resultsTable = table(eig_a, wn, fn, Z*100, ...
    'VariableNames', {'Eigenvalues', 'NaturalFrequency_rad_s', 'NaturalFrequency_Hz', 'DampingRatio'});
% Display the results table
format bank
disp(resultsTable);

%% Connect the power system to the filters
% Low-pass filter for measurement noise suppression
% The low-pass filter is designed to have a cutoff frequency of 20 Hz, which is sufficient to suppress high-frequency noise while 
% allowing the relevant dynamics of the system to pass through.
fc = 5.0; % Cutoff frequency in Hz
w_cutoff = 2 * pi * fc; % Convert cutoff frequency to rad/s

% The Modelica simulation model is implemented as: der(x) = (u-x)/T and y = K*x, where T is the time constant of the low-pass filter
% and K is the gain of the low-pass filter. The time constant T determines how quickly the filter responds to changes in the input 
% signal, and it is inversely related to the cutoff frequency.
%
% The corresponding transfer function of the low-pass filter can be derived from the Modelica implementation as follows:
% The transfer function of the low-pass filter can be expressed as:
% H(s) = K / (T*s + 1)
% To achieve the desired cutoff frequency, we can set the time constant T to be equal to 1/(2*pi*fc), which gives us:
T = 1 / w_cutoff; % Time constant of the low-pass filter
K = 1; % Gain of the low-pass filter
lpf = tf(K, [T 1], 'InputName', 'u_lpf', ...
                            'OutputName', 'y_lpf', ...
                            'Name', 'lpf');
% Wash-out filter
Tw = 0.25; % WO time constant
whasout = tf([Tw 0],[Tw 1],'InputName','u_wof',...
                            'OutputName','y_wof',...
                            'Name','wof');

% Take into account the scaling of the input signal as done in the PSS
% model developed for eFMI export
wscale = 10;

% Connect the filters to the PS model                         
PSwo = (1/wscale)*lpf*whasout*PS % Connects filters to PS model

%% RL Step 2: Obtain the root locus plot
figure(101)
rlp = rlocusplot(-PSwo);
rlp.FrequencyUnit = "Hz";
axis([-5 1 -2 10])
grid on

%% RL Step 3: Analyze the root locus plot
% Looking at the plot, the angle of departure is around:
theta_dep = 33;
fprintf('Looking at the root locus plot, the angle of departure is around: %d degrees\n', theta_dep);

%% RL Step 4: Calculate Theta Peak
theta_peak = (180 - theta_dep)/2

%% RL Steps 5: Find the angle \alpha_ld
lead_angle = theta_peak/2 % Max for lead network
% Note that theta_peak is ~90 deg, thus, we can set 2 lead compensators with 45 deg each
% this is the maximum lead angle that can be obtained with a lead compensator.
lead_angle = 45
fprintf('The lead angle is set to: %d degrees\n', lead_angle);

%% RL Step 6: Find time constants from local mode freq
wlm = wn(6) % local mode is about 8 rad/sec
alpha = (1+sind(lead_angle))/(1-sind(lead_angle))
z_pss = wlm/sqrt(alpha), p_pss = wlm*sqrt(alpha)
T1 = 1/z_pss
T2 = 1/p_pss
leadlag = tf([T1 1],[T2 1])

%% RL Step 7: Determine the Kpss from RL including ld/lg
PSwo_leadlag = PSwo*leadlag*leadlag

figure(102)
rlp = rlocusplot(-PSwo_leadlag);
rlp.FrequencyUnit = "Hz";
axis([-5 1 -1 15])

% For maximum damping, the gain found is
Kpss = 7.4

%% List your design parameters for the Design:
% Display the design parameters
% Set the display format to show more digits
format long g
designParameters = table(T1, T2, Kpss, 'VariableNames', {'T1', 'T2', 'Kpss'});
disp(designParameters);
disp('Enter the parameters above in your PSS in OpenModelica, and verify in simulation.')
% After Obtaining the new Linear Model with the PSS from the Dymola model, you can also verify the new damping of the local mode.
% The new linear model can be obtained by linearizing the Dymola model with the PSS implemented, and 
% then analyzing the eigenvalues of the new linear model to determine the damping of the local mode.
% To verify what is the new damping of ~27% with the design, look at the separte file.
% eof