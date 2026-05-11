function renderAnalysisOutputs(bundle, models, SIG, figsOutputDir, interactiveOnly, figurePositionPx)
%RENDERANALYSISOUTPUTS Render figures using precomputed analysis structs.

if ~isfolder(figsOutputDir)
    mkdir(figsOutputDir);
end

plotAllVariantsFigure(models, SIG.w, figsOutputDir, interactiveOnly, figurePositionPx);

plotComparisonSuite(bundle.fig2, ...
    struct('figureName', 'Ref.Sim Comparison', ...
           'topTitle', 'Ref.Sim.DASSL vs Ref.Sim.ExpEuler', ...
           'midTitle', sprintf('Absolute Error (max = %.3e pu, RMS = %.3e pu)', ...
               bundle.fig2.maxAbsErr, bundle.fig2.rmsErr), ...
           'zoomTitle', 'Zoomed View (3.10 s to 3.35 s)', ...
           'errorLabel', '|Ref.Sim.DASSL - Ref.Sim.ExpEuler|', ...
           'pdfName', 'fig2_refsim_speed_and_error.pdf', ...
           'figName', 'fig2_refsim_speed_and_error.fig'), ...
    figsOutputDir, interactiveOnly, figurePositionPx);

plotComparisonSuite(bundle.fig3, ...
    struct('figureName', 'Ref.Sim vs Ref.Setup Comparison', ...
           'topTitle', 'Ref.Sim.DASSL vs Ref.Setup', ...
           'midTitle', sprintf('Absolute Error (max = %.3e pu, RMS = %.3e pu)', ...
               bundle.fig3.maxAbsErr, bundle.fig3.rmsErr), ...
           'zoomTitle', sprintf('Zoomed View Around Peak Error (%.4f s to %.4f s)', ...
               bundle.fig3.zoomWindow(1), bundle.fig3.zoomWindow(2)), ...
           'errorLabel', '|Ref.Sim.DASSL - Ref.Setup|', ...
           'pdfName', 'fig3_refsim_vs_refsetup_speed_and_error.pdf', ...
           'figName', 'fig3_refsim_vs_refsetup_speed_and_error.fig'), ...
    figsOutputDir, interactiveOnly, figurePositionPx);

plotBaselineSweepFigure(bundle.fig4, ...
    struct('figureName', 'All Cases vs Ref.Sim.DASSL Baseline', ...
           'topTitle', 'Reference  -- Ref.Sim.DASSL Baseline', ...
           'midTitle', 'Absolute Error w.r.t. Ref.Sim.DASSL', ...
           'zoomTitle', sprintf('Zoomed View Around Peak Error (%.4f s to %.4f s)', ...
               bundle.fig4.zoomWindow(1), bundle.fig4.zoomWindow(2)), ...
           'pdfName', 'fig4_all_cases_vs_baseline.pdf', ...
           'figName', 'fig4_all_cases_vs_baseline.fig'), ...
    figsOutputDir, interactiveOnly, figurePositionPx);

plotBaselineSweepFigure(bundle.fig5, ...
    struct('figureName', 'All Cases vs Ref.Sim.ExpEuler Baseline', ...
           'topTitle', 'Reference  -- Ref.Sim.ExpEuler Baseline', ...
           'midTitle', 'Absolute Error w.r.t. Ref.Sim.ExpEuler', ...
           'zoomTitle', sprintf('Zoomed View Around Peak Error (%.4f s to %.4f s)', ...
               bundle.fig5.zoomWindow(1), bundle.fig5.zoomWindow(2)), ...
           'pdfName', 'fig5_all_cases_vs_expeuler.pdf', ...
           'figName', 'fig5_all_cases_vs_expeuler.fig'), ...
    figsOutputDir, interactiveOnly, figurePositionPx);
end

function plotAllVariantsFigure(models, sigNames, figsOutputDir, interactiveOnly, figurePositionPx)
fig = figure('Name', 'Generator Speed - All Variants');
configureInteractiveFigure(fig, figurePositionPx);
ax = axes(fig);
hold(ax, 'on');

legendHandles = gobjects(1, numel(models));
for k = 1:numel(models)
    legendHandles(k) = plotSignalSeries(ax, models(k), sigNames);
end

xlabel(ax, 'Time (s)');
ylabel(ax, 'Speed (pu)');
title(ax, 'Generator Speed -- All Simulation Variants');
legendHandles = legendHandles(isgraphics(legendHandles));
if ~isempty(legendHandles)
    lgd = legend(ax, legendHandles, 'Location', 'best');
    lgd.TextColor = [0 0 0];
end
exportFigure(fig, fullfile(figsOutputDir, 'fig1_speed_all.pdf'), ...
    fullfile(figsOutputDir, 'fig1_speed_all.fig'), interactiveOnly);
end

function plotComparisonSuite(analysis, plotDef, figsOutputDir, interactiveOnly, figurePositionPx)
if ~analysis.ok
    return;
end

fig = figure('Name', plotDef.figureName);
configureInteractiveFigure(fig, figurePositionPx);

axTop = subplot(3, 1, 1, 'Parent', fig);
hold(axTop, 'on');
hBase = plotDecoratedTrace(axTop, analysis.t, analysis.baseSignal, analysis.base, ...
    'showLegend', true, 'filledMarker', true);
hComp = plotDecoratedTrace(axTop, analysis.t, analysis.compareSignal, analysis.compare, ...
    'showLegend', true, 'filledMarker', false, 'markerPhase', 1100);
xlabel(axTop, 'Time (s)');
ylabel(axTop, 'Speed (pu)');
title(axTop, plotDef.topTitle);
lgd = legend(axTop, [hBase, hComp], 'Location', 'best');
lgd.TextColor = [0 0 0];
addZoomGuides(axTop, analysis.zoomWindow);

axMid = subplot(3, 1, 2, 'Parent', fig);
hold(axMid, 'on');
plot(axMid, analysis.t, abs(analysis.err), '-', ...
    'Color', analysis.base.color, 'LineWidth', 1.5, 'DisplayName', plotDef.errorLabel);
addZoomGuides(axMid, analysis.zoomWindow);
xlabel(axMid, 'Time (s)');
ylabel(axMid, 'Absolute Speed Error (pu)');
title(axMid, plotDef.midTitle);
lgd = legend(axMid, 'Location', 'best');
lgd.TextColor = [0 0 0];

axZoom = subplot(3, 1, 3, 'Parent', fig);
hold(axZoom, 'on');
zoomMask = analysis.t >= analysis.zoomWindow(1) & analysis.t <= analysis.zoomWindow(2);
plot(axZoom, analysis.t(zoomMask), analysis.baseSignal(zoomMask), analysis.base.lineStyle, ...
    'Color', analysis.base.color, 'LineWidth', 1.5, 'DisplayName', analysis.base.label);
plotZoomTrace(axZoom, analysis.t(zoomMask), analysis.compareSignal(zoomMask), analysis.compare);
setZoomAxes(axZoom, analysis.t(zoomMask), [analysis.baseSignal(zoomMask); analysis.compareSignal(zoomMask)]);
xlabel(axZoom, 'Time (s)');
ylabel(axZoom, 'Speed (pu)');
title(axZoom, plotDef.zoomTitle);
lgd = legend(axZoom, 'Location', 'best');
lgd.TextColor = [0 0 0];

exportFigure(fig, fullfile(figsOutputDir, plotDef.pdfName), ...
    fullfile(figsOutputDir, plotDef.figName), interactiveOnly);
end

function plotBaselineSweepFigure(analysis, plotDef, figsOutputDir, interactiveOnly, figurePositionPx)
if ~analysis.ok
    return;
end

fig = figure('Name', plotDef.figureName);
configureInteractiveFigure(fig, figurePositionPx);

axTop = subplot(3, 1, 1, 'Parent', fig);
hold(axTop, 'on');
baseMeta = struct('label', analysis.baseline.shortLabel, 'lineStyle', analysis.baseline.lineStyle, ...
    'marker', analysis.baseline.marker, 'color', analysis.baseline.color);
hBase = plotDecoratedTrace(axTop, analysis.t, analysis.baselineSignal, baseMeta, ...
    'showLegend', true, 'filledMarker', true);

hComp = gobjects(1, numel(analysis.comparisons));
for k = 1:numel(analysis.comparisons)
    comp = analysis.comparisons(k);
    if ~comp.ok, continue; end
    compMeta = struct('label', comp.shortLabel, 'lineStyle', comp.lineStyle, ...
        'marker', comp.marker, 'color', comp.color);
    hComp(k) = plotDecoratedTrace(axTop, analysis.t, comp.signal, compMeta, ...
        'showLegend', true, 'filledMarker', false, 'markerPhase', k * 550);
end

allHandles = [hBase, hComp(isgraphics(hComp))];
xlabel(axTop, 'Time (s)');
ylabel(axTop, 'Speed (pu)');
title(axTop, plotDef.topTitle);
lgd = legend(axTop, allHandles, 'Location', 'northeast');
lgd.TextColor = [0 0 0];
addZoomGuides(axTop, analysis.zoomWindow);

axMid = subplot(3, 1, 2, 'Parent', fig);
hold(axMid, 'on');
hErr = gobjects(1, numel(analysis.comparisons));
for k = 1:numel(analysis.comparisons)
    comp = analysis.comparisons(k);
    if ~comp.ok, continue; end
    hErr(k) = plot(axMid, analysis.t, abs(comp.err), comp.lineStyle, ...
        'Color', comp.color, 'LineWidth', 1.5, 'DisplayName', ...
        sprintf('| %s - %s |', analysis.baseline.shortLabel, comp.shortLabel));
end
addZoomGuides(axMid, analysis.zoomWindow);
xlabel(axMid, 'Time (s)');
ylabel(axMid, 'Absolute Speed Error (pu)');
title(axMid, plotDef.midTitle);
lgd = legend(axMid, hErr(isgraphics(hErr)), 'Location', 'northeast');
lgd.TextColor = [0 0 0];

axZoom = subplot(3, 1, 3, 'Parent', fig);
hold(axZoom, 'on');
zoomMask = analysis.t >= analysis.zoomWindow(1) & analysis.t <= analysis.zoomWindow(2);
plot(axZoom, analysis.t(zoomMask), analysis.baselineSignal(zoomMask), analysis.baseline.lineStyle, ...
    'Color', analysis.baseline.color, 'LineWidth', 1.8, 'DisplayName', analysis.baseline.shortLabel);
for k = 1:numel(analysis.comparisons)
    comp = analysis.comparisons(k);
    if ~comp.ok, continue; end
    compMeta = struct('label', comp.shortLabel, 'lineStyle', comp.lineStyle, ...
        'marker', comp.marker, 'color', comp.color);
    plotZoomTrace(axZoom, analysis.t(zoomMask), comp.signal(zoomMask), compMeta);
end

zoomSignals = analysis.baselineSignal(zoomMask);
for k = 1:numel(analysis.comparisons)
    comp = analysis.comparisons(k);
    if comp.ok
        zoomSignals = [zoomSignals; comp.signal(zoomMask)]; %#ok<AGROW>
    end
end
setZoomAxes(axZoom, analysis.t(zoomMask), zoomSignals);
xlabel(axZoom, 'Time (s)');
ylabel(axZoom, 'Speed (pu)');
title(axZoom, plotDef.zoomTitle);
lgd = legend(axZoom, 'Location', 'northeast');
lgd.TextColor = [0 0 0];

exportFigure(fig, fullfile(figsOutputDir, plotDef.pdfName), ...
    fullfile(figsOutputDir, plotDef.figName), interactiveOnly);
end

function hLegend = plotDecoratedTrace(ax, t, y, meta, varargin)
opts = struct('showLegend', true, 'filledMarker', false, 'markerPhase', 1, 'markerStride', 2200);
opts = parseNameValue(opts, varargin{:});

plot(ax, t, y, meta.lineStyle, 'Color', meta.color, 'LineWidth', 1.6, 'HandleVisibility', 'off');
markerIdx = (1 + max(0, opts.markerPhase - 1)):opts.markerStride:numel(t);
if isempty(markerIdx)
    markerIdx = 1;
end

faceColor = 'w';
if opts.filledMarker
    faceColor = meta.color;
end
plot(ax, t(markerIdx), y(markerIdx), 'LineStyle', 'none', 'Marker', meta.marker, ...
    'MarkerSize', 5, 'MarkerFaceColor', faceColor, 'MarkerEdgeColor', meta.color, ...
    'LineWidth', 1.0, 'HandleVisibility', 'off');

hLegend = gobjects(1);
if opts.showLegend
    hLegend = plot(ax, NaN, NaN, [meta.lineStyle, meta.marker], 'Color', meta.color, ...
        'MarkerSize', 5, 'MarkerFaceColor', faceColor, 'MarkerEdgeColor', meta.color, ...
        'LineWidth', 1.6, 'DisplayName', meta.label);
end
end

function plotZoomTrace(ax, t, y, meta)
if strcmp(meta.lineStyle, ':')
    plot(ax, t, y, meta.lineStyle, 'Color', meta.color, 'LineWidth', 2.5, 'HandleVisibility', 'off');
    markerCount = min(12, max(2, numel(t)));
    markerIdx = round(linspace(1, numel(t), markerCount));
    plot(ax, t(markerIdx), y(markerIdx), 'LineStyle', 'none', 'Marker', meta.marker, ...
        'MarkerSize', 6, 'MarkerFaceColor', meta.color, 'MarkerEdgeColor', meta.color, ...
        'HandleVisibility', 'off');
    plot(ax, NaN, NaN, [meta.lineStyle, meta.marker], 'Color', meta.color, ...
        'LineWidth', 2.5, 'MarkerSize', 6, 'MarkerFaceColor', meta.color, ...
        'MarkerEdgeColor', meta.color, 'DisplayName', meta.label);
else
    plot(ax, t, y, meta.lineStyle, 'Color', meta.color, 'LineWidth', 1.5, ...
        'DisplayName', meta.label);
end
end

function setZoomAxes(ax, t, y)
xlim(ax, [t(1), t(end)]);
yPad = max(2e-7, 0.10 * max(range(y), eps));
ylim(ax, [min(y) - yPad, max(y) + yPad]);
end

function addZoomGuides(ax, zoomWindow)
xline(ax, zoomWindow(1), ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');
xline(ax, zoomWindow(2), ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.0, 'HandleVisibility', 'off');
end

function hLegend = plotSignalSeries(ax, mdl, sigNames)
hLegend = gobjects(1);
[t, sig, ok] = getSignalData(mdl, sigNames);
if ~ok
    return;
end

t = t(:);
sig = sig(:);
plot(ax, t, sig, 'LineStyle', mdl.style, 'Color', mdl.color, 'HandleVisibility', 'off');
markerStep = max(20, floor(numel(t) / 16));
markerIdx = 1:markerStep:numel(t);
plot(ax, t(markerIdx), sig(markerIdx), 'LineStyle', 'none', 'Color', mdl.color, ...
    'Marker', mdl.marker, 'MarkerSize', 6, 'HandleVisibility', 'off');
hLegend = plot(ax, NaN, NaN, 'LineStyle', mdl.style, 'Color', mdl.color, ...
    'Marker', mdl.marker, 'MarkerSize', 6, 'DisplayName', mdl.label);
end

function opts = parseNameValue(opts, varargin)
for k = 1:2:numel(varargin)
    opts.(varargin{k}) = varargin{k+1};
end
end

function [t, sig, ok] = getSignalData(mdl, sigNames)
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

function configureInteractiveFigure(fig, figurePositionPx)
if usejava('desktop')
    set(fig, 'Toolbar', 'figure');
    set(fig, 'MenuBar', 'figure');
end

if nargin < 2 || isempty(figurePositionPx)
    return;
end

screenSize = get(groot, 'ScreenSize');
figLeft = max(screenSize(1), figurePositionPx(1));
figBottom = max(screenSize(2), figurePositionPx(2));
figWidth = min(figurePositionPx(3), max(200, screenSize(3) - 20));
figHeight = min(figurePositionPx(4), max(200, screenSize(4) - 80));
figLeft = min(figLeft, screenSize(1) + screenSize(3) - figWidth - 20);
figBottom = min(figBottom, screenSize(2) + screenSize(4) - figHeight - 80);

set(fig, 'Units', 'pixels');
set(fig, 'Position', [figLeft, figBottom, figWidth, figHeight]);
end

function exportFigure(fig, pdfPath, figPath, interactiveOnly)
savefig(fig, figPath);
if ~interactiveOnly
    exportgraphics(fig, pdfPath, 'ContentType', 'vector');
end
end
