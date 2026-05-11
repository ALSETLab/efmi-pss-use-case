function sciplot_export(filename, varargin)
% SCIPLOT_EXPORT  Export current (or specified) figure to SVG or other formats.
%
% USAGE
%   sciplot_export('myplot')             % → myplot.svg  (default)
%   sciplot_export('myplot.svg')         % → myplot.svg
%   sciplot_export('myplot.pdf')         % → myplot.pdf
%   sciplot_export('myplot.png')         % → myplot.png  (300 dpi default)
%   sciplot_export('myplot', fig)        % export specific figure handle
%   sciplot_export('myplot', fig, Name, Val)
%
% NAME-VALUE OPTIONS
%   'Format'    char     – override format: 'svg'|'pdf'|'eps'|'png'|'tiff'
%                          (default: inferred from extension, fallback 'svg')
%   'DPI'       double   – resolution for raster formats (default: 300)
%   'Width'     double   – figure width in inches (resizes before export)
%   'Height'    double   – figure height in inches (resizes before export)
%   'Renderer'  char     – 'painters'|'opengl' (default: 'painters' for SVG/PDF)
%   'Tight'     logical  – trim whitespace (default: true)
%
% DESCRIPTION
%   sciplot_export wraps print() and exportgraphics() to produce
%   publication-quality output.  SVG is the default format because it is
%   vector-based, resolution-independent, and editable in Inkscape or
%   Illustrator.
%
%   For IEEE / journal submission, use 'pdf' or 'eps' instead; for poster
%   printing use 'tiff' with DPI ≥ 600.
%
% EXAMPLES
%   % Basic SVG export
%   sciplot_export('voltage_response');
%
%   % PDF at specific size (IEEE column)
%   sciplot_export('fig1.pdf', 'Width', 3.5, 'Height', 2.625);
%
%   % After a Dymola simulation, style and export in one block
%   traj = dymload('dsres.mat');
%   t = dymget(traj, 'Time');
%   v = dymget(traj, 'bus.v');
%   sciplot_init('ieee');
%   figure; plot(t, v); xlabel('Time (s)'); ylabel('Voltage (pu)');
%   sciplot_export('bus_voltage.svg');
%
% SEE ALSO
%   sciplot_init, sciplot_style, sciplot_colors

    % ------------------------------------------------------------------ %
    %  Parse inputs                                                       %
    % ------------------------------------------------------------------ %
    [fig, filename, fmt, dpi, w, h, renderer, tight] = parse_inputs_(filename, varargin{:});

    % ------------------------------------------------------------------ %
    %  Resize if requested                                                %
    % ------------------------------------------------------------------ %
    if ~isnan(w) || ~isnan(h)
        oldUnits = fig.Units;
        fig.Units = 'inches';
        pos = fig.Position;
        if ~isnan(w), pos(3) = w; end
        if ~isnan(h), pos(4) = h; end
        fig.Position            = pos;
        fig.PaperUnits          = 'inches';
        fig.PaperPosition       = [0, 0, pos(3), pos(4)];
        fig.PaperSize           = [pos(3), pos(4)];
        fig.Units               = oldUnits;
    end

    % ------------------------------------------------------------------ %
    %  Suppress axes toolbars (avoids MATLAB batch-mode export warning)  %
    % ------------------------------------------------------------------ %
    axAll = findall(fig, 'Type', 'axes');
    for k = 1:numel(axAll)
        tb = axAll(k).Toolbar;
        if ~isempty(tb)
            tb.Visible = 'off';
        end
    end

    % ------------------------------------------------------------------ %
    %  Export                                                             %
    % ------------------------------------------------------------------ %
    outfile = [filename_noext_(filename), '.', fmt];

    switch lower(fmt)
        case 'svg'
            % exportgraphics does NOT support SVG; use print -dsvg
            if strcmpi(renderer, 'painters')
                set(fig, 'Renderer', 'painters');
            end
            print(fig, outfile, '-dsvg', '-painters');

        case 'pdf'
            set(fig, 'Renderer', 'painters');
            if tight
                exportgraphics(fig, outfile, 'ContentType', 'vector', ...
                    'BackgroundColor', 'white');
            else
                print(fig, outfile, '-dpdf', '-painters', '-bestfit');
            end

        case 'eps'
            set(fig, 'Renderer', 'painters');
            print(fig, outfile, '-depsc', '-painters');

        case {'png', 'jpg', 'jpeg'}
            dpiStr = sprintf('-r%d', dpi);
            printFmt = ['-d', lower(fmt)];
            if strcmp(lower(fmt), 'jpg'), printFmt = '-djpeg'; end
            print(fig, outfile, printFmt, dpiStr);

        case {'tif', 'tiff'}
            dpiStr = sprintf('-r%d', dpi);
            print(fig, outfile, '-dtiff', dpiStr);

        otherwise
            error('MATLAB:sciplot_export:unsupportedFormat', ...
                '[sciplot_export] Unsupported format "%s".', fmt);
    end

    fprintf('[sciplot] Exported → %s\n', outfile);
end


% ======================================================================= %
%  Private helpers                                                         %
% ======================================================================= %

function [fig, filename, fmt, dpi, w, h, renderer, tight] = parse_inputs_(filename, varargin)
    fig      = gcf;
    fmt      = '';    % resolved below
    dpi      = 300;
    w        = NaN;
    h        = NaN;
    renderer = 'painters';
    tight    = true;

    % Check if second positional arg is a figure handle
    idx = 1;
    if ~isempty(varargin)
        first = varargin{idx};
        if isa(first, 'matlab.ui.Figure')
            fig = first;
            idx = idx + 1;
        end
    end

    % Remaining name-value pairs
    while idx < numel(varargin)
        key = varargin{idx};
        val = varargin{idx+1};
        switch lower(key)
            case 'format',   fmt      = val;
            case 'dpi',      dpi      = val;
            case 'width',    w        = val;
            case 'height',   h        = val;
            case 'renderer', renderer = val;
            case 'tight',    tight    = val;
            otherwise
                warning('[sciplot_export] Unknown option "%s" ignored.', key);
        end
        idx = idx + 2;
    end

    % Resolve format from extension or default to 'svg'
    if isempty(fmt)
        [~, ~, ext] = fileparts(filename);
        if ~isempty(ext)
            fmt      = lower(ext(2:end));  % strip leading dot
            filename = filename_noext_(filename);
        else
            fmt = 'svg';
        end
    else
        filename = filename_noext_(filename);
    end
end

function base = filename_noext_(f)
    [fdir, fname, ~] = fileparts(f);
    if isempty(fdir)
        base = fname;
    else
        base = fullfile(fdir, fname);
    end
end
