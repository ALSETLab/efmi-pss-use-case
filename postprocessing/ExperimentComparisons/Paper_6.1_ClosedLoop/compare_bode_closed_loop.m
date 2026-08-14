%% Compare Simulated vs. Measured Bode Plots
% Joe Pizzimenti
% Date: April 2026
% Modified by Luigi Vanfretti, 2026-05-13

clc; clear all;

%% Full Closed-Loop System
script_dir = fileparts(mfilename('fullpath'));
meas_full = readmatrix(fullfile(script_dir, 'measured_closed_loop_network.csv'));
sim_full  = readmatrix(fullfile(script_dir, 'simulated_closed_loop_dymola.csv'));

fig3 = figure('Name', 'Closed-Loop System Comparison', 'Position', [200, 200, 900/2, 700/2]);
set(fig3, 'DefaultAxesFontName', 'Times New Roman', 'DefaultTextFontName', 'Times New Roman');

% Magnitude Subplot
subplot(2, 1, 1);
semilogx(meas_full(:,1), meas_full(:,2), 'b', 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_full(:,1), sim_full(:,2), 'r-.', 'LineWidth', 2.5, 'DisplayName', 'Dymola Linearized Model');
hold off;
grid on;
title('(A) Closed-Loop System: Magnitude Response', 'FontSize', 12);
ylabel('Magnitude (dB)', 'FontSize', 12);
legend('Location', 'southwest', 'FontSize', 10);
xlim([0.01, 100]);

% Phase Subplot
subplot(2, 1, 2);
% Unwrap measured phase
meas_phase_unwrapped = rad2deg(unwrap(deg2rad(meas_full(:,3))))+360;

semilogx(meas_full(:,1), meas_phase_unwrapped, ...
    'b', ...
    'LineWidth', 2.5, ...
    'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_full(:,1), sim_full(:,3), 'r-.', 'LineWidth', 2.5, 'DisplayName', 'Dymola Linearized Model');
hold off;
grid on;
title('(B) Closed-Loop System: Phase Response', 'FontSize', 12);
xlabel('Frequency (Hz)', 'FontSize', 12);
ylabel('Phase (Degrees)', 'FontSize', 12);
legend('Location', 'southwest', 'FontSize', 10);
xlim([0.01, 100]);

linkaxes(findobj(fig3, 'Type', 'axes'), 'x');
set(findall(fig3, '-property', 'FontName'), 'FontName', 'Times New Roman');