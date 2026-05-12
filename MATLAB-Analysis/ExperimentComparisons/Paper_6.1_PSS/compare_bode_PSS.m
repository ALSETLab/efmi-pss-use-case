%% Compare Simulated vs. Measured Bode Plots
% Joe Pizzimenti
% Date: April 2026

clc; clear all; close all;

%% PSS
meas_pss = readmatrix('measured_PSS_network.csv');
sim_pss  = readmatrix('simulated_PSS_dymola.csv');

fig2 = figure('Name', 'PSS Comparison', 'Position', [150, 150, 900, 700]);

% Magnitude Subplot
subplot(2, 1, 1);
semilogx(meas_pss(:,1), meas_pss(:,2), 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_pss(:,1), sim_pss(:,2), '--', 'LineWidth', 2.5, 'DisplayName', 'Dymola Simulated');
hold off;
grid on;
title('Power System Stabilizer: Magnitude Response', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Magnitude (dB)', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'southwest', 'FontSize', 12);
xlim([0.01, 100]);

% Phase Subplot
subplot(2, 1, 2);
semilogx(meas_pss(:,1), meas_pss(:,3), 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_pss(:,1), sim_pss(:,3), '--', 'LineWidth', 2.5, 'DisplayName', 'Dymola Simulated');
hold off;
grid on;
title('Power System Stabilizer: Phase Response', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Frequency (Hz)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Phase (Degrees)', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'southwest', 'FontSize', 12);
xlim([0.01, 100]);

linkaxes(findobj(fig2, 'Type', 'axes'), 'x');