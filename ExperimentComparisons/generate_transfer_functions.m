%% Transfer Function Estimation from Bode CSV Data
% Joe Pizzimenti
% Date: April 2026

clc; clear all; close all;

%% Load the CSV Data (Full Closed-Loop System)
meas_data = readmatrix('measured_full_system_network.csv');
sim_data  = readmatrix('simulated_full_system_dymola.csv');

%poles and zeros chosen to make it accurate enough without an ugly equation
num_poles = 5; 
num_zeros = 3; 

%% function to generate transfer function
function estimated_tf = estimate_tf_from_bode(data_matrix, np, nz)
    % Extract columns
    f_hz = data_matrix(:, 1);
    mag_db = data_matrix(:, 2);
    phase_deg = data_matrix(:, 3);
    
    % Convert to units required by the given functions
    w_rad = f_hz * 2 * pi;  % Hz to rad/s
    mag_abs = 10.^(mag_db / 20);    % dB to absolute magnitude
    phase_rad = phase_deg * (pi / 180); % Degrees to radians
    
    complex_response = mag_abs .* exp(1i * phase_rad);
    
    % Create an Identified Frequency Response Data (idfrd) object
    sys_frd = idfrd(complex_response, w_rad, 0); % The '0' specifies that this is continuous-time (Ts = 0)
    
    % Estimate the transfer function
    estimated_tf = tfest(sys_frd, np, nz);
end


disp('--- Estimating Measured Hardware Transfer Function ---');
tf_measured = estimate_tf_from_bode(meas_data, num_poles, num_zeros)

disp('--- Estimating Simulated Dymola Transfer Function ---');
tf_simulated = estimate_tf_from_bode(sim_data, num_poles, num_zeros)

%% Plot Results
fig = figure('Name', 'Transfer Function Fit Verification', 'Position', [100, 100, 900, 600]);

% Convert the estimated transfer functions back to Bode data for plotting
w_plot = logspace(log10(0.15*2*pi), log10(15*2*pi), 500);
[mag_meas_fit, ~] = bode(tf_measured, w_plot);
[mag_sim_fit, ~]  = bode(tf_simulated, w_plot);

% Plot Hardware Measured vs Fit
subplot(1,2,1);
semilogx(meas_data(:,1), meas_data(:,2), 'o', 'MarkerSize', 5, 'DisplayName', 'Raw AD2 Data');
hold on;
semilogx(w_plot/(2*pi), 20*log10(squeeze(mag_meas_fit)), 'LineWidth', 2.5, 'DisplayName', 'tfest() G(s) Fit');
grid on;
title('Hardware: Raw Data vs. Estimated G(s)');
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
legend('Location', 'southwest');

% Plot Dymola Simulated vs Fit
subplot(1,2,2);
semilogx(sim_data(:,1), sim_data(:,2), 'o', 'MarkerSize', 5, 'DisplayName', 'Raw Dymola Data');
hold on;
semilogx(w_plot/(2*pi), 20*log10(squeeze(mag_sim_fit)), 'LineWidth', 2.5, 'DisplayName', 'tfest() G(s) Fit');
grid on;
title('Simulation: Raw Data vs. Estimated G(s)');
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
legend('Location', 'southwest');