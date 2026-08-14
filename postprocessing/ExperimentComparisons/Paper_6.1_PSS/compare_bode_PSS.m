%% Compare Simulated vs. Measured Bode Plots
% Joe Pizzimenti
% Date: April 2026
% Modified by Luigi Vanfretti, 2026-05-13

clc; clear all;

%% PSS
script_dir = fileparts(mfilename('fullpath'));
meas_pss = readmatrix(fullfile(script_dir, 'measured_PSS_network.csv'));
sim_pss  = readmatrix(fullfile(script_dir, 'simulated_PSS_dymola.csv'));

fig2 = figure('Name', 'PSS Comparison', 'Position', [150, 150, 900/2, 700/2]);
set(fig2, 'DefaultAxesFontName', 'Times New Roman', 'DefaultTextFontName', 'Times New Roman');

% Magnitude Subplot
subplot(2, 1, 1);
semilogx(meas_pss(:,1), meas_pss(:,2), 'b', 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_pss(:,1), sim_pss(:,2), 'r-.', 'LineWidth', 2.5, 'DisplayName', 'Dymola Linearized Model');
hold off;
grid on;
title('(A) Power System Stabilizer: Magnitude Response', 'FontSize', 12);
ylabel('Magnitude (dB)', 'FontSize', 12);
legend('Location', 'southwest', 'FontSize', 10);
xlim([0.01, 100]);

% Phase Subplot
subplot(2, 1, 2);
semilogx(meas_pss(:,1), meas_pss(:,3), 'b', 'LineWidth', 2.5, 'DisplayName', 'Hardware Measured');
hold on;
semilogx(sim_pss(:,1), sim_pss(:,3), 'r-.', 'LineWidth', 2.5, 'DisplayName', 'Dymola Linearized Model');
hold off;
grid on;
title('(B) Power System Stabilizer: Phase Response', 'FontSize', 12);
xlabel('Frequency (Hz)', 'FontSize', 12);
ylabel('Phase (Degrees)', 'FontSize', 12);
legend('Location', 'southwest', 'FontSize', 10);
xlim([0.01, 100]);

linkaxes(findobj(fig2, 'Type', 'axes'), 'x');
set(findall(fig2, '-property', 'FontName'), 'FontName', 'Times New Roman');