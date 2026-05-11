function writeAnalysisOutputs(bundle, resultsOutputDir)
%WRITEANALYSISOUTPUTS Save all non-figure outputs under output/results.

if ~isfolder(resultsOutputDir)
    mkdir(resultsOutputDir);
end

diagnosticsPath = fullfile(resultsOutputDir, 'diagnostics_summary.txt');
tablesPath = fullfile(resultsOutputDir, 'latex_tables.tex');

writeTextFile(diagnosticsPath, buildDiagnosticsText(bundle));
writeTextFile(tablesPath, buildTablesText(bundle));

fprintf('Diagnostics file : %s\n', diagnosticsPath);
fprintf('LaTeX tables file: %s\n\n', tablesPath);
end

function text = buildDiagnosticsText(bundle)
lines = { ...
    'Grid4CHIL analysis diagnostics', ...
    '============================='};

lines = appendPairwiseDiagnostics(lines, bundle.fig2, 'Figure 2');
lines = appendPairwiseDiagnostics(lines, bundle.fig3, 'Figure 3');
lines = appendSweepDiagnostics(lines, bundle.fig4, 'Figure 4');
lines = appendSweepDiagnostics(lines, bundle.fig5, 'Figure 5');

text = strjoin(lines, newline);
text = [text, newline];
end

function lines = appendPairwiseDiagnostics(lines, analysis, label)
lines{end+1} = '';
lines{end+1} = label;
if ~analysis.ok
    lines{end+1} = sprintf('  skipped: %s', analysis.warningMessage);
    return;
end
lines{end+1} = sprintf('  max|err| = %.12g pu', analysis.maxAbsErr);
lines{end+1} = sprintf('  RMS err  = %.12g pu', analysis.rmsErr);
lines{end+1} = sprintf('  t_max    = %.6f s', analysis.peakTime);
lines{end+1} = sprintf('  zoom     = [%.6f, %.6f] s', analysis.zoomWindow(1), analysis.zoomWindow(2));
end

function lines = appendSweepDiagnostics(lines, analysis, label)
lines{end+1} = '';
lines{end+1} = label;
if ~analysis.ok
    lines{end+1} = sprintf('  skipped: %s', analysis.warningMessage);
    return;
end
lines{end+1} = sprintf('  baseline = %s', analysis.baseline.paperLabel);
lines{end+1} = sprintf('  zoom     = [%.6f, %.6f] s', analysis.zoomWindow(1), analysis.zoomWindow(2));
for k = 1:numel(analysis.comparisons)
    comp = analysis.comparisons(k);
    if ~comp.ok
        lines{end+1} = sprintf('  %s: skipped', comp.paperLabel); %#ok<AGROW>
        continue;
    end
    lines{end+1} = sprintf('  %s: max|err|=%.6e pu, RMS=%.6e pu, t_max=%.6f s', comp.paperLabel, comp.maxAbsErr, comp.rmsErr, comp.peakTime); %#ok<AGROW>
end
end

function text = buildTablesText(bundle)
sections = {};
if bundle.fig4.ok
    sections{end+1} = renderSweepTable(bundle.fig4, 'Figure 4', ...
        'Generator speed error relative to \\texttt{Ref.Sim.DASSL} (case~1).', ...
        'tab:speed_error_summary');
end
if bundle.fig5.ok
    sections{end+1} = renderSweepTable(bundle.fig5, 'Figure 5', ...
        'Generator speed error relative to \\texttt{Ref.Sim.ExpEuler} (case~2).', ...
        'tab:speed_error_summary_fig5');
end

text = strjoin(sections, [newline, newline]);
if ~isempty(text)
    text = [text, newline];
end
end

function section = renderSweepTable(analysis, headerLabel, captionText, tableLabel)
lines = { ...
    sprintf('%% ---- %s error summary (copy-paste into LaTeX) ----', headerLabel), ...
    '\\begin{table}[ht]', ...
    '\\centering', ...
    sprintf('\\caption{%s}', captionText), ...
    sprintf('\\label{%s}', tableLabel), ...
    '\\begin{tabular}{lSSS}', ...
    '\\toprule', ...
    'Case & {$\\max|\\epsilon|$ (pu)} & {RMS $\\epsilon$ (pu)} & {$t_{\\max}$ (s)} \\\\', ...
    '\\midrule'};

for k = 1:numel(analysis.comparisons)
    comp = analysis.comparisons(k);
    if ~comp.ok
        lines{end+1} = sprintf('\\texttt{%s} & {---} & {---} & {---} \\\\', comp.paperLabel); %#ok<AGROW>
    else
        lines{end+1} = sprintf('\\texttt{%s} & %.4e & %.4e & %.4f \\\\', comp.paperLabel, comp.maxAbsErr, comp.rmsErr, comp.peakTime); %#ok<AGROW>
    end
end

lines = [lines, {'\\bottomrule', '\\end{tabular}', '\\end{table}', '% ----------------------------------------------------'}];
section = strjoin(lines, newline);
end

function writeTextFile(filePath, text)
fid = fopen(filePath, 'w');
if fid < 0
    error('writeAnalysisOutputs:openFailed', 'Could not open %s for writing.', filePath);
end
cleanupObj = onCleanup(@() fclose(fid));
fprintf(fid, '%s', text);
end
