%% Compare Simulated vs. Measured Bode Plots
% Joe Pizzimenti
% Date: April 2026
% This script compares AD2 hardware measurements with theoretical Dymola
% simulations across three test cases: Plant, PSS, and Full System.

clc; clear all; close all;

%% ========================================================================
%  FIGURE 1: THE UNCOMPENSATED PLANT
%  ========================================================================
% Load Data
meas_plant = readmatrix('measured_Plant_network.csv');
sim_plant  = readmatrix('simulated_plant_dymola.csv');

fig1 = figure('Name', '1. Plant Comparison', 'Position', [100, 100, 900, 700]);

% Magnitude Subplot
subplot(2, 1, 1);
semilogx(meas_plant(:,1), meas_plant(:,2), 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_plant(:,1), sim_plant(:,2), '--', 'LineWidth', 2.5, 'DisplayName', 'Dymola Simulated');
hold off;
grid on;
title('1. Uncompensated Plant: Magnitude Response', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Magnitude (dB)', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'southwest', 'FontSize', 12);
xlim([0.15, 15]);

% Phase Subplot
subplot(2, 1, 2);
semilogx(meas_plant(:,1), meas_plant(:,3), 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_plant(:,1), sim_plant(:,3), '--', 'LineWidth', 2.5, 'DisplayName', 'Dymola Simulated');
hold off;
grid on;
title('1. Uncompensated Plant: Phase Response', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Frequency (Hz)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Phase (Degrees)', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'southwest', 'FontSize', 12);
xlim([0.15, 15]);

linkaxes(findobj(fig1, 'Type', 'axes'), 'x');

%% ========================================================================
%  FIGURE 2: THE POWER SYSTEM STABILIZER (PSS)
%  ========================================================================
% Load Data
meas_pss = readmatrix('measured_PSS_network.csv');
sim_pss  = readmatrix('simulated_pss_dymola.csv');

fig2 = figure('Name', '2. PSS Comparison', 'Position', [150, 150, 900, 700]);

% Magnitude Subplot
subplot(2, 1, 1);
semilogx(meas_pss(:,1), meas_pss(:,2), 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_pss(:,1), sim_pss(:,2), '--', 'LineWidth', 2.5, 'DisplayName', 'Dymola Simulated');
hold off;
grid on;
title('2. Power System Stabilizer: Magnitude Response', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Magnitude (dB)', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'southwest', 'FontSize', 12);
xlim([0.15, 15]);

% Phase Subplot
subplot(2, 1, 2);
semilogx(meas_pss(:,1), meas_pss(:,3), 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_pss(:,1), sim_pss(:,3), '--', 'LineWidth', 2.5, 'DisplayName', 'Dymola Simulated');
hold off;
grid on;
title('2. Power System Stabilizer: Phase Response', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Frequency (Hz)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Phase (Degrees)', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'southwest', 'FontSize', 12);
xlim([0.15, 15]);

linkaxes(findobj(fig2, 'Type', 'axes'), 'x');

%% ========================================================================
%  FIGURE 3: THE FULL CLOSED-LOOP SYSTEM
%  ========================================================================
% Load Data
meas_full = readmatrix('measured_full_system_network.csv');
sim_full  = readmatrix('simulated_full_system_dymola.csv');

fig3 = figure('Name', '3. Closed-Loop System Comparison', 'Position', [200, 200, 900, 700]);

% Magnitude Subplot
subplot(2, 1, 1);
semilogx(meas_full(:,1), meas_full(:,2), 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_full(:,1), sim_full(:,2), '--', 'LineWidth', 2.5, 'DisplayName', 'Dymola Simulated');
hold off;
grid on;
title('3. Closed-Loop System: Magnitude Response', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Magnitude (dB)', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'southwest', 'FontSize', 12);
xlim([0.15, 15]);

% Phase Subplot
subplot(2, 1, 2);
semilogx(meas_full(:,1), meas_full(:,3), 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_full(:,1), sim_full(:,3), '--', 'LineWidth', 2.5, 'DisplayName', 'Dymola Simulated');
hold off;
grid on;
title('3. Closed-Loop System: Phase Response', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Frequency (Hz)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Phase (Degrees)', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'southwest', 'FontSize', 12);
xlim([0.15, 15]);

linkaxes(findobj(fig3, 'Type', 'axes'), 'x');