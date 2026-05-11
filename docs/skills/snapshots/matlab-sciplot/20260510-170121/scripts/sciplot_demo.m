%% sciplot_demo.m
%
% Self-contained demonstration of the matlab-sciplot skill.
% No Dymola or extra toolboxes required — all data is synthetic.
%
% Generates five figures and exports each as SVG:
%
%   demo_01_science.svg      — 'science' style, multi-line + legend
%   demo_02_ieee.svg         — 'ieee' single-column style
%   demo_03_palettes.svg     — all colour palettes side-by-side
%   demo_04_advanced.svg     — shaded bands + log-scale Bode plot
%   demo_05_subplots.svg     — three-panel subplot (mimics Dymola output)
%
% USAGE
%   cd('c:\Users\vanfr\.copilot\skills\matlab-sciplot\scripts')
%   sciplot_demo

%% ── 0. Bootstrap ────────────────────────────────────────────────────────
clear; close all; clc;

SCRIPT_DIR = fileparts(mfilename('fullpath'));
addpath(SCRIPT_DIR);

OUT_DIR = fullfile(SCRIPT_DIR, '..', 'demo_output');
if ~isfolder(OUT_DIR), mkdir(OUT_DIR); end

fprintf('=== matlab-sciplot demo ===\n');
fprintf('Output folder: %s\n\n', OUT_DIR);

%% ── Shared synthetic data ───────────────────────────────────────────────
rng(42);                          % reproducible
set(groot, 'defaultFigureCreateFcn', ...
    @(fig,~) set(fig, 'defaultAxesToolbar', 'none'));

t  = linspace(0, 10, 1000)';     % time axis [s]
fs = 100;                         % sample rate [Hz]

% Simulated electrical signals (first-order step responses at different tau)
tau  = [0.5, 1.0, 2.0, 4.0, 8.0];
vbus = arrayfun(@(tau_k) 1 - exp(-t ./ tau_k), tau, 'UniformOutput', false);

% Simulated frequency sweep
f_vec  = logspace(-1, 2, 500);   % 0.1 – 100 Hz
omega  = 2*pi*f_vec;
wn     = 2*pi*10;                 % natural frequency 10 Hz
zeta   = 0.2;
H      = wn^2 ./ (-omega.^2 + 2j*zeta*wn*omega + wn^2);
gain   = 20*log10(abs(H));
phase  = rad2deg(angle(H));

%% ════════════════════════════════════════════════════════════════════════
%  Figure 1 — 'science' style: step-response family
%  ════════════════════════════════════════════════════════════════════════
reset(groot);
sciplot_init('science');

fig1 = figure;
hold on;

colors = sciplot_colors('bright');
leg_labels = cell(numel(tau), 1);

for k = 1:numel(tau)
    plot(t, vbus{k}, 'Color', colors(k,:));
    leg_labels{k} = sprintf('$\\tau = %.1f$ s', tau(k));
end

yline(1.0, '--', 'Color', [0.4 0.4 0.4], 'LineWidth', 0.8, ...
    'HandleVisibility', 'off');

xlabel('Time (s)');
ylabel('Bus Voltage $v$ (pu)');
title('First-Order Step Response --- Effect of Time Constant');
legend(leg_labels, 'Location', 'southeast');
xlim([0 10]); ylim([0 1.15]);

out1 = fullfile(OUT_DIR, 'demo_01_science.svg');
sciplot_export(out1, fig1);

%% ════════════════════════════════════════════════════════════════════════
%  Figure 2 — 'ieee' single-column style (3.5 × 2.625 in)
%  ════════════════════════════════════════════════════════════════════════
reset(groot);
sciplot_init('ieee');

fig2 = figure;
hold on;

% IEEE: grayscale palette, use line styles to distinguish series
ls = {'-', '--', ':', '-.', '-'};
grayColors = sciplot_colors('grayscale');

for k = 1:numel(tau)
    c = grayColors(min(k, size(grayColors,1)), :);
    plot(t, vbus{k}, ls{k}, 'Color', c);
end

xlabel('Time (s)');
ylabel('Voltage (pu)');
legend(leg_labels, 'Location', 'southeast', 'FontSize', 6);
xlim([0 10]); ylim([0 1.15]);

out2 = fullfile(OUT_DIR, 'demo_02_ieee.svg');
sciplot_export(out2, fig2);

%% ════════════════════════════════════════════════════════════════════════
%  Figure 3 — colour palette showcase
%  ════════════════════════════════════════════════════════════════════════
reset(groot);
sciplot_init('science');

palette_names = {'bright','vibrant','dark','high-vis','grayscale', ...
                 'rainbow-7','rainbow-10'};
n_palettes    = numel(palette_names);

fig3 = figure;
fig3.Position(3:4) = [10, 7];

for p = 1:n_palettes
    pal  = sciplot_colors(palette_names{p});
    n_c  = size(pal, 1);
    ax   = subplot(n_palettes, 1, p);
    hold(ax, 'on');

    for c = 1:n_c
        x_patch = [c-1, c, c, c-1];
        y_patch = [0, 0, 1, 1];
        fill(ax, x_patch, y_patch, pal(c,:), 'EdgeColor', 'none');
    end

    xlim(ax, [0 n_c]);
    ylim(ax, [0 1]);
    ax.YTick   = [];
    ax.XTick   = [];
    ax.Box     = 'off';
    ax.YLabel.String   = palette_names{p};
    ax.YLabel.FontSize = 11;
    ax.YLabel.Rotation = 0;
    ax.YLabel.HorizontalAlignment = 'right';
    ax.YLabel.VerticalAlignment   = 'middle';
end

out3 = fullfile(OUT_DIR, 'demo_03_palettes.svg');
sciplot_export(out3, fig3);

%% ════════════════════════════════════════════════════════════════════════
%  Figure 4 — advanced: shaded uncertainty + Bode plot side-by-side
%  ════════════════════════════════════════════════════════════════════════
reset(groot);
sciplot_init('science');

colors = sciplot_colors('bright');

fig4 = figure;
fig4.Position(3:4) = [12, 5];

% ── Left: shaded uncertainty band ────────────────────────────────────────
ax4a = subplot(1, 2, 1);
hold(ax4a, 'on');

mu    = vbus{3};                          % tau = 2 s
sigma = 0.05 * (1 - mu) + 0.02;          % heteroscedastic noise model
hi    = mu + sigma;
lo    = mu - sigma;

fill([t; flipud(t)], [hi; flipud(lo)], colors(1,:), ...
    'FaceAlpha', 0.20, 'EdgeColor', 'none', 'Parent', ax4a);
plot(ax4a, t, mu, 'Color', colors(1,:), 'LineWidth', 1.5, ...
    'DisplayName', 'Mean $\hat{v}$');
plot(ax4a, t, hi, '--', 'Color', colors(1,:), 'LineWidth', 0.6, ...
    'DisplayName', '$\pm\sigma$ band');
plot(ax4a, t, lo, '--', 'Color', colors(1,:), 'LineWidth', 0.6, ...
    'HandleVisibility', 'off');

xlabel(ax4a, 'Time (s)');
ylabel(ax4a, 'Voltage (pu)');
title(ax4a, 'Monte-Carlo Envelope ($\tau = 2$ s)');
legend(ax4a, 'Location', 'southeast');
xlim(ax4a, [0 10]); ylim(ax4a, [-0.1, 1.2]);

% ── Right: Bode magnitude + phase ────────────────────────────────────────
ax4b = subplot(1, 2, 2);
hold(ax4b, 'on');

yyaxis(ax4b, 'left');
semilogx(ax4b, f_vec, gain, 'Color', colors(1,:), 'LineWidth', 1.5);
ylabel(ax4b, 'Gain (dB)');
ylim(ax4b, [-60, 5]);

yyaxis(ax4b, 'right');
semilogx(ax4b, f_vec, phase, '--', 'Color', colors(2,:), 'LineWidth', 1.2);
ylabel(ax4b, 'Phase (deg)');
ylim(ax4b, [-200, 20]);

xlabel(ax4b, 'Frequency (Hz)');
title(ax4b, sprintf('2nd-Order Bode ($\\omega_n$=10 Hz, $\\zeta$=%.1f)', zeta));
ax4b.XGrid = 'on';

out4 = fullfile(OUT_DIR, 'demo_04_advanced.svg');
sciplot_export(out4, fig4);

%% ════════════════════════════════════════════════════════════════════════
%  Figure 5 — three-panel subplot (mimics a Dymola dsres.mat result)
%  ════════════════════════════════════════════════════════════════════════
reset(groot);
sciplot_init('science');

colors = sciplot_colors('bright');

% Synthetic "simulation" signals
v_load   = 1 - 0.3*(1 - exp(-t./1.5)) + 0.02*randn(size(t));
i_load   = 0.8*(1 - exp(-t./0.8))     + 0.01*randn(size(t));
p_active = v_load .* i_load;

fig5 = figure;
fig5.Position(3:4) = [9, 8];

% Panel 1 — voltage
ax5a = subplot(3,1,1);
plot(ax5a, t, v_load, 'Color', colors(1,:));
ylabel(ax5a, '$v_{load}$ (pu)');
title(ax5a, 'Synthetic Load Bus --- Dymola-style Output');
ylim(ax5a, [0.6, 1.1]);

% Panel 2 — current
ax5b = subplot(3,1,2);
plot(ax5b, t, i_load, 'Color', colors(2,:));
ylabel(ax5b, '$i_{load}$ (pu)');
ylim(ax5b, [0, 1.0]);

% Panel 3 — active power
ax5c = subplot(3,1,3);
hold(ax5c, 'on');
area(ax5c, t, p_active, 'FaceColor', colors(3,:), 'FaceAlpha', 0.25, ...
    'EdgeColor', colors(3,:), 'LineWidth', 1.2);
ylabel(ax5c, '$P$ (pu)');
xlabel(ax5c, 'Time (s)');
ylim(ax5c, [0, 1.0]);

linkaxes([ax5a, ax5b, ax5c], 'x');
xlim(ax5a, [0, 10]);

% Compact layout
compact_subplots_(fig5, [ax5a, ax5b, ax5c]);

out5 = fullfile(OUT_DIR, 'demo_05_subplots.svg');
sciplot_export(out5, fig5);

%% ── Summary ─────────────────────────────────────────────────────────────
fprintf('\nAll figures exported:\n');
for f = {out1, out2, out3, out4, out5}
    [~, name, ext] = fileparts(f{1});
    fprintf('  %s%s\n', name, ext);
end
fprintf('\nDone.\n');


%% ════════════════════════════════════════════════════════════════════════
%  Local helper
%  ════════════════════════════════════════════════════════════════════════
function compact_subplots_(fig, axList) %#ok<DEFNU>
% Reduce vertical gaps between subplots without the Layout toolbox.
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
