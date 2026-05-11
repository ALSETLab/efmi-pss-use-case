%% Compare Simulated vs. Measured Bode Plots
% Joe Pizzimenti
% Date: April 2026

clc; clear all; close all;

%% Plant
meas_plant = readmatrix('measured_plant_network.csv');
sim_plant  = readmatrix('simulated_plant_dymola.csv');

fig1 = figure('Name', 'Plant Comparison', 'Position', [100, 100, 900, 700]);

% Magnitude Subplot
subplot(2, 1, 1);
semilogx(meas_plant(:,1), meas_plant(:,2), 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_plant(:,1), sim_plant(:,2), '--', 'LineWidth', 2.5, 'DisplayName', 'Dymola Simulated');
hold off;
grid on;
title('Uncompensated Plant: Magnitude Response', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Magnitude (dB)', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'southwest', 'FontSize', 12);
xlim([0.01, 100]);

% Phase Subplot
subplot(2, 1, 2);
semilogx(meas_plant(:,1), meas_plant(:,3), 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_plant(:,1), sim_plant(:,3), '--', 'LineWidth', 2.5, 'DisplayName', 'Dymola Simulated');
hold off;
grid on;
title('Uncompensated Plant: Phase Response', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Frequency (Hz)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Phase (Degrees)', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'southwest', 'FontSize', 12);
xlim([0.01, 100]);

linkaxes(findobj(fig1, 'Type', 'axes'), 'x');


%% PSS
meas_pss = readmatrix('measured_PSS_network.csv');
sim_pss  = readmatrix('simulated_pss_dymola.csv');

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
semilogx(meas_full(:,1), meas_full(:,3), 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
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