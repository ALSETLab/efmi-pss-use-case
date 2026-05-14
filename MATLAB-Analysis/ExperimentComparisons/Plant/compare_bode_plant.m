%% Compare Simulated vs. Measured Bode Plots
% Joe Pizzimenti
% Date: April 2026
% Modified by Luigi Vanfretti, 2026-05-13

clc; clear all;

%% Plant
script_dir = fileparts(mfilename('fullpath'));
meas_plant = readmatrix(fullfile(script_dir, 'measured_Plant_network.csv'));
sim_plant  = readmatrix(fullfile(script_dir, 'simulated_plant_dymola.csv'));

fig1 = figure('Name', 'Plant Comparison', 'Position', [100, 100, 900/2, 700/2]);
set(fig1, 'DefaultAxesFontName', 'Times New Roman', 'DefaultTextFontName', 'Times New Roman');

% Magnitude Subplot
subplot(2, 1, 1);
semilogx(meas_plant(:,1), meas_plant(:,2), 'b', 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_plant(:,1), sim_plant(:,2), 'r-.', 'LineWidth', 2.5, 'DisplayName', 'Dymola Linearized Model');
hold off;
grid on;
title('(A) Plant: Magnitude Response', 'FontSize', 12);
ylabel('Magnitude (dB)', 'FontSize', 12);
legend('Location', 'southwest', 'FontSize', 10);
xlim([0.01, 100]);

% Phase Subplot
subplot(2, 1, 2);
% Unwrap measured phase
meas_phase_unwrapped = rad2deg(unwrap(deg2rad(meas_plant(:,3))))+360;

semilogx(meas_plant(:,1), meas_phase_unwrapped, 'b', 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_plant(:,1), sim_plant(:,3), 'r-.', 'LineWidth', 2.5, 'DisplayName', 'Dymola Linearized Model');
hold off;
grid on;
title('(B) Plant: Phase Response', 'FontSize', 12);
xlabel('Frequency (Hz)', 'FontSize', 12);
ylabel('Phase (Degrees)', 'FontSize', 12);
legend('Location', 'southwest', 'FontSize', 10);
xlim([0.01, 100]);

linkaxes(findobj(fig1, 'Type', 'axes'), 'x');
set(findall(fig1, '-property', 'FontName'), 'FontName', 'Times New Roman');