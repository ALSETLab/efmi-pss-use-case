% Batch-run all simulation models in OpenIPSL_CHIL.Examples.CHIL_Configuration.Grid4CHIL
% via headless Dymola using generated .mos scripts.
%
% Output location behavior:
% - Default: <repo>/Modelica/work/Grid4CHIL_batch_results
% - Override: set environment variable GRID4CHIL_RESULTS_DIR
%   Example (PowerShell):
%   $env:GRID4CHIL_RESULTS_DIR = 'C:\temp\Grid4CHIL_batch_results'
%
% Dymola executable behavior:
% - Set DYMOLA_EXE to force a specific Dymola.exe location.
% - Otherwise, this script tries common Dymola installs under C:\Program Files.

% Resolve key directories and package namespace.
scriptDir = fileparts(mfilename('fullpath'));
repoRoot = fileparts(fileparts(scriptDir));
workDir = fullfile(repoRoot, 'Modelica', 'work');
defaultResultsDir = fullfile(workDir, 'Grid4CHIL_batch_results');
resultsDir = resolveResultsDir(defaultResultsDir);
modelsPackage = 'OpenIPSL_CHIL.Examples.CHIL_Configuration.Grid4CHIL';

if ~isfolder(workDir)
	error('Dymola work directory not found: %s', workDir);
end

if ~isfolder(resultsDir)
	mkdir(resultsDir);
end

dymExe = locateDymolaExe();
if isempty(dymExe)
	error(['Could not locate Dymola.exe. Set DYMOLA_EXE environment variable ' ...
		   'or install Dymola under C:\\Program Files\\Dymola*']);
end

% Resolve library/package files and model list from package.order.
openipslPackage = fullfile(repoRoot, 'dependencies', 'openipsl', 'OpenIPSL', 'package.mo');
chillibPackage = fullfile(repoRoot, 'Modelica', 'OpenIPSL_CHIL', 'package.mo');
orderFile = fullfile(repoRoot, 'Modelica', 'OpenIPSL_CHIL', 'Examples', ...
	'CHIL_Configuration', 'Grid4CHIL', 'package.order');

requiredFiles = {openipslPackage, chillibPackage, orderFile};
for k = 1:numel(requiredFiles)
	if ~isfile(requiredFiles{k})
		error('Required file is missing: %s', requiredFiles{k});
	end
end

raw = splitlines(string(fileread(orderFile)));
raw = strtrim(raw);
raw = raw(raw ~= "");
models = cellstr(raw);

fprintf('Using Dymola: %s\n', dymExe);
fprintf('Results directory: %s\n', resultsDir);
fprintf('Models to run: %d\n\n', numel(models));

summary = table('Size', [numel(models), 4], ...
	'VariableTypes', {'string', 'logical', 'double', 'string'}, ...
	'VariableNames', {'Model', 'Succeeded', 'ExitCode', 'Artifacts'});

% Run each model in headless Dymola and save per-model artifacts.
for i = 1:numel(models)
	modelShort = models{i};
	modelFull = sprintf('%s.%s', modelsPackage, modelShort);
	modelTag = regexprep(modelShort, '[^A-Za-z0-9_\-]', '_');

	mosFile = fullfile(workDir, sprintf('run_%s.mos', modelTag));
	isExpEuler = contains(modelShort, 'ExpEuler');
	writeMosFile(mosFile, openipslPackage, chillibPackage, workDir, modelFull, isExpEuler);

	cmd = sprintf('"%s" /nowindow "%s"', dymExe, mosFile);
	fprintf('[%d/%d] Running %s\n', i, numel(models), modelFull);
	[exitCode, outputText] = system(cmd);

	outLog = fullfile(resultsDir, sprintf('%s_system_output.txt', modelTag));
	fidOut = fopen(outLog, 'w');
	if fidOut ~= -1
		fprintf(fidOut, '%s', outputText);
		fclose(fidOut);
	end

	dsresSrc = fullfile(workDir, 'dsres.mat');
	dslogSrc = fullfile(workDir, 'dslog.txt');
	dsresDst = fullfile(resultsDir, sprintf('%s_dsres.mat', modelTag));
	dslogDst = fullfile(resultsDir, sprintf('%s_dslog.txt', modelTag));

	copied = strings(0, 1);
	if isfile(dsresSrc)
		copyfile(dsresSrc, dsresDst);
		copied(end + 1) = string(dsresDst); %#ok<SAGROW>
	end
	if isfile(dslogSrc)
		copyfile(dslogSrc, dslogDst);
		copied(end + 1) = string(dslogDst); %#ok<SAGROW>
	end
	copied(end + 1) = string(outLog);

	summary.Model(i) = string(modelFull);
	summary.Succeeded(i) = (exitCode == 0) && isfile(dsresDst);
	summary.ExitCode(i) = exitCode;
	summary.Artifacts(i) = strjoin(copied, '; ');

	if summary.Succeeded(i)
		fprintf('  OK -> %s\n\n', dsresDst);
	else
		fprintf('  FAIL (exit=%d). See logs in %s\n\n', exitCode, resultsDir);
	end
end

function resultsDir = resolveResultsDir(defaultResultsDir)
resultsDir = defaultResultsDir;

fromEnv = strtrim(getenv('GRID4CHIL_RESULTS_DIR'));
if isempty(fromEnv)
	return;
end

% Allow users to override output location without changing the repository script.
resultsDir = fromEnv;
end

% Write a machine-readable run summary.
summaryFile = fullfile(resultsDir, 'summary.csv');
writetable(summary, summaryFile);

okCount = sum(summary.Succeeded);
fprintf('Completed %d/%d successful simulations.\n', okCount, height(summary));
fprintf('Summary: %s\n', summaryFile);

% Helper: generate a per-model .mos script.
function writeMosFile(mosFile, openipslPackage, chillibPackage, workDir, modelFull, isExpEuler)
fid = fopen(mosFile, 'w');
if fid == -1
	error('Failed to create .mos file: %s', mosFile);
end

cleanupObj = onCleanup(@() fclose(fid)); %#ok<NASGU>

fprintf(fid, 'openModel("%s");\n', strrep(openipslPackage, '\\', '/'));
fprintf(fid, 'openModel("%s");\n', strrep(chillibPackage, '\\', '/'));
fprintf(fid, 'cd("%s");\n', strrep(workDir, '\\', '/'));
if isExpEuler
	% These models require Euler + fixed step when inline integration is enabled.
	fprintf(fid, 'simulateModel("%s", stopTime=15, method="Euler", fixedstepsize=0.0002);\n', modelFull);
else
	fprintf(fid, 'simulateModel("%s", stopTime=15);\n', modelFull);
end
fprintf(fid, 'exit();\n');
end

% Helper: locate Dymola executable from env/default/installed versions.
function dymExe = locateDymolaExe()
dymExe = '';

fromEnv = getenv('DYMOLA_EXE');
if ~isempty(fromEnv) && isfile(fromEnv)
	dymExe = fromEnv;
	return;
end

defaultCandidate = fullfile('C:\', 'Program Files', 'Dymola 2026x Refresh 1', 'bin64', 'Dymola.exe');
if isfile(defaultCandidate)
	dymExe = defaultCandidate;
	return;
end

roots = dir(fullfile('C:\', 'Program Files', 'Dymola*'));
roots = roots([roots.isdir]);
if isempty(roots)
	return;
end

dates = datenum({roots.date});
[~, idx] = sort(dates, 'descend');
roots = roots(idx);

for k = 1:numel(roots)
	candidate = fullfile(roots(k).folder, roots(k).name, 'bin64', 'Dymola.exe');
	if isfile(candidate)
		dymExe = candidate;
		return;
	end
end
end
