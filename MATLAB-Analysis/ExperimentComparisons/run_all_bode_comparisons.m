%% Run All Bode Comparison Scripts
% Executes Plant, PSS, and Closed-Loop scripts in sequence.

clc; clear all; close all;

base_dir = fileparts(mfilename('fullpath'));

script_list = {
    fullfile(base_dir, 'Plant', 'compare_bode_plant.m')
    fullfile(base_dir, 'Paper_6.1_PSS', 'compare_bode_PSS.m')
    fullfile(base_dir, 'Paper_6.1_ClosedLoop', 'compare_bode_closed_loop.m')
};

for k = 1:numel(script_list)
    fprintf('Running %s\n', script_list{k});
    run_isolated(script_list{k});
end

function run_isolated(script_path)
    run(script_path);
end