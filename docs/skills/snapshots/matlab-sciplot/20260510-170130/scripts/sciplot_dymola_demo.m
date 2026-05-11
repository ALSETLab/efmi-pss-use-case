%% sciplot_dymola_demo.m
%
% Integration demo: Dymola simulation → sciplot publication figures
%
% Skills used:
%   /skill dymola-matlab-api  — DDE simulation, dymload, dymget
%   /skill matlab-sciplot     — sciplot_init, sciplot_colors, sciplot_export
%
% Model: Modelica.Electrical.Analog.Examples.CauerLowPassAnalog
%   A 5th-order Cauer analogue low-pass filter.
%   Ships with every Dymola installation (Modelica Standard Library).
%   No extra libraries required.
%
% Output (written to ./dymola_demo_output/):
%   dymola_fig1_response.svg   — Fig-4-style: voltage comparison with
%                                shaded difference area + FFT transfer
%                                function estimate (side by side)
%   dymola_fig2_signals.svg    — Fig-5-style: three-panel time-domain
%                                subplot (input / inductor / output)
%
% USAGE
%   1. Open MATLAB (Dymola will be started automatically via DDE)
%   2. Adjust DYMOLA_ROOT and SCIPLOT_ROOT below if needed
%   3. Run:  sciplot_dymola_demo
%
% NOTE
%   If dsres.mat already exists in WORK_DIR the simulation step is skipped
%   so you can re-plot without re-simulating.

%% ── 0. Configuration ────────────────────────────────────────────────────
clear; close all; clc;

DYMOLA_ROOT = 'C:\Program Files\Dymola 2026x Refresh 1';
SCIPLOT_ROOT = fileparts(mfilename('fullpath'));  % same folder as this script
WORK_DIR    = fullfile(tempdir, 'cauer_dymola_demo');

MODEL       = 'Modelica.Electrical.Analog.Examples.CauerLowPassAnalog';
STOP_TIME   = 60;        % seconds — enough to reach steady state
N_INTERVALS = 6000;

%% ── 1. Add required paths ───────────────────────────────────────────────
addpath(fullfile(DYMOLA_ROOT, 'Mfiles'));
addpath(fullfile(DYMOLA_ROOT, 'Mfiles', 'dymtools'));
addpath(fullfile(DYMOLA_ROOT, 'Mfiles', 'traj'));
addpath(SCIPLOT_ROOT);

if ~isfolder(WORK_DIR), mkdir(WORK_DIR); end

dsresFile = fullfile(WORK_DIR, 'dsres.mat');

%% ── 2. Run Dymola simulation (skipped if dsres.mat already exists) ──────
if isfile(dsresFile)
    fprintf('[demo] Found existing %s — skipping simulation.\n', dsresFile);
    fprintf('[demo] Delete the file to force a new simulation.\n\n');
else
    fprintf('[demo] Starting Dymola and running simulation...\n');

    % Change Dymola working directory
    dymola(sprintf('cd("%s");', strrep(WORK_DIR, '\', '/')));

    % Simulate
    dymola(sprintf( ...
        'simulateModel("%s", startTime=0, stopTime=%g, numberOfIntervals=%d, method="Dassl");', ...
        MODEL, STOP_TIME, N_INTERVALS));

    % Confirm the file was created
    if ~isfile(dsresFile)
        error('[demo] Simulation did not produce dsres.mat in %s.\nCheck Dymola''s log window.', WORK_DIR);
    end
    fprintf('[demo] Simulation complete.\n\n');
end

%% ── 3. Load results ─────────────────────────────────────────────────────
fprintf('[demo] Loading results from %s\n', dsresFile);
res = dymload(dsresFile);

t    = dymget(res, 'Time');          % time vector

% Input voltage (step source)
v_in = dymget(res, 'V.v');

% Output voltage (across last capacitor C5)
v_out = dymget(res, 'C5.v');

% Inductor L1 current (first series inductor)
i_L1  = dymget(res, 'L1.i');

fprintf('[demo] Signals loaded: %d samples over %.1f s.\n\n', numel(t), t(end));

%% ── 4. Derived quantities ───────────────────────────────────────────────
% Use the full signal for FFT analysis (with windowing to reduce spectral leakage)
dt  = mean(diff(t));
Fs  = 1 / dt;

% Apply Hamming window to reduce spectral leakage
win = hamming(numel(v_in))';
v_in_win  = v_in .* win;
v_out_win = v_out .* win;

% Compute FFTs
N      = numel(v_in);
half   = 1:floor(N/2);
f_vec  = (0:N-1) * (Fs / N);

Vin_f  = fft(v_in_win);
Vout_f = fft(v_out_win);

% Gain in dB (guard against near-zero denominator)
gainDB = 20*log10(abs(Vout_f(half)) ./ max(abs(Vin_f(half)), 1e-12));

% Use the steady-state window for annotation only (not FFT)
SS_START  = 30;
mask_ss   = t >= SS_START;
t_ss      = t(mask_ss);
vin_ss    = v_in(mask_ss);
vout_ss   = v_out(mask_ss);

%% ── 5. Prepare output folder ────────────────────────────────────────────
OUT_DIR = fullfile(SCIPLOT_ROOT, '..', 'dymola_demo_output');
if ~isfolder(OUT_DIR), mkdir(OUT_DIR); end

%% ════════════════════════════════════════════════════════════════════════
%  FIGURE 1  —  Fig-4 style:  left = shaded voltage comparison,
%                              right = FFT transfer function estimate
%  ════════════════════════════════════════════════════════════════════════
reset(groot);
sciplot_init('science');

colors = sciplot_colors('bright');

fig1 = figure;
fig1.Position(3:4) = [13, 5.5];

% ── Left panel: input vs output with shaded gap ───────────────────────────
ax1a = subplot(1, 2, 1);
hold(ax1a, 'on');

% Shade the gap between input and output (the "rejected" band)
fill(ax1a, [t; flipud(t)], [v_in; flipud(v_out)], colors(6,:), ...
    'FaceAlpha', 0.18, 'EdgeColor', 'none', ...
    'DisplayName', 'Rejected band');

% Plot both voltages
plot(ax1a, t, v_in,  'Color', colors(2,:), 'LineWidth', 1.5, ...
    'DisplayName', '$V_{in}$ (step)');
plot(ax1a, t, v_out, 'Color', colors(1,:), 'LineWidth', 1.5, ...
    'DisplayName', '$V_{out}$ (C5)');

xlabel(ax1a, 'Time (s)');
ylabel(ax1a, 'Voltage (V)');
title(ax1a, 'Cauer Low-Pass --- Step Response');
legend(ax1a, 'Location', 'east');
xlim(ax1a, [0, STOP_TIME]);
ylim(ax1a, [-0.1, 1.25]);

% Annotate steady-state window
xregion(ax1a, SS_START, STOP_TIME, ...
    'FaceColor', [0.85 0.85 0.85], 'FaceAlpha', 0.25, ...
    'EdgeColor', 'none', 'HandleVisibility', 'off');
text(ax1a, SS_START + 1, 1.17, 'FFT window', ...
    'FontSize', 11, 'Color', [0.4 0.4 0.4], 'Interpreter', 'latex');

% ── Right panel: FFT-based transfer function estimate ────────────────────
ax1b = subplot(1, 2, 2);
hold(ax1b, 'on');

% Use only positive frequencies where data is reliable
% (exclude DC and avoid aliasing artifacts above Nyquist/2)
f_min = 1e-4;                    % start just above DC
f_max = min(Fs / 2 * 0.9, 10);   % up to 90% Nyquist or 10 Hz, whichever is lower
f_mask = (f_vec(half) >= f_min) & (f_vec(half) <= f_max);

if sum(f_mask) > 0
    semilogx(ax1b, f_vec(half(f_mask)), gainDB(f_mask), ...
        'Color', colors(5,:), 'LineWidth', 2, ...
        'DisplayName', 'Estimated $|H(f)|$');
else
    warning('[sciplot_dymola_demo] No valid frequency points to plot; check Fs and f_max.');
end

% Theoretical -3 dB line
yline(ax1b, -3, '--', 'Color', [0.5 0.5 0.5], 'LineWidth', 0.8, ...
    'Label', '$-3$ dB', 'Interpreter', 'latex', ...
    'LabelHorizontalAlignment', 'left', 'HandleVisibility', 'off');

xlabel(ax1b, 'Frequency (Hz)');
ylabel(ax1b, 'Gain (dB)');
title(ax1b, 'Transfer Function Estimate (FFT)');
legend(ax1b, 'Location', 'southwest');
ax1b.XGrid = 'on';
ylim(ax1b, [-80, 5]);
if sum(f_mask) > 0
    xlim(ax1b, [f_min, f_max]);
end

out1 = fullfile(OUT_DIR, 'dymola_fig1_response.svg');
sciplot_export(out1, fig1);
fprintf('[demo] Saved %s\n', out1);

%% ════════════════════════════════════════════════════════════════════════
%  FIGURE 2  —  Fig-5 style:  three-panel time-domain subplot
%               Panel 1: input voltage
%               Panel 2: inductor L1 current
%               Panel 3: output voltage with shaded steady-state band
%  ════════════════════════════════════════════════════════════════════════
reset(groot);
sciplot_init('science');

colors = sciplot_colors('bright');

fig2 = figure;
fig2.Position(3:4) = [9, 9];

% ── Panel 1: Input voltage ────────────────────────────────────────────────
ax2a = subplot(3, 1, 1);
hold(ax2a, 'on');
plot(ax2a, t, v_in, 'Color', colors(2,:), 'LineWidth', 1.5);
yline(ax2a, 1.0, '--', 'Color', [0.5 0.5 0.5], 'LineWidth', 0.8, ...
    'HandleVisibility', 'off');
ylabel(ax2a, '$V_{in}$ (V)');
title(ax2a, sprintf('Cauer Low-Pass --- %s', strrep(MODEL, '_', '\_')));
ylim(ax2a, [-0.1, 1.3]);

% ── Panel 2: Inductor L1 current ─────────────────────────────────────────
ax2b = subplot(3, 1, 2);
hold(ax2b, 'on');

% Fill under the curve (area chart)
area(ax2b, t, i_L1, ...
    'FaceColor', colors(3,:), 'FaceAlpha', 0.22, ...
    'EdgeColor', colors(3,:), 'LineWidth', 1.2);

ylabel(ax2b, '$i_{L1}$ (A)');

% ── Panel 3: Output voltage with envelope marker ──────────────────────────
ax2c = subplot(3, 1, 3);
hold(ax2c, 'on');

% Shade the steady-state window
xregion(ax2c, SS_START, STOP_TIME, ...
    'FaceColor', colors(1,:), 'FaceAlpha', 0.10, 'EdgeColor', 'none');

plot(ax2c, t, v_out, 'Color', colors(1,:), 'LineWidth', 1.5);

% Mark the -3 dB settling level (≈0.707 of final value)
v_final = mean(v_out(end-100:end));
yline(ax2c, v_final, '--', 'Color', [0.5 0.5 0.5], 'LineWidth', 0.8, ...
    'Label', sprintf('$V_{ss} = %.3f$ V', v_final), ...
    'Interpreter', 'latex', 'LabelHorizontalAlignment', 'right');

ylabel(ax2c, '$V_{out}$ / C5 (V)');
xlabel(ax2c, 'Time (s)');
ylim(ax2c, [-0.05, 1.2]);

% ── Link axes and tighten layout ─────────────────────────────────────────
linkaxes([ax2a, ax2b, ax2c], 'x');
xlim(ax2a, [0, STOP_TIME]);

compact_subplots_(fig2, [ax2a, ax2b, ax2c]);

out2 = fullfile(OUT_DIR, 'dymola_fig2_signals.svg');
sciplot_export(out2, fig2);
fprintf('[demo] Saved %s\n', out2);

%% ── Summary ─────────────────────────────────────────────────────────────
fprintf('\nDone. Figures written to:\n  %s\n', OUT_DIR);


%% ════════════════════════════════════════════════════════════════════════
%  Local helper — compact vertical subplot spacing
%  ════════════════════════════════════════════════════════════════════════
function compact_subplots_(fig, axList)
    nAx    = numel(axList);
    left   = 0.12;
    width  = 0.84;
    bottom = 0.09;
    top    = 0.93;
    gap    = 0.04;
    totalH = top - bottom;
    panelH = (totalH - gap*(nAx-1)) / nAx;

    for k = 1:nAx
        idx = nAx - k + 1;           % top panel first
        y0  = bottom + (k-1)*(panelH + gap);
        axList(idx).Position = [left, y0, width, panelH];
    end
    drawnow;
    fig.Color = 'white';
end
