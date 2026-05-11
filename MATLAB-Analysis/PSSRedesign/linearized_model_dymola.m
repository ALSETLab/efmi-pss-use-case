function [A, B, C, D, stateVars, inputVars, outputVars] = linearized_model_dymola(matfile)
% linearized_model_dymola  Load a linearized model from a Dymola/OpenModelica .mat file.
% der(x) = A * x + B * u
% y      = C * x + D * u
%
% Usage:
%   [A,B,C,D,stateVars,inputVars,outputVars] = linearized_model_dymola()
%   [A,B,C,D,stateVars,inputVars,outputVars] = linearized_model_dymola('dslin.mat')
%
% This function keeps the same output contract as linearized_model.m, but
% reads data from a .mat linearization file through tloadlin.m.

  if nargin < 1 || isempty(matfile)
    matfile = 'dslin.mat';
  end

  % Resolve relative paths against this function's folder.
  if isfolder(matfile)
    error('matfile must be a file path, not a directory: %s', matfile);
  end

  if ~(contains(matfile, ':') || startsWith(matfile, '/') || startsWith(matfile, '\\'))
    thisDir = fileparts(mfilename('fullpath'));
    localPath = fullfile(thisDir, matfile);
    if exist(localPath, 'file') == 2
      matfile = localPath;
    end
  end

  [A, B, C, D, xName, uName, yName] = tloadlin(matfile, 1);

  stateVars = normalizeNameOutput(xName);
  inputVars = normalizeNameOutput(uName);
  outputVars = normalizeNameOutput(yName);
end

function names = normalizeNameOutput(nameData)
% Convert tloadlin name outputs into a row cell array of char vectors.
  if isempty(nameData)
    names = {};
    return;
  end

  if iscell(nameData)
    names = reshape(nameData, 1, []);
    return;
  end

  if ischar(nameData)
    names = cellstr(nameData);
    names = reshape(names, 1, []);
    return;
  end

  % Fallback for uncommon text/string container outputs.
  names = cellstr(string(nameData));
  names = reshape(names, 1, []);
end
