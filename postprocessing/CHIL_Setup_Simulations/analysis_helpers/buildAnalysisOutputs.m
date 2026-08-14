function bundle = buildAnalysisOutputs(models, SIG, paperCases)
%BUILDANALYSISOUTPUTS Compute diagnostics before any plotting happens.

bundle = struct();
bundle.fig2 = buildPairwiseComparisonAnalysis(models, SIG.w, ...
    'RefSim_ClockedPSS_CT_Plant', 'Ref.Sim.DASSL', '-', 'o', paperCases(1).color, ...
    'RefSim_ClockedPSS_CT_Plant_ExpEuler', 'Ref.Sim.ExpEuler', '--', 's', paperCases(2).color, ...
    struct('figureNumber', 2, 'zoomMode', 'fixed', 'zoomWindow', [3.10, 3.35]));

bundle.fig3 = buildPairwiseComparisonAnalysis(models, SIG.w, ...
    'RefSim_ClockedPSS_CT_Plant', 'Ref.Sim.DASSL', '-', 'o', paperCases(1).color, ...
    'ReferenceSetup', 'Ref.Setup', '--', 's', paperCases(2).color, ...
    struct('figureNumber', 3, 'zoomMode', 'peak', 'zoomHalfWindow', 0.05));

bundle.fig4 = buildBaselineSweepAnalysis(models, SIG.w, paperCases, 1, 4);
bundle.fig5 = buildBaselineSweepAnalysis(models, SIG.w, paperCases, 2, 5);
end

function analysis = buildPairwiseComparisonAnalysis(models, sigNames, ...
    baseTag, baseLabel, baseStyle, baseMarker, baseColor, ...
    compTag, compLabel, compStyle, compMarker, compColor, opts)
analysis = struct('ok', false, 'figureNumber', opts.figureNumber, ...
    'base', [], 'compare', [], 't', [], 'baseSignal', [], 'compareSignal', [], ...
    'err', [], 'maxAbsErr', NaN, 'rmsErr', NaN, 'peakTime', NaN, ...
    'zoomWindow', [NaN, NaN], 'warningId', '', 'warningMessage', '');

[mdlBase, okBaseModel] = findModelByTag(models, baseTag);
[mdlComp, okCompModel] = findModelByTag(models, compTag);
if ~(okBaseModel && okCompModel)
    analysis.warningId = 'buildAnalysisOutputs:missingModel';
    analysis.warningMessage = sprintf('Figure %d: required model tags not found.', opts.figureNumber);
    warning(analysis.warningId, '%s', analysis.warningMessage);
    return;
end

[tBase, yBase, okBaseSignal] = getSignalData(mdlBase, sigNames);
[tComp, yComp, okCompSignal] = getSignalData(mdlComp, sigNames);
if ~(okBaseSignal && okCompSignal)
    analysis.warningId = 'buildAnalysisOutputs:missingSignal';
    analysis.warningMessage = sprintf('Figure %d: speed signal data missing for comparison.', opts.figureNumber);
    warning(analysis.warningId, '%s', analysis.warningMessage);
    return;
end

tBase = tBase(:);
yBase = yBase(:);
tComp = tComp(:);
yComp = yComp(:);

[tCompUnique, uniqueIdx] = unique(tComp, 'stable');
yCompUnique = yComp(uniqueIdx);
yCompOnBase = interp1(tCompUnique, yCompUnique, tBase, 'linear', 'extrap');
err = yBase - yCompOnBase;
[maxAbsErr, idxPeak] = max(abs(err));
rmsErr = sqrt(mean(err.^2));
peakTime = tBase(idxPeak);

if strcmp(opts.zoomMode, 'fixed')
    zoomWindow = opts.zoomWindow;
else
    zoomWindow = [max(tBase(1), peakTime - opts.zoomHalfWindow), ...
                  min(tBase(end), peakTime + opts.zoomHalfWindow)];
end

analysis.ok = true;
analysis.base = struct('tag', baseTag, 'label', baseLabel, 'lineStyle', baseStyle, ...
    'marker', baseMarker, 'color', baseColor);
analysis.compare = struct('tag', compTag, 'label', compLabel, 'lineStyle', compStyle, ...
    'marker', compMarker, 'color', compColor);
analysis.t = tBase;
analysis.baseSignal = yBase;
analysis.compareSignal = yCompOnBase;
analysis.err = err;
analysis.maxAbsErr = maxAbsErr;
analysis.rmsErr = rmsErr;
analysis.peakTime = peakTime;
analysis.zoomWindow = zoomWindow;
end

function analysis = buildBaselineSweepAnalysis(models, sigNames, paperCases, baselineIdx, figureNumber)
analysis = struct('ok', false, 'figureNumber', figureNumber, 'baseline', [], ...
    'comparisons', struct([]), 't', [], 'baselineSignal', [], 'zoomWindow', [NaN, NaN], ...
    'warningId', '', 'warningMessage', '');

[mdlBase, okBaseModel] = findModelByTag(models, paperCases(baselineIdx).tag);
if ~okBaseModel
    analysis.warningId = 'buildAnalysisOutputs:missingBaseline';
    analysis.warningMessage = sprintf('Figure %d: baseline model not found.', figureNumber);
    warning(analysis.warningId, '%s', analysis.warningMessage);
    return;
end

[tBase, yBase, okBaseSignal] = getSignalData(mdlBase, sigNames);
if ~okBaseSignal
    analysis.warningId = 'buildAnalysisOutputs:missingBaselineSignal';
    analysis.warningMessage = sprintf('Figure %d: baseline speed signal not available.', figureNumber);
    warning(analysis.warningId, '%s', analysis.warningMessage);
    return;
end

tBase = tBase(:);
yBase = yBase(:);
comparisons = repmat(struct( ...
    'ok', false, 'tag', '', 'paperLabel', '', 'shortLabel', '', 'itemNumber', NaN, ...
    'lineStyle', '', 'marker', '', 'color', [], 'signal', [], 'err', [], ...
    'maxAbsErr', NaN, 'rmsErr', NaN, 'peakTime', NaN), 1, numel(paperCases) - 1);

compWriteIdx = 0;
peakValGlobal = 0;
tPeakGlobal = NaN;
for k = 1:numel(paperCases)
    if k == baselineIdx
        continue;
    end

    compWriteIdx = compWriteIdx + 1;
    caseDef = paperCases(k);
    comparisons(compWriteIdx).tag = caseDef.tag;
    comparisons(compWriteIdx).paperLabel = caseDef.paperLabel;
    comparisons(compWriteIdx).shortLabel = caseDef.shortLabel;
    comparisons(compWriteIdx).itemNumber = caseDef.itemNumber;
    comparisons(compWriteIdx).lineStyle = caseDef.lineStyle;
    comparisons(compWriteIdx).marker = caseDef.marker;
    comparisons(compWriteIdx).color = caseDef.color;

    [mdlComp, okCompModel] = findModelByTag(models, caseDef.tag);
    if ~okCompModel
        warning('buildAnalysisOutputs:missingComparisonModel', ...
            'Figure %d: model "%s" not found, skipping.', figureNumber, caseDef.paperLabel);
        continue;
    end

    [tComp, yComp, okCompSignal] = getSignalData(mdlComp, sigNames);
    if ~okCompSignal
        warning('buildAnalysisOutputs:missingComparisonSignal', ...
            'Figure %d: speed signal missing for "%s", skipping.', figureNumber, caseDef.paperLabel);
        continue;
    end

    tComp = tComp(:);
    yComp = yComp(:);
    [tCompUnique, uniqueIdx] = unique(tComp, 'stable');
    yCompUnique = yComp(uniqueIdx);
    yCompOnBase = interp1(tCompUnique, yCompUnique, tBase, 'linear', 'extrap');
    err = yBase - yCompOnBase;
    [maxAbsErr, idxPeak] = max(abs(err));
    rmsErr = sqrt(mean(err.^2));
    peakTime = tBase(idxPeak);

    comparisons(compWriteIdx).ok = true;
    comparisons(compWriteIdx).signal = yCompOnBase;
    comparisons(compWriteIdx).err = err;
    comparisons(compWriteIdx).maxAbsErr = maxAbsErr;
    comparisons(compWriteIdx).rmsErr = rmsErr;
    comparisons(compWriteIdx).peakTime = peakTime;

    if maxAbsErr > peakValGlobal
        peakValGlobal = maxAbsErr;
        tPeakGlobal = peakTime;
    end
end

if isnan(tPeakGlobal)
    analysis.warningId = 'buildAnalysisOutputs:noComparisons';
    analysis.warningMessage = sprintf('Figure %d: no valid comparison signals available.', figureNumber);
    warning(analysis.warningId, '%s', analysis.warningMessage);
    return;
end

analysis.ok = true;
analysis.t = tBase;
analysis.baselineSignal = yBase;
analysis.baseline = paperCases(baselineIdx);
analysis.comparisons = comparisons;
analysis.zoomWindow = [max(tBase(1), tPeakGlobal - 0.05), min(tBase(end), tPeakGlobal + 0.05)];
end

function [mdl, ok] = findModelByTag(models, tag)
idx = find(strcmp({models.tag}, tag), 1);
ok = ~isempty(idx);
mdl = [];
if ok
    mdl = models(idx);
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
