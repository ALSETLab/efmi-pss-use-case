%% plot_cauer_lowpass.m
%
% End-to-end example: Dymola simulation → sciplot publication figure
%
% Model used: Modelica.Electrical.Analog.Examples.CauerLowPassAnalog
%   (ships with every Dymola installation — no extra libraries needed)
%
% Output: cauer_lowpass.svg  (three-panel figure, 'science' style)
%
% Skills used:
%   /skill dymola-matlab-api  — path setup, DDE simulation, dymload/dymget
%   /skill matlab-sciplot     — style presets, color palettes, SVG export

%% ── 0. Paths ────────────────────────────────────────────────────────────
clear; close all; clc;

dymolaRoot  = 'C:\Program Files\Dymola 2026x Refresh 1';
sciplotRoot = 'C:\Users\vanfr\.copilot\skills\matlab-sciplot\scripts';

addpath(fullfile(dymolaRoot, 'Mfiles'));
addpath(fullfile(dymolaRoot, 'Mfiles', 'dymtools'));
addpath(fullfile(dymolaRoot, 'Mfiles', 'traj'));
addpath(sciplotRoot);

%% ── 1. Apply publication style before any figure is opened ─────────────
sciplot_init('science');   % 8×6 in, Helvetica 18pt, bright palette

%% ── 2. Run simulation via DDE ───────────────────────────────────────────
MODEL    = 'Modelica.Electrical.Analog.Examples.CauerLowPassAnalog';
WORKDIR  = fullfile(tempdir, 'cauer_sim');
if ~isfolder(WORKDIR), mkdir(WORKDIR); end

dymola(sprintf('cd("%s");', strrep(WORKDIR, '\', '/')));
dymola(sprintf(['simulateModel("%s", ', ...
    'startTime=0, stopTime=60, ', ...
    'numberOfIntervals=5000, ', ...
    'method="Dassl");'], MODEL));

%% ── 3. Load results ─────────────────────────────────────────────────────
res = dymload(fullfile(WORKDIR, 'dsres.mat'));

t   = dymget(res, 'Time');

% Cauer low-pass signals (standard variable names in this example)
vin  = dymget(res, 'Vin.v');      % input step voltage
vout = dymget(res, 'C5.v');       % output (capacitor C5 voltage)
iL1  = dymget(res, 'L1.i');       % inductor L1 current

%% ── 4. Build a three-panel figure ───────────────────────────────────────
colors = sciplot_colors('bright');  % 7-color colorblind-safe palette

fig = figure;
fig.Position(3:4) = [9, 8];        % slightly taller for three panels

% ── Panel 1: Input vs. output voltage ────────────────────────────────────
ax1 = subplot(3, 1, 1);
hold on;
plot(t, vin,  'Color', colors(2,:), 'DisplayName', 'Input $V_{in}$');
plot(t, vout, 'Color', colors(1,:), 'DisplayName', 'Output $V_{out}$ (C5)');
ylabel('Voltage (V)');
legend('Location', 'east');
title('Cauer 5th-Order Low-Pass Filter — Step Response');

% ── Panel 2: Inductor current ─────────────────────────────────────────────
ax2 = subplot(3, 1, 2);
plot(t, iL1, 'Color', colors(3,:));
ylabel('Current $i_{L1}$ (A)');

% ── Panel 3: Frequency-domain gain (DFT estimate) ────────────────────────
ax3 = subplot(3, 1, 3);

% Only use the steady-state portion (last 40 s) for the DFT
mask   = t >= 20;
t_ss   = t(mask);
vin_ss = vin(mask);
vout_ss= vout(mask);

Fs    = 1 / mean(diff(t_ss));     % approx. uniform sample rate
N     = length(vout_ss);
f_vec = (0:N-1) * (Fs/N);
half  = 1:floor(N/2);

Vin_f  = fft(vin_ss);
Vout_f = fft(vout_ss);

% Avoid divide-by-zero on near-zero input FFT bins
gainDB = 20*log10(abs(Vout_f(half)) ./ max(abs(Vin_f(half)), 1e-12));

semilogy_data = f_vec(half);
semilogx(ax3, semilogy_data, gainDB, 'Color', colors(5,:));
xlabel('Frequency (Hz)');
ylabel('Gain (dB)');
ylim([-80, 5]);
xlim([1e-3, Fs/2]);

% ── Link x-axes of panels 1 & 2 ─────────────────────────────────────────
linkaxes([ax1, ax2], 'x');
xlim(ax1, [0, 60]);

%% ── 5. Add shared x-label to time-domain panels ─────────────────────────
ax2.XLabel.String = 'Time (s)';

%% ── 6. Fine-tune spacing ────────────────────────────────────────────────
set(fig, 'Color', 'white');
tightSubplots_(fig);   % helper defined below

%% ── 7. Export as SVG ────────────────────────────────────────────────────
outfile = 'cauer_lowpass.svg';
sciplot_export(outfile, fig);
fprintf('Figure saved to: %s\n', fullfile(pwd, outfile));


%% ═══════════════════════════════════════════════════════════════════════ %
%  Local helper — reduce whitespace between subplots                      %
%  (no Toolbox required)                                                  %
% ════════════════════════════════════════════════════════════════════════ %
function tightSubplots_(fig)
    axList = findall(fig, 'Type', 'axes');
    for k = 1:numel(axList)
        axList(k).TightInset;            % force layout update
        axList(k).Position;              % touch to trigger resize
    end
    % Compact vertical gaps
    nAx = numel(axList);
    if nAx < 2, return; end
    axList = flipud(axList);             % bottom-to-top order
    totalH = 0.88;
    gap    = 0.06;
    panelH = (totalH - gap*(nAx-1)) / nAx;
    for k = 1:nAx
        pos    = axList(k).Position;
        pos(2) = 0.06 + (k-1)*(panelH + gap);
        pos(4) = panelH;
        pos(1) = 0.11;
        pos(3) = 0.85;
        axList(k).Position = pos;
    end
end
