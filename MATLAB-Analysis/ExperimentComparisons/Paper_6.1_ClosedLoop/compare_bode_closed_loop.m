%% Compare Simulated vs. Measured Bode Plots
% Joe Pizzimenti
% Date: April 2026

clc; clear all; close all;

%% Full Closed-Loop System
meas_full = readmatrix('measured_closed_loop_network.csv');
sim_full  = readmatrix('simulated_closed_loop_dymola.csv');

fig3 = figure('Name', 'Closed-Loop System Comparison', 'Position', [200, 200, 900, 700]);

% Magnitude Subplot
subplot(2, 1, 1);
semilogx(meas_full(:,1), meas_full(:,2), 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_full(:,1), sim_full(:,2), '--', 'LineWidth', 2.5, 'DisplayName', 'Dymola Simulated');
hold off;
grid on;
title('Closed-Loop System: Magnitude Response', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Magnitude (dB)', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'southwest', 'FontSize', 12);
xlim([0.01, 100]);

% Phase Subplot
subplot(2, 1, 2);
% Unwrap measured phase
meas_phase_unwrapped = rad2deg(unwrap(deg2rad(meas_full(:,3))))+360;

semilogx(meas_full(:,1), meas_phase_unwrapped, ...
    'LineWidth', 2.5, ...
    'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_full(:,1), sim_full(:,3), '--', 'LineWidth', 2.5, 'DisplayName', 'Dymola Simulated');
hold off;
grid on;
title('Closed-Loop System: Phase Response', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Frequency (Hz)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Phase (Degrees)', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'southwest', 'FontSize', 12);
xlim([0.01, 100]);

linkaxes(findobj(fig3, 'Type', 'axes'), 'x');