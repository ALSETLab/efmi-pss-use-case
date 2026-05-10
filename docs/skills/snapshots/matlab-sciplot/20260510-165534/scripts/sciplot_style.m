function sciplot_style(varargin)
% SCIPLOT_STYLE  Apply or update style properties on a specific axes / figure.
%
% USAGE
%   sciplot_style()                          % apply to current axes (gca)
%   sciplot_style(ax)                        % apply to axes handle ax
%   sciplot_style('ieee')                    % apply 'ieee' preset to gca
%   sciplot_style(ax, 'nature')              % apply 'nature' preset to ax
%   sciplot_style(ax, 'science', Name, Val)  % preset + overrides
%
% NAME-VALUE OVERRIDES (applied after preset, override anything)
%   'FontSize'       double   – axis font size in points
%   'FontName'       char     – font family (e.g. 'Arial', 'Times New Roman')
%   'LineWidth'      double   – default line width for lines in the axes
%   'Box'            'on'|'off'
%   'XGrid'          'on'|'off'
%   'YGrid'          'on'|'off'
%   'TickDir'        'in'|'out'
%   'ColorOrder'     N×3 RGB  – override color cycle for the axes
%   'Interpreter'    'tex'|'latex'|'none'
%
% DESCRIPTION
%   sciplot_style() applies a lightweight "science-grade" appearance to an
%   existing axes *after* plotting, so you can use it to fix up figures
%   created by dymtools (tplot, dymbrowse) or any other source.
%
%   Unlike sciplot_init (which sets groot defaults for new figures),
%   sciplot_style() modifies an existing axes object directly.
%
% EXAMPLES
%   % Fix up a Dymola tplot figure
%   tplot(t, y, {'signal1', 'signal2'});
%   sciplot_style('science');
%   sciplot_export('results.svg');
%
% SEE ALSO
%   sciplot_init, sciplot_export, sciplot_colors

    % ------------------------------------------------------------------ %
    %  Parse inputs                                                       %
    % ------------------------------------------------------------------ %
    [ax, style, overrides] = parse_inputs_(varargin{:});

    % Resolve preset
    p = sciplot_preset_(style);

    % Apply overrides to preset struct
    fields = fieldnames(overrides);
    for k = 1:numel(fields)
        p.(fields{k}) = overrides.(fields{k});
    end

    % ------------------------------------------------------------------ %
    %  Apply to axes                                                      %
    % ------------------------------------------------------------------ %
    ax.FontName  = p.fontName;
    ax.FontSize  = p.fontSize;
    ax.LineWidth = p.axesLineWidth;
    ax.Box       = p.box;
    ax.XGrid     = p.xGrid;
    ax.YGrid     = p.yGrid;
    ax.TickDir   = 'out';
    ax.TickLength = [0.008, 0.008];
    ax.GridAlpha      = 0.15;
    ax.MinorGridAlpha = 0.08;
    ax.GridColor  = [0 0 0];
    ax.XColor     = [0 0 0];
    ax.YColor     = [0 0 0];

    % Color order
    colors = sciplot_colors(p.colorCycle);
    ax.ColorOrder = colors;

    % Interpreter on labels and legend
    ax.TickLabelInterpreter = p.interp;
    if ~isempty(ax.XLabel), ax.XLabel.Interpreter = p.interp; end
    if ~isempty(ax.YLabel), ax.YLabel.Interpreter = p.interp; end
    if ~isempty(ax.Title),  ax.Title.Interpreter  = p.interp; end

    % Fix existing line widths if requested
    if isfield(p, 'lineWidth') && p.lineWidth > 0
        lh = findobj(ax, 'Type', 'Line');
        for k = 1:numel(lh)
            if lh(k).LineWidth == 0.5  % only touch default-width lines
                lh(k).LineWidth = p.lineWidth;
            end
        end
    end

    % Legend (if present)
    leg = ax.Legend;
    if ~isempty(leg)
        leg.Interpreter = p.interp;
        leg.Box = 'off';
        leg.FontSize = p.fontSize;
        leg.FontName = p.fontName;
    end

    % Figure background
    fig = ax.Parent;
    if isa(fig, 'matlab.ui.Figure')
        fig.Color = 'white';
    end
end


% ======================================================================= %
%  Private helpers                                                         %
% ======================================================================= %

function [ax, style, overrides] = parse_inputs_(varargin)
    ax        = gca;
    style     = 'science';
    overrides = struct();

    idx = 1;
    if ~isempty(varargin)
        first = varargin{idx};
        if isa(first, 'matlab.graphics.axis.Axes') || ...
           isa(first, 'matlab.ui.control.UIAxes')
            ax  = first;
            idx = idx + 1;
        end
    end

    if idx <= numel(varargin)
        second = varargin{idx};
        if ischar(second) && ~contains(second, {'FontSize','FontName', ...
                'LineWidth','Box','XGrid','YGrid','TickDir','ColorOrder','Interpreter'})
            style = second;
            idx   = idx + 1;
        end
    end

    % Remaining are name-value pairs
    while idx < numel(varargin)
        key = varargin{idx};
        val = varargin{idx+1};
        switch key
            case 'FontSize',    overrides.fontSize      = val;
            case 'FontName',    overrides.fontName      = val;
            case 'LineWidth',   overrides.lineWidth     = val;
            case 'Box',         overrides.box           = val;
            case 'XGrid',       overrides.xGrid         = val;
            case 'YGrid',       overrides.yGrid         = val;
            case 'TickDir',     % handled via TickDir directly below
                overrides.tickDir = val;
            case 'ColorOrder',  overrides.colorCycle    = val;  % N×3 matrix
            case 'Interpreter', overrides.interp        = val;
            otherwise
                warning('[sciplot_style] Unknown option "%s" ignored.', key);
        end
        idx = idx + 2;
    end
end

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
    p.colorCycle    = 'bright';

    switch lower(style)
        case 'science'
            % defaults are already science

        case 'ieee'
            p.fontSize      = 8;
            p.lineWidth     = 0.8;
            p.axesLineWidth = 0.5;
            p.yGrid         = 'off';
            p.colorCycle    = 'grayscale';

        case 'ieee-double'
            p.fontSize      = 9;
            p.lineWidth     = 1.0;
            p.colorCycle    = 'bright';

        case 'nature'
            p.fontName      = 'Arial';
            p.fontSize      = 7;
            p.lineWidth     = 0.75;
            p.axesLineWidth = 0.5;
            p.colorCycle    = 'vibrant';

        case 'notebook'
            p.fontSize      = 22;
            p.lineWidth     = 2.0;
            p.axesLineWidth = 1.0;
            p.xGrid         = 'on';
            p.colorCycle    = 'bright';

        case 'minimal'
            p.fontSize      = 16;
            p.lineWidth     = 1.2;
            p.axesLineWidth = 0.6;
            p.xGrid         = 'off';
            p.yGrid         = 'off';
            p.colorCycle    = 'dark';

        otherwise
            warning('MATLAB:sciplot_style:unknownStyle', ...
                '[sciplot_style] Unknown style "%s". Using "science".', style);
    end
end
