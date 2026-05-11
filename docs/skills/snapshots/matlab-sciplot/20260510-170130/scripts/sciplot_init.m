function sciplot_init(style)
% SCIPLOT_INIT  Apply SciencePlots-equivalent defaults to all subsequent MATLAB figures.
%
% USAGE
%   sciplot_init()            % 'science' style (default)
%   sciplot_init('science')   % general scientific
%   sciplot_init('ieee')      % IEEE papers (narrow, B&W-safe)
%   sciplot_init('nature')    % Nature / sans-serif
%   sciplot_init('notebook')  % larger fonts for presentations/notebooks
%   sciplot_init('minimal')   % ultra-clean, no grid, no box
%
% DESCRIPTION
%   Sets MATLAB groot defaults so every figure opened afterwards inherits
%   publication-quality settings.  Call once at the top of your script,
%   before any plot() / figure() calls.
%
%   Pairs naturally with the Dymola–MATLAB API skill: call sciplot_init()
%   right after loading simulation results with dymload/dymget, then plot
%   and export with sciplot_export().
%
% SEE ALSO
%   sciplot_style, sciplot_export, sciplot_colors

    if nargin < 1
        style = 'science';
    end

    % ------------------------------------------------------------------ %
    %  Resolve preset parameters                                          %
    % ------------------------------------------------------------------ %
    p = sciplot_preset_(style);

    % ------------------------------------------------------------------ %
    %  Figure geometry                                                    %
    % ------------------------------------------------------------------ %
    set(groot, 'defaultFigureUnits',         'inches');
    set(groot, 'defaultFigurePosition',      [1, 1, p.figW, p.figH]);
    set(groot, 'defaultFigurePaperUnits',    'inches');
    set(groot, 'defaultFigurePaperPosition', [0, 0, p.figW, p.figH]);
    set(groot, 'defaultFigurePaperSize',     [p.figW, p.figH]);
    set(groot, 'defaultFigureColor',         'white');

    % ------------------------------------------------------------------ %
    %  Axes appearance                                                    %
    % ------------------------------------------------------------------ %
    set(groot, 'defaultAxesFontName',                p.fontName);
    set(groot, 'defaultAxesFontSize',                p.fontSize);
    set(groot, 'defaultAxesLabelFontSizeMultiplier', 1.0);
    set(groot, 'defaultAxesTitleFontSizeMultiplier', 1.0);
    set(groot, 'defaultAxesTitleFontWeight',         'normal');

    set(groot, 'defaultAxesLineWidth',  p.axesLineWidth);
    set(groot, 'defaultAxesXColor',     'k');
    set(groot, 'defaultAxesYColor',     'k');
    set(groot, 'defaultAxesGridColor',  'k');
    set(groot, 'defaultAxesGridAlpha',  0.15);
    set(groot, 'defaultAxesMinorGridAlpha', 0.08);

    set(groot, 'defaultAxesTickDir',    'out');
    set(groot, 'defaultAxesTickDirMode','manual');
    set(groot, 'defaultAxesTickLength', [0.008, 0.008]);

    set(groot, 'defaultAxesBox',        p.box);
    set(groot, 'defaultAxesXGrid',      p.xGrid);
    set(groot, 'defaultAxesYGrid',      p.yGrid);

    % ------------------------------------------------------------------ %
    %  Line defaults                                                      %
    % ------------------------------------------------------------------ %
    set(groot, 'defaultLineLineWidth', p.lineWidth);

    % ------------------------------------------------------------------ %
    %  Text / interpreter                                                 %
    % ------------------------------------------------------------------ %
    set(groot, 'defaultTextInterpreter',          p.interp);
    set(groot, 'defaultAxesTickLabelInterpreter', p.interp);
    set(groot, 'defaultLegendInterpreter',        p.interp);

    % ------------------------------------------------------------------ %
    %  Color order (qualitative cycle)                                   %
    % ------------------------------------------------------------------ %
    set(groot, 'defaultAxesColorOrder', sciplot_colors(p.colorCycle));

    fprintf('[sciplot] Style "%s" applied (%.1f x %.1f in, %s, %s font, %d pt).\n', ...
        style, p.figW, p.figH, p.colorCycle, p.fontName, p.fontSize);
end


% ======================================================================= %
%  Private helpers                                                         %
% ======================================================================= %

function p = sciplot_preset_(style)
% Return a struct of parameters for the requested style.

    % ----- shared defaults -----
    p.figW          = 8.0;
    p.figH          = 6.0;
    p.fontName      = 'Helvetica';
    p.fontSize      = 18;
    p.lineWidth     = 1.5;
    p.axesLineWidth = 0.8;
    p.box           = 'off';
    p.xGrid         = 'off';
    p.yGrid         = 'on';
    p.interp        = 'latex';        % use built-in LaTeX renderer (no external install needed)
    p.colorCycle    = 'bright';        % color-blind safe

    switch lower(style)

        case 'science'
            % General scientific — clean, minimal, TeX labels
            p.figW       = 8.0;
            p.figH       = 6.0;
            p.fontSize   = 18;
            p.lineWidth  = 1.5;
            p.colorCycle = 'bright';

        case 'ieee'
            % IEEE single-column: 3.5 in wide, black & white safe
            p.figW       = 3.5;
            p.figH       = 2.625;   % 4:3
            p.fontSize   = 8;
            p.lineWidth  = 0.8;
            p.axesLineWidth = 0.5;
            p.yGrid      = 'off';
            p.colorCycle = 'grayscale';

        case 'ieee-double'
            % IEEE double-column: 7.16 in wide
            p.figW       = 7.16;
            p.figH       = 4.5;
            p.fontSize   = 9;
            p.lineWidth  = 1.0;
            p.colorCycle = 'bright';

        case 'nature'
            % Nature journals: sans-serif, compact
            p.figW       = 7.0;
            p.figH       = 5.25;
            p.fontName   = 'Arial';
            p.fontSize   = 7;
            p.lineWidth  = 0.75;
            p.axesLineWidth = 0.5;
            p.colorCycle = 'vibrant';

        case 'notebook'
            % Presentations / Jupyter-style: large fonts, grid
            p.figW       = 10.0;
            p.figH       = 7.5;
            p.fontSize   = 22;
            p.lineWidth  = 2.0;
            p.axesLineWidth = 1.0;
            p.xGrid      = 'on';
            p.yGrid      = 'on';
            p.box        = 'off';
            p.colorCycle = 'bright';

        case 'minimal'
            % Ultra-clean: no grid, no box, thin lines
            p.figW       = 8.0;
            p.figH       = 6.0;
            p.fontSize   = 16;
            p.lineWidth  = 1.2;
            p.axesLineWidth = 0.6;
            p.box        = 'off';
            p.xGrid      = 'off';
            p.yGrid      = 'off';
            p.colorCycle = 'dark';

        otherwise
            warning('MATLAB:sciplot_init:unknownStyle', ...
                '[sciplot] Unknown style "%s". Using "science".', style);
    end
end
