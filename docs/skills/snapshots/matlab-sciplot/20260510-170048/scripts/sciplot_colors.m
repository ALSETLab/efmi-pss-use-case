function colors = sciplot_colors(name)
% SCIPLOT_COLORS  Return named color palettes as N×3 RGB matrices (0–1 range).
%
% USAGE
%   colors = sciplot_colors('bright')       % 7-color, colorblind-safe (default)
%   colors = sciplot_colors('vibrant')      % 7-color, high-saturation
%   colors = sciplot_colors('dark')         % 8-color, ColorBrewer Dark2
%   colors = sciplot_colors('paired')       % 12-color, ColorBrewer Paired
%   colors = sciplot_colors('high-vis')     % 5-color, high visibility
%   colors = sciplot_colors('grayscale')    % 6-color grayscale ramp (for B&W)
%   colors = sciplot_colors('sequential-blue')   % 8-step blue ramp
%   colors = sciplot_colors('sequential-orange')  % 8-step orange ramp
%   colors = sciplot_colors('sequential-gray')    % 8-step gray ramp
%   colors = sciplot_colors('rainbow-7')    % Paul Tol 7-color discrete rainbow
%   colors = sciplot_colors('rainbow-10')   % Paul Tol 10-color
%
% OUTPUT
%   colors  – N×3 matrix of [R G B] values in [0, 1]
%
% DESCRIPTION
%   All palettes are either perceptually uniform, colorblind-safe, or both.
%   The 'bright' palette is equivalent to Paul Tol's "bright" scheme which
%   is also available in SciencePlots.
%
%   Pass the returned matrix directly to:
%       set(gca, 'ColorOrder', sciplot_colors('bright'))
%   or supply the palette name to sciplot_init / sciplot_style.
%
% SEE ALSO
%   sciplot_init, sciplot_style, sciplot_export

    if nargin < 1
        name = 'bright';
    end

    % Numeric matrix passed directly — return as-is
    if isnumeric(name)
        colors = name;
        return;
    end

    switch lower(name)

        % ---------------------------------------------------------------- %
        %  Paul Tol – bright (colorblind-safe, recommended default)        %
        % ---------------------------------------------------------------- %
        case 'bright'
            colors = hex2rgb_({ ...
                '#4477AA';  % blue
                '#EE6677';  % red
                '#228833';  % green
                '#CCBB44';  % yellow
                '#66CCEE';  % cyan
                '#AA3377';  % purple
                '#BBBBBB'   % grey
            });

        % ---------------------------------------------------------------- %
        %  Paul Tol – vibrant (high-saturation, 7 colors)                  %
        % ---------------------------------------------------------------- %
        case 'vibrant'
            colors = hex2rgb_({ ...
                '#EE7733';  % orange
                '#0077BB';  % blue
                '#33BBEE';  % cyan
                '#EE3377';  % magenta
                '#CC3311';  % red
                '#009988';  % teal
                '#BBBBBB'   % grey
            });

        % ---------------------------------------------------------------- %
        %  ColorBrewer Dark2 (8 colors, print-safe)                        %
        % ---------------------------------------------------------------- %
        case 'dark'
            colors = hex2rgb_({ ...
                '#1b9e77';
                '#d95f02';
                '#7570b3';
                '#e7298a';
                '#66a61e';
                '#e6ab02';
                '#a6761d';
                '#666666'
            });

        % ---------------------------------------------------------------- %
        %  ColorBrewer Paired (12 colors – light+dark pairs)               %
        % ---------------------------------------------------------------- %
        case 'paired'
            colors = hex2rgb_({ ...
                '#a6cee3'; '#1f78b4';
                '#b2df8a'; '#33a02c';
                '#fb9a99'; '#e31a1c';
                '#fdbf6f'; '#ff7f00';
                '#cab2d6'; '#6a3d9a';
                '#ffff99'; '#b15928'
            });

        % ---------------------------------------------------------------- %
        %  High-visibility (5 colors, clear under most deficiencies)       %
        % ---------------------------------------------------------------- %
        case 'high-vis'
            colors = hex2rgb_({ ...
                '#0d49fb';  % blue
                '#e6091c';  % red
                '#26eb47';  % green
                '#8936df';  % purple
                '#fec32d'   % yellow
            });

        % ---------------------------------------------------------------- %
        %  Grayscale ramp (for IEEE B&W or print-only)                     %
        % ---------------------------------------------------------------- %
        case 'grayscale'
            v = [0.00; 0.25; 0.45; 0.60; 0.75; 0.88];
            colors = repmat(v, 1, 3);

        % ---------------------------------------------------------------- %
        %  Sequential: blue (9-step ColorBrewer Blues)                     %
        % ---------------------------------------------------------------- %
        case 'sequential-blue'
            colors = hex2rgb_({ ...
                '#f7fbff'; '#deebf7'; '#c6dbef'; '#9ecae1';
                '#6baed6'; '#4292c6'; '#2171b5'; '#08519c'; '#08306b'
            });

        % ---------------------------------------------------------------- %
        %  Sequential: orange (9-step ColorBrewer Oranges)                 %
        % ---------------------------------------------------------------- %
        case 'sequential-orange'
            colors = hex2rgb_({ ...
                '#fff5eb'; '#fee6ce'; '#fdd0a2'; '#fdae6b';
                '#fd8d3c'; '#f16913'; '#d94801'; '#a63603'; '#7f2704'
            });

        % ---------------------------------------------------------------- %
        %  Sequential: gray (9-step ColorBrewer Greys)                     %
        % ---------------------------------------------------------------- %
        case 'sequential-gray'
            colors = hex2rgb_({ ...
                '#ffffff'; '#f0f0f0'; '#d9d9d9'; '#bdbdbd';
                '#969696'; '#737373'; '#525252'; '#252525'; '#000000'
            });

        % ---------------------------------------------------------------- %
        %  Paul Tol discrete rainbow – 7 colors                            %
        % ---------------------------------------------------------------- %
        case 'rainbow-7'
            colors = hex2rgb_({ ...
                '#781C81'; '#3F60AE'; '#539EB6'; '#6DB388';
                '#CAB843'; '#E78532'; '#D92120'
            });

        % ---------------------------------------------------------------- %
        %  Paul Tol discrete rainbow – 10 colors                           %
        % ---------------------------------------------------------------- %
        case 'rainbow-10'
            colors = hex2rgb_({ ...
                '#781C81'; '#3F317D'; '#3F60AE'; '#539EB6';
                '#6DB388'; '#9DC668'; '#CAB843'; '#E78532';
                '#CB4226'; '#D92120'
            });

        otherwise
            warning('MATLAB:sciplot_colors:unknownPalette', ...
                '[sciplot_colors] Unknown palette "%s". Using "bright".', name);
            colors = sciplot_colors('bright');
    end
end


% ======================================================================= %
%  Private helper                                                          %
% ======================================================================= %

function rgb = hex2rgb_(hexcell)
% Convert a cell array of '#RRGGBB' strings to an N×3 [0,1] matrix.
    n   = numel(hexcell);
    rgb = zeros(n, 3);
    for k = 1:n
        h       = strtrim(hexcell{k});
        h       = strrep(h, '#', '');
        rgb(k,1) = hex2dec(h(1:2)) / 255;
        rgb(k,2) = hex2dec(h(3:4)) / 255;
        rgb(k,3) = hex2dec(h(5:6)) / 255;
    end
end
