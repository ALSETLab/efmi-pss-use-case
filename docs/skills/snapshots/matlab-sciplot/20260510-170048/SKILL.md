---
name: matlab-sciplot
description: >
  Use when: creating publication-quality scientific plots in MATLAB inspired by the Python
  SciencePlots package; styling figures for IEEE, Nature, or general science journals;
  exporting plots as SVG (default), PDF, EPS, PNG or TIFF; applying colorblind-safe
  palettes; post-processing Dymola simulation results from dymola-matlab-api into
  publication figures; replacing PlotPub or matlab-figures with native MATLAB calls.
argument-hint: >
  Describe what you want to plot and for which target (e.g. 'plot bus voltage vs time
  from dsres.mat, IEEE single-column, SVG export').
---

# MATLAB SciPlot — Publication-Quality Figures (SciencePlots for MATLAB)

## Overview

This skill teaches Copilot how to generate figures that match the look of Python's
**SciencePlots** package — using only **native MATLAB** functions.  No third-party
toolboxes are required.  Four helper functions (provided in `scripts/`) cover the
full workflow:

| Function | Purpose |
|---|---|
| `sciplot_init(style)` | Set `groot` defaults for **all new figures** |
| `sciplot_style(ax, style)` | Apply style to an **existing** axes/figure |
| `sciplot_export(filename)` | Export to **SVG** (default) or other formats |
| `sciplot_colors(name)` | Return an N×3 colorblind-safe palette |

> **Integration with Dymola:** Call `sciplot_init()` right after loading simulation
> results with `dymload`/`dymget`, then plot and export. See [§ Dymola workflow](#dymola-workflow).

---

## Step 0 — Add Scripts to MATLAB Path

```matlab
addpath('C:/path/to/skills/matlab-sciplot/scripts');
savepath;   % persist across sessions
```

---

## Step 1 — Choose a Style Preset

| Style key | Target | Width × Height | Font | Notes |
|---|---|---|---|---|
| `'science'` | General science (default) | 8 × 6 in | Helvetica 18 pt | Colorblind-safe, TeX labels |
| `'ieee'` | IEEE single-column papers | 3.5 × 2.625 in | Helvetica 8 pt | Grayscale-safe, no grid |
| `'ieee-double'` | IEEE double-column | 7.16 × 4.5 in | Helvetica 9 pt | Color |
| `'nature'` | Nature journals | 7 × 5.25 in | Arial 7 pt | Compact, sans-serif |
| `'notebook'` | Presentations / notebooks | 10 × 7.5 in | Helvetica 22 pt | Grid on |
| `'minimal'` | Ultra-clean | 8 × 6 in | Helvetica 16 pt | No grid, no box |

---

## Step 2 — Apply Defaults (new figures)

```matlab
% At the top of your script — before any figure() or plot() calls
sciplot_init('science');   % or 'ieee', 'nature', 'notebook', 'minimal'
```

Every `figure()` opened after this call inherits the style automatically.

---

## Step 3 — Plot Your Data

### Basic line plot

```matlab
sciplot_init('science');

t = linspace(0, 2*pi, 300);
figure;
hold on;
plot(t, sin(t));
plot(t, cos(t));
xlabel('Time $t$ (s)');
ylabel('Amplitude (-)');
legend('$\sin(t)$', '$\cos(t)$', 'Location', 'best');
sciplot_export('sincos');     % → sincos.svg
```

### Multiple qualitative series (dark palette)

```matlab
sciplot_init('science');
colors = sciplot_colors('dark');   % ColorBrewer Dark2

figure; hold on;
for k = 1:size(colors,1)
    plot(t, sin(t + k*pi/4), 'Color', colors(k,:));
end
legend(arrayfun(@(k) sprintf('Phase %d', k), 1:8, 'UniformOutput', false));
sciplot_export('phase_sweep.svg');
```

### Scatter plot

```matlab
sciplot_init('science');
x = randn(50,1); y = randn(50,1);

figure;
scatter(x, y, 60, sciplot_colors('bright')(1,:), 'filled', 'MarkerFaceAlpha', 0.6);
xlabel('Variable A'); ylabel('Variable B');
sciplot_export('scatter.svg');
```

---

## Step 4 — Export

### Default: SVG

```matlab
sciplot_export('my_figure');       % → my_figure.svg
```

### Other formats

```matlab
sciplot_export('fig1.pdf');               % vector PDF
sciplot_export('fig1.eps');               % vector EPS (LaTeX inclusion)
sciplot_export('fig1.png', 'DPI', 600);   % raster PNG at 600 dpi
sciplot_export('fig1.tiff', 'DPI', 600);  % raster TIFF for journal submission
```

### Resize on export (useful for IEEE)

```matlab
sciplot_export('fig1.svg', 'Width', 3.5, 'Height', 2.625);
```

### Export a specific figure handle

```matlab
fig = figure; plot(x, y);
sciplot_export('fig1', fig);
```

---

## Step 5 — Fix Up Existing Figures (`sciplot_style`)

Use `sciplot_style` when the figure already exists (e.g. from `tplot`, `dymbrowse`,
or code you cannot modify):

```matlab
% Fix a Dymola tplot figure after the fact
tplot(t, y, {'signal1', 'signal2'});
sciplot_style('science');              % apply to current axes
sciplot_export('dymola_signals.svg');
```

With explicit axes handle:

```matlab
ax1 = subplot(2,1,1); plot(t, v);
ax2 = subplot(2,1,2); plot(t, i);
sciplot_style(ax1, 'science');
sciplot_style(ax2, 'science');
sciplot_export('vi_subplot.svg');
```

With inline overrides:

```matlab
sciplot_style('science', 'FontSize', 14, 'YGrid', 'off');
```

---

## Color Palettes Reference

```matlab
colors = sciplot_colors('bright');           % 7 colors — default, colorblind-safe
colors = sciplot_colors('vibrant');          % 7 colors — high-saturation
colors = sciplot_colors('dark');             % 8 colors — ColorBrewer Dark2
colors = sciplot_colors('paired');           % 12 colors — light+dark pairs
colors = sciplot_colors('high-vis');         % 5 colors — extreme visibility
colors = sciplot_colors('grayscale');        % 6 grays  — for B&W printing
colors = sciplot_colors('sequential-blue');  % 9-step blue ramp
colors = sciplot_colors('sequential-orange');% 9-step orange ramp
colors = sciplot_colors('sequential-gray');  % 9-step gray ramp
colors = sciplot_colors('rainbow-7');        % Paul Tol 7-color discrete rainbow
colors = sciplot_colors('rainbow-10');       % Paul Tol 10-color

% Apply directly to axes
set(gca, 'ColorOrder', sciplot_colors('vibrant'), 'NextPlot', 'replacechildren');
```

---

## Dymola Workflow

Full end-to-end: Dymola simulation → styled MATLAB figure → SVG export.

```matlab
%% 1. Add Dymola and SciPlot paths
dymolaRoot = 'C:\Program Files\Dymola 2026x Refresh 1';
addpath(fullfile(dymolaRoot, 'Mfiles'));
addpath(fullfile(dymolaRoot, 'Mfiles', 'dymtools'));
addpath(fullfile(dymolaRoot, 'Mfiles', 'traj'));
addpath('C:/path/to/skills/matlab-sciplot/scripts');

%% 2. Run simulation via DDE (or use a pre-existing dsres.mat)
dymola('simulateModel("MyModel.Examples.Test", stopTime=10)');

%% 3. Load results
traj = dymload('C:/dymola/work/dsres.mat');
t    = dymget(traj, 'Time');
v    = dymget(traj, 'bus.v');
i    = dymget(traj, 'bus.i');

%% 4. Apply style and plot
sciplot_init('science');

figure; hold on;
plot(t, v, 'DisplayName', 'Voltage $v$ (pu)');
plot(t, i, 'DisplayName', 'Current $i$ (pu)');
xlabel('Time (s)');
ylabel('Electrical quantities (pu)');
legend('Location', 'best');
title('Bus response');

%% 5. Export
sciplot_export('bus_response.svg');          % default SVG
sciplot_export('bus_response_ieee.pdf', ...
    'Width', 3.5, 'Height', 2.625);          % IEEE column PDF
```

---

## Subplots

```matlab
sciplot_init('science');

figure;
ax1 = subplot(2,1,1);
plot(t, v);
ylabel('Voltage (pu)');

ax2 = subplot(2,1,2);
plot(t, i);
ylabel('Current (pu)');
xlabel('Time (s)');

% Adjust spacing
set(gcf, 'Position', [1 1 8 7]);
sciplot_export('vi_subplots.svg');
```

---

## Shaded Uncertainty / Confidence Bands

```matlab
sciplot_init('science');
c = sciplot_colors('bright');

t   = linspace(0, 10, 200)';
mu  = sin(t);
sig = 0.15 * abs(cos(t)) + 0.05;

figure; hold on;
fill([t; flipud(t)], [mu+sig; flipud(mu-sig)], c(1,:), ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');
plot(t, mu, 'Color', c(1,:), 'LineWidth', 1.5);
xlabel('Time (s)'); ylabel('Signal');
sciplot_export('uncertainty_band.svg');
```

---

## Log-Scale Plots

```matlab
sciplot_init('science');

f = logspace(0, 4, 300);
H = 1 ./ (1 + 1j*f/100);

figure;
loglog(f, abs(H));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
sciplot_export('bode_mag.svg');
```

---

## Style Guide — Rules Implemented

These rules mirror SciencePlots and best-practice data-visualization references
(Tufte, ColorBrewer, Paul Tol):

| Rule | Value |
|---|---|
| Font | Helvetica (Arial for Nature) |
| Font size | 18 pt science / 8 pt IEEE / 7 pt Nature |
| Line width | 1.5 pt (0.8 pt IEEE) |
| Axes line width | 0.8 pt |
| Tick direction | outward |
| Box | off (open axes) |
| Y-grid | on, α = 0.15 |
| X-grid | off by default |
| Color cycle | Paul Tol "bright" (7 colors, colorblind-safe) |
| Export format | SVG (vector, lossless) |
| TeX interpreter | `'tex'` (no LaTeX installation required) |

---

## Tips

- **TeX vs LaTeX labels:** `sciplot_init` defaults to `'tex'` interpreter which works
  without a LaTeX installation. Switch to `'latex'` only when you need full LaTeX
  math rendering and have a working TeX distribution.

  ```matlab
  sciplot_init('science');
  set(groot, 'defaultTextInterpreter',          'latex');
  set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
  set(groot, 'defaultLegendInterpreter',        'latex');
  ```

- **SVG rendering artifacts:** If SVG lines look thin/broken, add
  `set(gcf,'Renderer','painters')` before exporting.

- **IEEE submission:** Use `'ieee'` preset + `'eps'` format for most IEEE template
  workflows, or `'pdf'` for `pdflatex`.

- **Reproducibility:** Save defaults once and reuse:

  ```matlab
  % save_sciplot_defaults.m — run once per project
  sciplot_init('science');
  savefig_defaults = get(groot,'default');   % inspect if needed
  ```

- **Resetting defaults:** Restore MATLAB factory settings with:

  ```matlab
  reset(groot);   % remove all groot overrides
  ```
