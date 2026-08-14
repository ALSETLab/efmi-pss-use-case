%% Plot Grid4CHIL Results With Analysis-First Workflow
% Workflow order:
%   1. configure environment and load inputs
%   2. compute all diagnostics
%   3. write non-figure outputs under ./output/results
%   4. render figures under ./output/figs
%
% Practical use:
%   - Run this script after the batch simulations have produced dsres.mat files.
%   - All helper functions are stored under ./analysis_helpers.
%   - All generated outputs stay local to this directory under ./output.
%   - Set interactiveOnly = false to also export PDF figures.

clc; clear; close all;

% Save MATLAB .fig files only by default. Set to false to also write PDFs.
interactiveOnly = false;

% Exact figure window position on the default monitor in pixels:
% [left bottom width height]
% Tip: run get(gcf, 'Position') on a manually adjusted figure and paste it here.
figurePositionPx = [100, 100, 660, 660*1.5];

%% Step 1 — Resolve local helper and output directories.
% Keep the workflow self-contained inside CHIL_Setup_Simulations.
scriptDir = fileparts(mfilename('fullpath'));
helperDir = fullfile(scriptDir, 'analysis_helpers');
addpath(helperDir);

outputRoot = fullfile(scriptDir, 'output');          % Default: ./output
figsOutputDir = fullfile(outputRoot, 'figs');        % Default: ./output/figs
resultsOutputDir = fullfile(outputRoot, 'results');  % Default: ./output/results

% Create the local output tree if it does not already exist.
if ~isfolder(outputRoot), mkdir(outputRoot); end
if ~isfolder(figsOutputDir), mkdir(figsOutputDir); end
if ~isfolder(resultsOutputDir), mkdir(resultsOutputDir); end

%% Step 2 — Load simulation inputs and plotting metadata.
% setupAnalysisEnvironment() resolves the Dymola utilities, loads the
% dsres.mat files, and returns the signal-name map plus paper-case labels.
[env, models, SIG, paperCases] = setupAnalysisEnvironment(scriptDir);

fprintf('Input results dir : %s\n', env.inputResultsDir);
fprintf('Figures output dir: %s\n', figsOutputDir);
fprintf('Results output dir: %s\n\n', resultsOutputDir);

%% Step 3 — Compute diagnostics before any plotting.
% buildAnalysisOutputs() prepares the pairwise and baseline-sweep data
% structs so the later plotting code does not need to recompute errors.
bundle = buildAnalysisOutputs(models, SIG, paperCases);

%% Step 4 — Write non-figure outputs.
% These files are written under ./output/results and include the plain-text
% diagnostic summary plus the LaTeX table content used in the paper.
writeAnalysisOutputs(bundle, resultsOutputDir);

%% Step 5 — Render the figures.
% Figures are written under ./output/figs using the already-prepared
% analysis bundle from Step 3.
renderAnalysisOutputs(bundle, models, SIG, figsOutputDir, interactiveOnly, figurePositionPx);