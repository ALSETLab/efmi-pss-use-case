%% Plot Grid4CHIL Simulation Results for Paper Figures
% Generates publication-quality plots from the batch simulation results
% produced by run_dymola_simulations.m.
%
% Output location:
%   <repo>/Modelica/work/Grid4CHIL_batch_results/figures/  (default)
%   Override: set environment variable GRID4CHIL_RESULTS_DIR
%
% Usage:
%   Run from any working directory (paths are relative to this script).
%   Figures are saved as PDF in the figures/ subdirectory.
%
% Add more figure sections at the bottom following the existing pattern.
% See plotSignal() and loadModel() helpers at the end of this file.

clc; clear; close all;

% Export mode:
%   false -> save publication PDF and MATLAB .fig files
%   true  -> save only MATLAB .fig files for interactive inspection
interactiveOnly = true;

% Configure Dymola result-reading utilities.
dymolaRoot = locateDymolaRoot();
addpath(fullfile(dymolaRoot, 'Mfiles'));
addpath(fullfile(dymolaRoot, 'Mfiles', 'dymtools'));
addpath(fullfile(dymolaRoot, 'Mfiles', 'traj'));

% Add SciPlot helpers (publication-quality styling).
addpath('C:\Users\vanfr\.copilot\skills\matlab-sciplot\scripts');
sciplot_init('science');   % sets groot defaults for all subsequent figures

%% Resolve input and output paths.
scriptDir  = fileparts(mfilename('fullpath'));
repoRoot   = fileparts(fileparts(scriptDir));
resultsDir = resolveResultsDir(fullfile(repoRoot, 'Modelica', 'work', 'Grid4CHIL_batch_results'));
figuresDir = fullfile(resultsDir, 'figures');
if ~isfolder(figuresDir), mkdir(figuresDir); end
figuresMatlabDir = fullfile(figuresDir, 'matlab_figures');
if ~isfolder(figuresMatlabDir), mkdir(figuresMatlabDir); end

fprintf('Results dir : %s\n', resultsDir);
fprintf('Figures dir : %s\n\n', figuresDir);

%% Define model variants (tag, display label, line style).
% Colors are assigned automatically from the sciplot 'rainbow-7' palette.
% To add/remove models, edit this table only — all figure sections pick it up.
models = struct( ...
    'tag',   {'ReferenceSetup', ...
              'ReferenceSetup_Clocked', ...
              'ReferenceSetup_ExpEuler', ...
              'ReferenceSetup_SiL', ...
              'ReferenceSetup_SiL_FMUs', ...
              'RefSim_ClockedPSS_CT_Plant', ...
              'RefSim_ClockedPSS_CT_Plant_ExpEuler'}, ...
    'label', {'Reference', ...
              'Reference (Clocked)', ...
              'Reference (Exp. Euler)', ...
              'SiL', ...
              'SiL (FMUs)', ...
              'ClockedPSS CT Plant', ...
              'ClockedPSS CT Plant (Exp. Euler)'}, ...
    'style', {'-',  '--',  ':',  '-.',  '--',  '-',  ':'});

% Assign one sciplot 'rainbow-7' palette colour per model.
palette = sciplot_colors('rainbow-7');
markerList = {'o', 's', 'd', '^', 'v', '>', '<', 'p', 'h', 'x', '+'};
for k = 1:numel(models)
    models(k).color = palette(mod(k-1, size(palette,1)) + 1, :);
    models(k).marker = markerList{mod(k-1, numel(markerList)) + 1};
    models(k).markerStride = 14 + mod(k-1, 5);  % Different marker density per signal.
    models(k).markerPhase  = k - 1;             % Stagger marker locations across signals.
end

%% Load all model results up-front.
nModels = numel(models);
for k = 1:nModels
    matFile = fullfile(resultsDir, sprintf('%s_dsres.mat', models(k).tag));
    models(k).res = loadModel(matFile, models(k).tag);
end

% Convenience index for the key comparison subset used in several figures.
keyTags = {'ReferenceSetup', 'ReferenceSetup_Clocked', 'ReferenceSetup_SiL'};
keyIdx  = find(ismember({models.tag}, keyTags));

% Paper naming and subset (5 cases) used for targeted comparisons.
paperCases = struct( ...
    'tag', {'RefSim_ClockedPSS_CT_Plant', ...
        'RefSim_ClockedPSS_CT_Plant_ExpEuler', ...
        'ReferenceSetup', ...
        'ReferenceSetup_ExpEuler', ...
        'ReferenceSetup_Clocked'}, ...
    'paperLabel', {'Ref.Sim.DASSL', ...
           'Ref.Sim.ExpEuler', ...
           'Ref.Setup', ...
           'Ref.Setup.ExpEuler', ...
           'Ref.Setup.Clocked'});

% Signal name candidates per logical signal, ordered by preference.
% plotSignal() tries each name in the cell array and uses the first that
% returns data. This handles the different hierarchy in RefSim vs Reference
% model families without any per-model configuration.
SIG = struct( ...
    'w',   {{'G4CHIL.G1.machine.w',    'G1.genAVRIOReDesign.machine.w'}}, ...
    'vf',  {{'G4CHIL.vf',              'G1.genAVRIOReDesign.avr.vf'}}, ...
    'pss', {{'pss.vs',                 'G1.pss.vs'}}, ...
    'B1',  {{'G4CHIL.B1.v',            'B1.v'}}, ...
    'B2',  {{'G4CHIL.B2.v',            'B2.v'}}, ...
    'B3',  {{'G4CHIL.B3.v',            'B3.v'}});

%% Figure 1 — Generator speed (all variants).
fig1 = figure('Name', 'Generator Speed - All Variants');
configureInteractiveFigure(fig1);
ax1  = axes(fig1);
legendHandles = gobjects(1, nModels);
for k = 1:nModels
    legendHandles(k) = plotSignal(ax1, models(k), SIG.w);
end
xlabel(ax1, 'Time (s)');
ylabel(ax1, 'Speed (pu)');
title(ax1,  'Generator Speed -- All Simulation Variants');
legendHandles = legendHandles(isgraphics(legendHandles));
lgd = legend(ax1, legendHandles, 'Location', 'best');
lgd.TextColor = [0 0 0];
exportFigure(fig1, ...
    fullfile(figuresDir, 'fig1_speed_all.pdf'), ...
    fullfile(figuresMatlabDir, 'fig1_speed_all.fig'), ...
    interactiveOnly);

%% Figure 2 — Ref.Sim.DASSL vs Ref.Sim.ExpEuler (speed + error).
idxRefSimDASSL = find(strcmp({models.tag}, 'RefSim_ClockedPSS_CT_Plant'), 1);
idxRefSimEuler = find(strcmp({models.tag}, 'RefSim_ClockedPSS_CT_Plant_ExpEuler'), 1);
if ~isempty(idxRefSimDASSL) && ~isempty(idxRefSimEuler)
    mdlDASSL = models(idxRefSimDASSL);
    mdlEuler = models(idxRefSimEuler);
    mdlDASSL.label = 'Ref.Sim.DASSL';
    mdlEuler.label = 'Ref.Sim.ExpEuler';

    % Use a high-visibility palette for this paper-focused comparison figure only.
    paperPalette = sciplot_colors('high-vis');
    mdlDASSL.color = paperPalette(1, :);
    mdlEuler.color = paperPalette(2, :);

    [tDASSL, wDASSL, okDASSL] = getSignalData(mdlDASSL, SIG.w);
    [tEuler, wEuler, okEuler] = getSignalData(mdlEuler, SIG.w);

    if okDASSL && okEuler
        fig2 = figure('Name', 'Ref.Sim Comparison');
        configureInteractiveFigure(fig2);

        tEuler = tEuler(:);
        wEuler = wEuler(:);
        tDASSL = tDASSL(:);
        wDASSL = wDASSL(:);
        [tEulerUnique, uniqueIdx] = unique(tEuler, 'stable');
        wEulerUnique = wEuler(uniqueIdx);
        wEulerOnDASSL = interp1(tEulerUnique, wEulerUnique, tDASSL, 'linear', 'extrap');
        wErr = wDASSL - wEulerOnDASSL;

        maxAbsErr = max(abs(wErr));
        rmsErr = sqrt(mean(wErr.^2));
        [~, idxPeakErr] = max(abs(wErr));
        tPeakErr = tDASSL(idxPeakErr);
        fprintf('Figure 2 diagnostics: max|err|=%.12g pu, RMS=%.12g pu, peak@t=%.6f s\n', ...
            maxAbsErr, rmsErr, tPeakErr);

        % Fixed zoom window requested for paper discussion.
        tZoomMin = 3.1;
        tZoomMax = 3.35;

        ax2Top = subplot(3, 1, 1, 'Parent', fig2);
        hold(ax2Top, 'on');
        hDASSL = plot(ax2Top, tDASSL, wDASSL, ...
            'LineStyle', '-', ...
            'LineWidth', 1.8, ...
            'Color', mdlDASSL.color, ...
            'DisplayName', 'Ref.Sim.DASSL');
        hEuler = plot(ax2Top, tDASSL, wEulerOnDASSL, ...
            'LineStyle', '--', ...
            'LineWidth', 1.6, ...
            'Color', mdlEuler.color, ...
            'DisplayName', 'Ref.Sim.ExpEuler');

        % Dense but staggered markers make both traces visible on the full axis.
        nTop = numel(tDASSL);
        markerIdxDASSL = 1:2200:nTop;
        markerIdxEuler = 1100:2200:nTop;
        plot(ax2Top, tDASSL(markerIdxDASSL), wDASSL(markerIdxDASSL), ...
            'LineStyle', 'none', 'Marker', 'o', 'MarkerSize', 5, ...
            'MarkerFaceColor', mdlDASSL.color, 'MarkerEdgeColor', mdlDASSL.color, ...
            'HandleVisibility', 'off');
        plot(ax2Top, tDASSL(markerIdxEuler), wEulerOnDASSL(markerIdxEuler), ...
            'LineStyle', 'none', 'Marker', 's', 'MarkerSize', 5, ...
            'MarkerFaceColor', 'w', 'MarkerEdgeColor', mdlEuler.color, ...
            'LineWidth', 1.0, 'HandleVisibility', 'off');
        xlabel(ax2Top, 'Time (s)');
        ylabel(ax2Top, 'Speed (pu)');
        title(ax2Top, 'Ref.Sim.DASSL vs Ref.Sim.ExpEuler');
        lgd2 = legend(ax2Top, [hDASSL, hEuler], 'Location', 'best');
        lgd2.TextColor = [0 0 0];
        xline(ax2Top, tZoomMin, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');
        xline(ax2Top, tZoomMax, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');

        ax2Bot = subplot(3, 1, 2, 'Parent', fig2);
        absErr2 = max(abs(wErr), eps);
        hold(ax2Bot, 'on');
        semilogy(ax2Bot, tDASSL, absErr2, '-', 'Color', mdlDASSL.color, ...
            'LineWidth', 1.5, 'DisplayName', ...
            '|Ref.Sim.DASSL - Ref.Sim.ExpEuler|');
        xline(ax2Bot, tZoomMin, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');
        xline(ax2Bot, tZoomMax, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');
        xlabel(ax2Bot, 'Time (s)');
        ylabel(ax2Bot, 'Absolute Speed Error (pu)');
        title(ax2Bot, sprintf('Absolute Error (max = %.3e pu, RMS = %.3e pu)', maxAbsErr, rmsErr));
        lgdErr = legend(ax2Bot, 'Location', 'best');
        lgdErr.TextColor = [0 0 0];

        ax2Zoom = subplot(3, 1, 3, 'Parent', fig2);
        hold(ax2Zoom, 'on');
        zoomMask = (tDASSL >= tZoomMin) & (tDASSL <= tZoomMax);

        plot(ax2Zoom, tDASSL(zoomMask), wDASSL(zoomMask), ...
            '-', 'Color', mdlDASSL.color, 'LineWidth', 1.5, 'DisplayName', 'Ref.Sim.DASSL');
        plot(ax2Zoom, tDASSL(zoomMask), wEulerOnDASSL(zoomMask), ...
            '--', 'Color', mdlEuler.color, 'LineWidth', 1.5, 'DisplayName', 'Ref.Sim.ExpEuler');

        xlim(ax2Zoom, [tZoomMin, tZoomMax]);
        yLocal = [wDASSL(zoomMask); wEulerOnDASSL(zoomMask)];
        yPad = max(2e-7, 0.10 * max(range(yLocal), eps));
        ylim(ax2Zoom, [min(yLocal)-yPad, max(yLocal)+yPad]);
        xlabel(ax2Zoom, 'Time (s)');
        ylabel(ax2Zoom, 'Speed (pu)');
        title(ax2Zoom, 'Zoomed View (3.16 s to 3.26 s)');
        lgdZoom = legend(ax2Zoom, 'Location', 'best');
        lgdZoom.TextColor = [0 0 0];

        exportFigure(fig2, ...
            fullfile(figuresDir, 'fig2_refsim_speed_and_error.pdf'), ...
            fullfile(figuresMatlabDir, 'fig2_refsim_speed_and_error.fig'), ...
            interactiveOnly);
    else
        warning('plot_grid4chil_results:missingRefSimSignals', ...
            'Could not build Figure 2 because speed signal data was missing for Ref.Sim cases.');
    end
else
    warning('plot_grid4chil_results:missingRefSimModels', ...
        'Could not find Ref.Sim model tags required for Figure 2.');
end

%% Figure 3 — Ref.Sim.DASSL vs Ref.Setup (speed + error).
idxRefSim = find(strcmp({models.tag}, 'RefSim_ClockedPSS_CT_Plant'), 1);
idxRefSetup = find(strcmp({models.tag}, 'ReferenceSetup'), 1);
if ~isempty(idxRefSim) && ~isempty(idxRefSetup)
    mdlRefSim = models(idxRefSim);
    mdlRefSetup = models(idxRefSetup);
    mdlRefSim.label = 'Ref.Sim.DASSL';
    mdlRefSetup.label = 'Ref.Setup';

    % Keep the same figure-2 comparison palette convention.
    paperPalette = sciplot_colors('high-vis');
    mdlRefSim.color = paperPalette(1, :);
    mdlRefSetup.color = paperPalette(2, :);

    [tRefSim, wRefSim, okRefSim] = getSignalData(mdlRefSim, SIG.w);
    [tRefSetup, wRefSetup, okRefSetup] = getSignalData(mdlRefSetup, SIG.w);

    if okRefSim && okRefSetup
        fig3 = figure('Name', 'Ref.Sim vs Ref.Setup Comparison');
        configureInteractiveFigure(fig3);

        tRefSim = tRefSim(:);
        wRefSim = wRefSim(:);
        tRefSetup = tRefSetup(:);
        wRefSetup = wRefSetup(:);
        [tRefSetupUnique, uniqueIdx3] = unique(tRefSetup, 'stable');
        wRefSetupUnique = wRefSetup(uniqueIdx3);
        wRefSetupOnRefSim = interp1(tRefSetupUnique, wRefSetupUnique, tRefSim, 'linear', 'extrap');
        wErr3 = wRefSim - wRefSetupOnRefSim;

        maxAbsErr3 = max(abs(wErr3));
        rmsErr3 = sqrt(mean(wErr3.^2));
        [~, idxPeakErr3] = max(abs(wErr3));
        tPeakErr3 = tRefSim(idxPeakErr3);
        fprintf('Figure 3 diagnostics: max|err|=%.12g pu, RMS=%.12g pu, peak@t=%.6f s\n', ...
            maxAbsErr3, rmsErr3, tPeakErr3);

        zoomHalfWindow3 = 0.05;
        tZoomMin3 = max(tRefSim(1), tPeakErr3 - zoomHalfWindow3);
        tZoomMax3 = min(tRefSim(end), tPeakErr3 + zoomHalfWindow3);

        ax3Top = subplot(3, 1, 1, 'Parent', fig3);
        hold(ax3Top, 'on');
        hRefSim = plot(ax3Top, tRefSim, wRefSim, ...
            'LineStyle', '-', ...
            'LineWidth', 1.8, ...
            'Color', mdlRefSim.color, ...
            'DisplayName', 'Ref.Sim.DASSL');
        hRefSetup = plot(ax3Top, tRefSim, wRefSetupOnRefSim, ...
            'LineStyle', '--', ...
            'LineWidth', 1.6, ...
            'Color', mdlRefSetup.color, ...
            'DisplayName', 'Ref.Setup');

        nTop3 = numel(tRefSim);
        markerIdxRefSim = 1:2200:nTop3;
        markerIdxRefSetup = 1100:2200:nTop3;
        plot(ax3Top, tRefSim(markerIdxRefSim), wRefSim(markerIdxRefSim), ...
            'LineStyle', 'none', 'Marker', 'o', 'MarkerSize', 5, ...
            'MarkerFaceColor', mdlRefSim.color, 'MarkerEdgeColor', mdlRefSim.color, ...
            'HandleVisibility', 'off');
        plot(ax3Top, tRefSim(markerIdxRefSetup), wRefSetupOnRefSim(markerIdxRefSetup), ...
            'LineStyle', 'none', 'Marker', 's', 'MarkerSize', 5, ...
            'MarkerFaceColor', 'w', 'MarkerEdgeColor', mdlRefSetup.color, ...
            'LineWidth', 1.0, 'HandleVisibility', 'off');
        xlabel(ax3Top, 'Time (s)');
        ylabel(ax3Top, 'Speed (pu)');
        title(ax3Top, 'Ref.Sim.DASSL vs Ref.Setup');
        lgd3Top = legend(ax3Top, [hRefSim, hRefSetup], 'Location', 'best');
        lgd3Top.TextColor = [0 0 0];
        xline(ax3Top, tZoomMin3, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');
        xline(ax3Top, tZoomMax3, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');

        ax3Bot = subplot(3, 1, 2, 'Parent', fig3);
        absErr3 = max(abs(wErr3), eps);
        hold(ax3Bot, 'on');
        semilogy(ax3Bot, tRefSim, absErr3, '-', 'Color', mdlRefSim.color, ...
            'LineWidth', 1.5, 'DisplayName', ...
            '|Ref.Sim.DASSL - Ref.Setup|');
        xline(ax3Bot, tZoomMin3, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');
        xline(ax3Bot, tZoomMax3, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');
        xlabel(ax3Bot, 'Time (s)');
        ylabel(ax3Bot, 'Absolute Speed Error (pu)');
        title(ax3Bot, sprintf('Absolute Error (max = %.3e pu, RMS = %.3e pu)', maxAbsErr3, rmsErr3));
        lgd3Err = legend(ax3Bot, 'Location', 'best');
        lgd3Err.TextColor = [0 0 0];

        ax3Zoom = subplot(3, 1, 3, 'Parent', fig3);
        hold(ax3Zoom, 'on');
        zoomMask3 = (tRefSim >= tZoomMin3) & (tRefSim <= tZoomMax3);
        plot(ax3Zoom, tRefSim(zoomMask3), wRefSim(zoomMask3), ...
            '-', 'Color', mdlRefSim.color, 'LineWidth', 1.5, 'DisplayName', 'Ref.Sim.DASSL');
        plot(ax3Zoom, tRefSim(zoomMask3), wRefSetupOnRefSim(zoomMask3), ...
            '--', 'Color', mdlRefSetup.color, 'LineWidth', 1.5, 'DisplayName', 'Ref.Setup');
        xlim(ax3Zoom, [tZoomMin3, tZoomMax3]);
        yLocal3 = [wRefSim(zoomMask3); wRefSetupOnRefSim(zoomMask3)];
        yPad3 = max(2e-7, 0.10 * max(range(yLocal3), eps));
        ylim(ax3Zoom, [min(yLocal3)-yPad3, max(yLocal3)+yPad3]);
        xlabel(ax3Zoom, 'Time (s)');
        ylabel(ax3Zoom, 'Speed (pu)');
        title(ax3Zoom, sprintf('Zoomed View Around Peak Error (%.4f s to %.4f s)', tZoomMin3, tZoomMax3));
        lgd3Zoom = legend(ax3Zoom, 'Location', 'best');
        lgd3Zoom.TextColor = [0 0 0];

        exportFigure(fig3, ...
            fullfile(figuresDir, 'fig3_refsim_vs_refsetup_speed_and_error.pdf'), ...
            fullfile(figuresMatlabDir, 'fig3_refsim_vs_refsetup_speed_and_error.fig'), ...
            interactiveOnly);
    else
        warning('plot_grid4chil_results:missingRefSetupSignals', ...
            'Could not build Figure 3 because speed signal data was missing for Ref.Sim/Ref.Setup cases.');
    end
else
    warning('plot_grid4chil_results:missingRefSetupModels', ...
        'Could not find model tags required for Figure 3.');
end






%% Figure 4 — Ref.Sim.DASSL (item 1) vs all other four paper cases (items 2–5).
% Top panel    : speed traces for all 5 cases.
% Middle panel : semilogy absolute error of each case against the baseline.
% Bottom panel : zoomed view around the worst peak error across all four comparisons.

% Ordered exactly as items 1–5 in the paper.
fig4Tags = { ...
    'RefSim_ClockedPSS_CT_Plant', ...           % 1 — baseline
    'RefSim_ClockedPSS_CT_Plant_ExpEuler', ...  % 2
    'ReferenceSetup', ...                        % 3
    'ReferenceSetup_ExpEuler', ...               % 4
    'ReferenceSetup_Clocked'};                   % 5
fig4Labels = {'Ref.Sim.DASSL', 'Ref.Sim.ExpEuler', 'Ref.Setup', ...
              'Ref.Setup.ExpEuler', 'Ref.Setup.Clocked'};
fig4ShortLabels = {'Sim 1', 'Sim 2', 'Sim 3', 'Sim 4', 'Sim 5'};
fig4Styles = {'-', '--', ':', '-.', '--'};
fig4Markers = {'o', 's', 'd', '^', 'v'};
fig4Palette = sciplot_colors('high-vis');  % same palette as figs 2/3
fig4Palette(5,:) = [0.90, 0.45, 0.00];   % replace yellow (Sim 5) with orange for legibility

% Locate each tag in the already-loaded models array.
fig4Idx = zeros(1, 5);
for fi = 1:5
    idx = find(strcmp({models.tag}, fig4Tags{fi}), 1);
    if ~isempty(idx)
        fig4Idx(fi) = idx;
    end
end

if fig4Idx(1) == 0
    warning('plot_grid4chil_results:fig4NoBaseline', ...
        'Figure 4: baseline model Ref.Sim.DASSL not found, skipping.');
else
    mdlBase4 = models(fig4Idx(1));
    [tBase4, wBase4, okBase4] = getSignalData(mdlBase4, SIG.w);

    if ~okBase4
        warning('plot_grid4chil_results:fig4NoBaseSignal', ...
            'Figure 4: speed signal not available for baseline, skipping.');
    else
        tBase4 = tBase4(:);
        wBase4 = wBase4(:);

        % Pre-compute errors for all four comparison cases.
        nComp = 4;
        compErr    = cell(1, nComp);
        compOk     = false(1, nComp);
        compTPeak  = NaN(1, nComp);   % time of peak absolute error per case
        compLabel  = fig4Labels(2:end);
        compStyles = fig4Styles(2:end);
        compMarkers= fig4Markers(2:end);
        compW      = cell(1, nComp);   % interpolated comparison speed on tBase4 grid

        for ci = 1:nComp
            if fig4Idx(ci+1) == 0
                warning('plot_grid4chil_results:fig4MissingCase', ...
                    'Figure 4: model "%s" not found, skipping that comparison.', fig4Labels{ci+1});
                continue;
            end
            [tC, wC, okC] = getSignalData(models(fig4Idx(ci+1)), SIG.w);
            if ~okC, continue; end
            tC = tC(:);  wC = wC(:);
            [tCu, uIdx] = unique(tC, 'stable');
            wCu = wC(uIdx);
            wCinterp = interp1(tCu, wCu, tBase4, 'linear', 'extrap');
            compW{ci} = wCinterp;
            compErr{ci} = wBase4 - wCinterp;
            compOk(ci) = true;

            maxEi = max(abs(compErr{ci}));
            rmsEi = sqrt(mean(compErr{ci}.^2));
            [~, iPeak] = max(abs(compErr{ci}));
            compTPeak(ci) = tBase4(iPeak);
            fprintf('Figure 4 [%s vs Ref.Sim.DASSL]: max|err|=%.6e pu, RMS=%.6e pu, peak@t=%.6f s\n', ...
                compLabel{ci}, maxEi, rmsEi, compTPeak(ci));
        end

        % Print LaTeX table of error statistics for all four comparisons.
        fprintf('\n%% ---- Figure 4 error summary (copy-paste into LaTeX) ----\n');
        fprintf('\\begin{table}[ht]\n');
        fprintf('\\centering\n');
        fprintf('\\caption{Generator speed error relative to \\texttt{Ref.Sim.DASSL} (case~1).}\n');
        fprintf('\\label{tab:speed_error_summary}\n');
        fprintf('\begin{tabular}{lSSS}\n');
        fprintf('\\toprule\n');
        fprintf('Case & {$\\max|\\epsilon|$ (pu)} & {RMS $\\epsilon$ (pu)} & {$t_{\\max}$ (s)} \\\\\n');
        fprintf('\\midrule\n');
        for ci = 1:nComp
            if ~compOk(ci)
                fprintf('\\texttt{%s} & {---} & {---} & {---} \\\\\n', compLabel{ci});
                continue;
            end
            maxEi = max(abs(compErr{ci}));
            rmsEi = sqrt(mean(compErr{ci}.^2));
            fprintf('\\texttt{%s} & %.4e & %.4e & %.4f \\\\\n', compLabel{ci}, maxEi, rmsEi, compTPeak(ci));
        end
        fprintf('\\bottomrule\n');
        fprintf('\\end{tabular}\n');
        fprintf('\\end{table}\n');
        fprintf('%% ---------------------------------------------------------\n\n');

        % Find global worst peak to drive the zoom window.
        tPeakGlobal = NaN;
        peakValGlobal = 0;
        for ci = 1:nComp
            if ~compOk(ci), continue; end
            [pv, pi] = max(abs(compErr{ci}));
            if pv > peakValGlobal
                peakValGlobal = pv;
                tPeakGlobal = tBase4(pi);
            end
        end
        zoomHalf4 = 0.05;
        tZoomMin4 = max(tBase4(1),   tPeakGlobal - zoomHalf4);
        tZoomMax4 = min(tBase4(end), tPeakGlobal + zoomHalf4);

        fig4 = figure('Name', 'All Cases vs Ref.Sim.DASSL Baseline');
        configureInteractiveFigure(fig4);

        % ── Top panel: all 5 speed traces ────────────────────────────────
        ax4Top = subplot(3, 1, 1, 'Parent', fig4);
        hold(ax4Top, 'on');

        % Baseline
        baseColor4 = fig4Palette(1,:);
        plot(ax4Top, tBase4, wBase4, '-', 'Color', baseColor4, ...
            'LineWidth', 1.8, 'HandleVisibility', 'off');
        mIdx = 1:2200:numel(tBase4);
        plot(ax4Top, tBase4(mIdx), wBase4(mIdx), ...
            'LineStyle', 'none', 'Marker', fig4Markers{1}, 'MarkerSize', 5, ...
            'MarkerFaceColor', baseColor4, 'MarkerEdgeColor', baseColor4, ...
            'HandleVisibility', 'off');
        hBase4 = plot(ax4Top, NaN, NaN, '-o', 'Color', baseColor4, ...
            'MarkerSize', 5, 'MarkerFaceColor', baseColor4, ...
            'LineWidth', 1.8, 'DisplayName', fig4ShortLabels{1});

        % Four comparison traces
        hComp4 = gobjects(1, nComp);
        for ci = 1:nComp
            if ~compOk(ci), continue; end
            c4 = fig4Palette(ci+1, :);
            stride = 2200;  phase = ci * 550;
            mIdxC = (1+phase):stride:numel(tBase4);
            if isempty(mIdxC), mIdxC = 1; end
            plot(ax4Top, tBase4, compW{ci}, compStyles{ci}, ...
                'Color', c4, 'LineWidth', 1.5, 'HandleVisibility', 'off');
            plot(ax4Top, tBase4(mIdxC), compW{ci}(mIdxC), ...
                'LineStyle', 'none', 'Marker', compMarkers{ci}, 'MarkerSize', 5, ...
                'MarkerFaceColor', 'w', 'MarkerEdgeColor', c4, ...
                'LineWidth', 1.0, 'HandleVisibility', 'off');
            hComp4(ci) = plot(ax4Top, NaN, NaN, [compStyles{ci}, compMarkers{ci}], ...
                'Color', c4, 'MarkerSize', 5, 'MarkerFaceColor', 'w', ...
                'MarkerEdgeColor', c4, 'LineWidth', 1.5, 'DisplayName', fig4ShortLabels{ci+1});
        end

        allHandles4 = [hBase4, hComp4(compOk)];
        xlabel(ax4Top, 'Time (s)');
        ylabel(ax4Top, 'Speed (pu)');
        title(ax4Top, 'Generator Speed -- All Paper Cases');
        lgd4Top = legend(ax4Top, allHandles4, 'Location', 'northeast');
        lgd4Top.TextColor = [0 0 0];
        xline(ax4Top, tZoomMin4, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');
        xline(ax4Top, tZoomMax4, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');

        % ── Middle panel: semilogy absolute error for all 4 comparisons ──
        ax4Mid = subplot(3, 1, 2, 'Parent', fig4);
        hold(ax4Mid, 'on');
        hErr4 = gobjects(1, nComp);
        for ci = 1:nComp
            if ~compOk(ci), continue; end
            c4 = fig4Palette(ci+1, :);
            absE = max(abs(compErr{ci}), eps);
            hErr4(ci) = semilogy(ax4Mid, tBase4, absE, compStyles{ci}, ...
                'Color', c4, 'LineWidth', 1.5, 'DisplayName', ...
                sprintf('| Sim.1 - Sim.%d |', ci+1));
        end
        xline(ax4Mid, tZoomMin4, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');
        xline(ax4Mid, tZoomMax4, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');
        xlabel(ax4Mid, 'Time (s)');
        ylabel(ax4Mid, 'Absolute Speed Error (pu)');
        title(ax4Mid, 'Absolute Error w.r.t. Ref.Sim.DASSL');
        lgd4Mid = legend(ax4Mid, hErr4(compOk), 'Location', 'northeast');
        lgd4Mid.TextColor = [0 0 0];

        % ── Bottom panel: zoomed speed traces ────────────────────────────
        ax4Zoom = subplot(3, 1, 3, 'Parent', fig4);
        hold(ax4Zoom, 'on');
        zMask4 = (tBase4 >= tZoomMin4) & (tBase4 <= tZoomMax4);

        plot(ax4Zoom, tBase4(zMask4), wBase4(zMask4), '-', ...
            'Color', baseColor4, 'LineWidth', 1.8, 'DisplayName', fig4ShortLabels{1});
        for ci = 1:nComp
            if ~compOk(ci), continue; end
            c4z = fig4Palette(ci+1,:);
            lw4z = 1.5;
            if ci == 2  % Sim 3 — dotted style, boost visibility in zoom
                lw4z = 2.5;
                tZoom4  = tBase4(zMask4);
                wZoom4c = compW{ci}(zMask4);
                plot(ax4Zoom, tZoom4, wZoom4c, compStyles{ci}, ...
                    'Color', c4z, 'LineWidth', lw4z, 'HandleVisibility', 'off');
                mIdxZ = round(linspace(1, numel(tZoom4), 12));
                plot(ax4Zoom, tZoom4(mIdxZ), wZoom4c(mIdxZ), ...
                    'LineStyle', 'none', 'Marker', compMarkers{ci}, 'MarkerSize', 6, ...
                    'MarkerFaceColor', c4z, 'MarkerEdgeColor', c4z, ...
                    'HandleVisibility', 'off');
                % Proxy handle combining line + marker for legend
                plot(ax4Zoom, NaN, NaN, [compStyles{ci}, compMarkers{ci}], ...
                    'Color', c4z, 'LineWidth', lw4z, 'MarkerSize', 6, ...
                    'MarkerFaceColor', c4z, 'MarkerEdgeColor', c4z, ...
                    'DisplayName', fig4ShortLabels{ci+1});
            else
                plot(ax4Zoom, tBase4(zMask4), compW{ci}(zMask4), compStyles{ci}, ...
                    'Color', c4z, 'LineWidth', lw4z, ...
                    'DisplayName', fig4ShortLabels{ci+1});
            end
        end

        xlim(ax4Zoom, [tZoomMin4, tZoomMax4]);
        yAllZoom = wBase4(zMask4);
        for ci = 1:nComp
            if compOk(ci), yAllZoom = [yAllZoom; compW{ci}(zMask4)]; end %#ok<AGROW>
        end
        yPad4 = max(2e-7, 0.10 * max(range(yAllZoom), eps));
        ylim(ax4Zoom, [min(yAllZoom)-yPad4, max(yAllZoom)+yPad4]);
        xlabel(ax4Zoom, 'Time (s)');
        ylabel(ax4Zoom, 'Speed (pu)');
        title(ax4Zoom, sprintf('Zoomed View Around Peak Error (%.4f s to %.4f s)', tZoomMin4, tZoomMax4));
        lgd4Zoom = legend(ax4Zoom, 'Location', 'northeast');
        lgd4Zoom.TextColor = [0 0 0];

        exportFigure(fig4, ...
            fullfile(figuresDir, 'fig4_all_cases_vs_baseline.pdf'), ...
            fullfile(figuresMatlabDir, 'fig4_all_cases_vs_baseline.fig'), ...
            interactiveOnly);
    end
end

%% Figure 5 — Ref.Sim.ExpEuler (item 2) vs all other four paper cases (items 1, 3–5).
% Top panel    : speed traces for all 5 cases.
% Middle panel : semilogy absolute error of each case against the baseline.
% Bottom panel : zoomed view around the worst peak error across all four comparisons.

% Baseline is item 2; comparisons are items 1, 3, 4, 5 (indices in fig4Tags).
fig5BaseTag   = 'RefSim_ClockedPSS_CT_Plant_ExpEuler';  % item 2
fig5CompTags  = { ...
    'RefSim_ClockedPSS_CT_Plant', ...   % 1
    'ReferenceSetup', ...               % 3
    'ReferenceSetup_ExpEuler', ...      % 4
    'ReferenceSetup_Clocked'};          % 5
fig5BaseLabel     = 'Ref.Sim.ExpEuler';
fig5CompLabels    = {'Ref.Sim.DASSL', 'Ref.Setup', 'Ref.Setup.ExpEuler', 'Ref.Setup.Clocked'};
fig5BaseShort     = 'Sim 2';
fig5CompShorts    = {'Sim 1', 'Sim 3', 'Sim 4', 'Sim 5'};
% Original item numbers for error labels (items that are compared against item 2)
fig5CompItemNums  = [1, 3, 4, 5];
fig5Styles        = {'--', '-', ':', '-.', '--'};   % index 1=base, 2-5=comps
fig5Markers       = {'s', 'o', 'd', '^', 'v'};
fig5Palette       = sciplot_colors('high-vis');
fig5Palette(5,:)  = [0.90, 0.45, 0.00];  % replace yellow (Sim 5) with orange
% Assign colors: base=color2 (red), comps get colors 1,3,4,5 to stay consistent with Fig4
fig5BaseColor     = fig5Palette(2,:);   % red  — Ref.Sim.ExpEuler
fig5CompColors    = fig5Palette([1,3,4,5],:);  % blue, green, purple, orange

% Locate tags in the models array.
fig5BaseIdx = find(strcmp({models.tag}, fig5BaseTag), 1);
fig5CompIdx = zeros(1, 4);
for fi = 1:4
    idx = find(strcmp({models.tag}, fig5CompTags{fi}), 1);
    if ~isempty(idx), fig5CompIdx(fi) = idx; end
end

if isempty(fig5BaseIdx) || fig5BaseIdx == 0
    warning('plot_grid4chil_results:fig5NoBaseline', ...
        'Figure 5: baseline model Ref.Sim.ExpEuler not found, skipping.');
else
    mdlBase5 = models(fig5BaseIdx);
    [tBase5, wBase5, okBase5] = getSignalData(mdlBase5, SIG.w);

    if ~okBase5
        warning('plot_grid4chil_results:fig5NoBaseSignal', ...
            'Figure 5: speed signal not available for baseline, skipping.');
    else
        tBase5 = tBase5(:);
        wBase5 = wBase5(:);

        nComp5   = 4;
        comp5Err  = cell(1, nComp5);
        comp5Ok   = false(1, nComp5);
        comp5TPeak = NaN(1, nComp5);
        comp5W    = cell(1, nComp5);

        for ci = 1:nComp5
            if fig5CompIdx(ci) == 0
                warning('plot_grid4chil_results:fig5MissingCase', ...
                    'Figure 5: model "%s" not found, skipping.', fig5CompLabels{ci});
                continue;
            end
            [tC, wC, okC] = getSignalData(models(fig5CompIdx(ci)), SIG.w);
            if ~okC, continue; end
            tC = tC(:); wC = wC(:);
            [tCu, uIdx] = unique(tC, 'stable');
            wCu = wC(uIdx);
            wCinterp = interp1(tCu, wCu, tBase5, 'linear', 'extrap');
            comp5W{ci}   = wCinterp;
            comp5Err{ci} = wBase5 - wCinterp;
            comp5Ok(ci)  = true;

            maxEi = max(abs(comp5Err{ci}));
            rmsEi = sqrt(mean(comp5Err{ci}.^2));
            [~, iPeak] = max(abs(comp5Err{ci}));
            comp5TPeak(ci) = tBase5(iPeak);
            fprintf('Figure 5 [%s vs Ref.Sim.ExpEuler]: max|err|=%.6e pu, RMS=%.6e pu, peak@t=%.6f s\n', ...
                fig5CompLabels{ci}, maxEi, rmsEi, comp5TPeak(ci));
        end

        % LaTeX table.
        fprintf('\n%% ---- Figure 5 error summary (copy-paste into LaTeX) ----\n');
        fprintf('\\begin{table}[ht]\n');
        fprintf('\\centering\n');
        fprintf('\\caption{Generator speed error relative to \\texttt{Ref.Sim.ExpEuler} (case~2).}\n');
        fprintf('\\label{tab:speed_error_summary_fig5}\n');
        fprintf('\\begin{tabular}{lSSS}\n');
        fprintf('\\toprule\n');
        fprintf('Case & {$\\max|\\epsilon|$ (pu)} & {RMS $\\epsilon$ (pu)} & {$t_{\\max}$ (s)} \\\\\n');
        fprintf('\\midrule\n');
        for ci = 1:nComp5
            if ~comp5Ok(ci)
                fprintf('\\texttt{%s} & {---} & {---} & {---} \\\\\n', fig5CompLabels{ci});
                continue;
            end
            maxEi = max(abs(comp5Err{ci}));
            rmsEi = sqrt(mean(comp5Err{ci}.^2));
            fprintf('\\texttt{%s} & %.4e & %.4e & %.4f \\\\\n', fig5CompLabels{ci}, maxEi, rmsEi, comp5TPeak(ci));
        end
        fprintf('\\bottomrule\n');
        fprintf('\\end{tabular}\n');
        fprintf('\\end{table}\n');
        fprintf('%% ---------------------------------------------------------\n\n');

        % Global worst peak for zoom window.
        tPeakGlobal5 = NaN;
        peakValGlobal5 = 0;
        for ci = 1:nComp5
            if ~comp5Ok(ci), continue; end
            [pv, pi] = max(abs(comp5Err{ci}));
            if pv > peakValGlobal5
                peakValGlobal5 = pv;
                tPeakGlobal5 = tBase5(pi);
            end
        end
        zoomHalf5 = 0.05;
        tZoomMin5 = max(tBase5(1),   tPeakGlobal5 - zoomHalf5);
        tZoomMax5 = min(tBase5(end), tPeakGlobal5 + zoomHalf5);

        fig5 = figure('Name', 'All Cases vs Ref.Sim.ExpEuler Baseline');
        configureInteractiveFigure(fig5);

        % ── Top panel: all 5 speed traces ────────────────────────────────
        ax5Top = subplot(3, 1, 1, 'Parent', fig5);
        hold(ax5Top, 'on');

        % Baseline trace
        plot(ax5Top, tBase5, wBase5, fig5Styles{1}, 'Color', fig5BaseColor, ...
            'LineWidth', 1.8, 'HandleVisibility', 'off');
        mIdx5b = 1:2200:numel(tBase5);
        plot(ax5Top, tBase5(mIdx5b), wBase5(mIdx5b), ...
            'LineStyle', 'none', 'Marker', fig5Markers{1}, 'MarkerSize', 5, ...
            'MarkerFaceColor', fig5BaseColor, 'MarkerEdgeColor', fig5BaseColor, ...
            'HandleVisibility', 'off');
        hBase5 = plot(ax5Top, NaN, NaN, ['--', fig5Markers{1}], 'Color', fig5BaseColor, ...
            'MarkerSize', 5, 'MarkerFaceColor', fig5BaseColor, ...
            'LineWidth', 1.8, 'DisplayName', fig5BaseShort);

        % Four comparison traces
        hComp5 = gobjects(1, nComp5);
        compStylesFig5 = {'-', ':', '-.', '--'};  % styles for comps (items 1,3,4,5)
        compMarkersFig5 = {'o', 'd', '^', 'v'};
        for ci = 1:nComp5
            if ~comp5Ok(ci), continue; end
            c5 = fig5CompColors(ci,:);
            stride = 2200; phase = ci * 550;
            mIdxC5 = (1+phase):stride:numel(tBase5);
            if isempty(mIdxC5), mIdxC5 = 1; end
            plot(ax5Top, tBase5, comp5W{ci}, compStylesFig5{ci}, ...
                'Color', c5, 'LineWidth', 1.5, 'HandleVisibility', 'off');
            plot(ax5Top, tBase5(mIdxC5), comp5W{ci}(mIdxC5), ...
                'LineStyle', 'none', 'Marker', compMarkersFig5{ci}, 'MarkerSize', 5, ...
                'MarkerFaceColor', 'w', 'MarkerEdgeColor', c5, ...
                'LineWidth', 1.0, 'HandleVisibility', 'off');
            hComp5(ci) = plot(ax5Top, NaN, NaN, [compStylesFig5{ci}, compMarkersFig5{ci}], ...
                'Color', c5, 'MarkerSize', 5, 'MarkerFaceColor', 'w', ...
                'MarkerEdgeColor', c5, 'LineWidth', 1.5, 'DisplayName', fig5CompShorts{ci});
        end

        allHandles5 = [hBase5, hComp5(comp5Ok)];
        xlabel(ax5Top, 'Time (s)');
        ylabel(ax5Top, 'Speed (pu)');
        title(ax5Top, 'Generator Speed -- All Paper Cases');
        lgd5Top = legend(ax5Top, allHandles5, 'Location', 'northeast');
        lgd5Top.TextColor = [0 0 0];
        xline(ax5Top, tZoomMin5, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');
        xline(ax5Top, tZoomMax5, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');

        % ── Middle panel: semilogy absolute error ─────────────────────────
        ax5Mid = subplot(3, 1, 2, 'Parent', fig5);
        hold(ax5Mid, 'on');
        hErr5 = gobjects(1, nComp5);
        for ci = 1:nComp5
            if ~comp5Ok(ci), continue; end
            c5 = fig5CompColors(ci,:);
            absE5 = max(abs(comp5Err{ci}), eps);
            hErr5(ci) = semilogy(ax5Mid, tBase5, absE5, compStylesFig5{ci}, ...
                'Color', c5, 'LineWidth', 1.5, 'DisplayName', ...
                sprintf('| Sim.2 - Sim.%d |', fig5CompItemNums(ci)));
        end
        xline(ax5Mid, tZoomMin5, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');
        xline(ax5Mid, tZoomMax5, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');
        xlabel(ax5Mid, 'Time (s)');
        ylabel(ax5Mid, 'Absolute Speed Error (pu)');
        title(ax5Mid, 'Absolute Error w.r.t. Ref.Sim.ExpEuler');
        lgd5Mid = legend(ax5Mid, hErr5(comp5Ok), 'Location', 'northeast');
        lgd5Mid.TextColor = [0 0 0];

        % ── Bottom panel: zoomed speed traces ────────────────────────────
        ax5Zoom = subplot(3, 1, 3, 'Parent', fig5);
        hold(ax5Zoom, 'on');
        zMask5 = (tBase5 >= tZoomMin5) & (tBase5 <= tZoomMax5);

        plot(ax5Zoom, tBase5(zMask5), wBase5(zMask5), '--', ...
            'Color', fig5BaseColor, 'LineWidth', 1.8, 'DisplayName', fig5BaseShort);
        for ci = 1:nComp5
            if ~comp5Ok(ci), continue; end
            c5z = fig5CompColors(ci,:);
            lw5z = 1.5;
            if strcmp(compStylesFig5{ci}, ':')  % dotted line — boost visibility
                lw5z = 2.5;
                tZoom5  = tBase5(zMask5);
                wZoom5c = comp5W{ci}(zMask5);
                plot(ax5Zoom, tZoom5, wZoom5c, compStylesFig5{ci}, ...
                    'Color', c5z, 'LineWidth', lw5z, 'HandleVisibility', 'off');
                mIdxZ5 = round(linspace(1, numel(tZoom5), 12));
                plot(ax5Zoom, tZoom5(mIdxZ5), wZoom5c(mIdxZ5), ...
                    'LineStyle', 'none', 'Marker', compMarkersFig5{ci}, 'MarkerSize', 6, ...
                    'MarkerFaceColor', c5z, 'MarkerEdgeColor', c5z, ...
                    'HandleVisibility', 'off');
                plot(ax5Zoom, NaN, NaN, [compStylesFig5{ci}, compMarkersFig5{ci}], ...
                    'Color', c5z, 'LineWidth', lw5z, 'MarkerSize', 6, ...
                    'MarkerFaceColor', c5z, 'MarkerEdgeColor', c5z, ...
                    'DisplayName', fig5CompShorts{ci});
            else
                plot(ax5Zoom, tBase5(zMask5), comp5W{ci}(zMask5), compStylesFig5{ci}, ...
                    'Color', c5z, 'LineWidth', lw5z, ...
                    'DisplayName', fig5CompShorts{ci});
            end
        end

        xlim(ax5Zoom, [tZoomMin5, tZoomMax5]);
        yAllZoom5 = wBase5(zMask5);
        for ci = 1:nComp5
            if comp5Ok(ci), yAllZoom5 = [yAllZoom5; comp5W{ci}(zMask5)]; end %#ok<AGROW>
        end
        yPad5 = max(2e-7, 0.10 * max(range(yAllZoom5), eps));
        ylim(ax5Zoom, [min(yAllZoom5)-yPad5, max(yAllZoom5)+yPad5]);
        xlabel(ax5Zoom, 'Time (s)');
        ylabel(ax5Zoom, 'Speed (pu)');
        title(ax5Zoom, sprintf('Zoomed View Around Peak Error (%.4f s to %.4f s)', tZoomMin5, tZoomMax5));
        lgd5Zoom = legend(ax5Zoom, 'Location', 'northeast');
        lgd5Zoom.TextColor = [0 0 0];

        exportFigure(fig5, ...
            fullfile(figuresDir, 'fig5_all_cases_vs_expeuler.pdf'), ...
            fullfile(figuresMatlabDir, 'fig5_all_cases_vs_expeuler.fig'), ...
            interactiveOnly);
    end
end

% =========================================================================
% Helpers
% =========================================================================

function hLegend = plotSignal(ax, mdl, sigNames)
% Plot one logical signal from a loaded model result onto axes ax.
% sigNames can be a char or a cell array of candidate names; the first
% name that returns non-empty data is used. This handles differing signal
% hierarchies across model families transparently.
% Constants stored by Dymola as 2-point vectors are broadcast across time.
% Silently skips if no candidate yields data or the model failed to load.
hLegend = gobjects(1);
if isempty(mdl.res)
    return;
end
if ischar(sigNames)
    sigNames = {sigNames};
end
try
    t = dymget(mdl.res, 'Time');
    sig = [];
    for c = 1:numel(sigNames)
        try
            candidate = dymget(mdl.res, sigNames{c});
            if ~isempty(candidate)
                sig = candidate;
                break;
            end
        catch
            % This candidate name does not exist in this model — try next.
        end
    end
    if isempty(sig)
        return;
    end
    % Dymola stores parameter/constant signals as 2-element vectors.
    % Replicate the constant value across the full time vector so it plots.
    if numel(sig) == 2 && numel(t) > 2
        sig = repmat(sig(1), size(t));
    end
    % Use all points for the line; markers/legend each use their own
    % undersampled data vectors to reduce visual overlap.
    markerStep = max(20, floor(numel(t) / mdl.markerStride));
    markerStart = 1 + mod(mdl.markerPhase, markerStep);
    markerIdx = markerStart:markerStep:numel(t);
    if isempty(markerIdx)
        markerIdx = 1;
    end
    legendStep = max(40, floor(numel(t) / (mdl.markerStride + 8)));
    legendStart = 1 + mod(mdl.markerPhase + 3, legendStep);
    legendIdx = legendStart:legendStep:numel(t);
    if isempty(legendIdx)
        legendIdx = 1;
    end

    plot(ax, t, sig, ...
        'LineStyle',   mdl.style, ...
        'Color',       mdl.color, ...
        'HandleVisibility', 'off');

    plot(ax, t(markerIdx), sig(markerIdx), ...
        'LineStyle',   'none', ...
        'Color',       mdl.color, ...
        'Marker',      mdl.marker, ...
        'MarkerSize',  6, ...
        'HandleVisibility', 'off');

    hLegend = plot(ax, NaN, NaN, ...
        'LineStyle',   mdl.style, ...
        'Color',       mdl.color, ...
        'Marker',      mdl.marker, ...
        'MarkerSize',  6, ...
        'DisplayName', mdl.label);
    hold(ax, 'on');
catch
    % Signal not found in this variant — skip silently.
end
end

function [t, sig, ok] = getSignalData(mdl, sigNames)
% Get time and one resolved signal vector from a model result.
% Returns ok=false when model/signal data is not available.
t = [];
sig = [];
ok = false;
if isempty(mdl.res)
    return;
end
if ischar(sigNames)
    sigNames = {sigNames};
end
try
    t = dymget(mdl.res, 'Time');
    for c = 1:numel(sigNames)
        try
            candidate = dymget(mdl.res, sigNames{c});
            if ~isempty(candidate)
                sig = candidate;
                break;
            end
        catch
            % Candidate signal path not present in this model.
        end
    end
    if isempty(sig)
        return;
    end
    if numel(sig) == 2 && numel(t) > 2
        sig = repmat(sig(1), size(t));
    end
    ok = true;
catch
    ok = false;
end
end

function res = loadModel(matFile, tag)
% Load a dsres.mat result file; returns empty struct on failure.
res = [];
if ~isfile(matFile)
    warning('plot_grid4chil_results:missingFile', ...
            'Result file not found for %s: %s', tag, matFile);
    return;
end
try
    res = dymload(matFile);
catch ME
    warning('plot_grid4chil_results:loadFailed', ...
            'Failed to load %s: %s', tag, ME.message);
end
end

% saveFigure has been replaced by sciplot_export() calls at each figure site.

function resultsDir = resolveResultsDir(defaultResultsDir)
% Honour GRID4CHIL_RESULTS_DIR override (same logic as run_dymola_simulations.m).
resultsDir = defaultResultsDir;
fromEnv = strtrim(getenv('GRID4CHIL_RESULTS_DIR'));
if ~isempty(fromEnv)
    resultsDir = fromEnv;
end
end

function dymolaRoot = locateDymolaRoot()
% Find newest Dymola installation under C:\Program Files\Dymola*.
defaultRoot = fullfile('C:\', 'Program Files', 'Dymola 2026x Refresh 1');
if isfolder(defaultRoot)
    dymolaRoot = defaultRoot;
    return;
end
roots = dir(fullfile('C:\', 'Program Files', 'Dymola*'));
roots = roots([roots.isdir]);
if isempty(roots)
    error('plot_grid4chil_results:noDymola', ...
          'No Dymola installation found under C:\\Program Files.');
end
dates = datenum({roots.date});
[~, idx] = max(dates);
dymolaRoot = fullfile(roots(idx).folder, roots(idx).name);
end

function configureInteractiveFigure(fig)
% Ensure figure has standard MATLAB UI controls for zoom/pan when desktop is available.
if usejava('desktop')
    set(fig, 'Toolbar', 'figure');
    set(fig, 'MenuBar', 'figure');
end
end

function exportFigure(fig, pdfPath, figPath, interactiveOnly)
% Save MATLAB .fig always; save PDF only when interactiveOnly is false.
savefig(fig, figPath);
if ~interactiveOnly
    sciplot_export(pdfPath, fig);
end
end
