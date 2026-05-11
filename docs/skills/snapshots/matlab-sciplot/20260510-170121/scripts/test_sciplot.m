classdef test_sciplot < matlab.unittest.TestCase
% TEST_SCIPLOT  Unit tests for the matlab-sciplot helper functions.
%
% USAGE (from MATLAB command window)
%   results = runtests('test_sciplot');
%   table(results)
%
% Or run a single test:
%   runtests('test_sciplot/test_init_science')

    % ------------------------------------------------------------------ %
    %  Setup / Teardown                                                   %
    % ------------------------------------------------------------------ %
    methods (TestMethodSetup)
        function closeFigures(~)
            close all;
        end
    end

    methods (TestMethodTeardown)
        function resetGrootDefaults(~)
            reset(groot);      % restore factory defaults after every test
            close all;
        end
    end

    % ================================================================== %
    %  sciplot_colors                                                     %
    % ================================================================== %
    methods (Test, TestTags = {'colors'})

        function test_colors_default_is_bright(tc)
            c = sciplot_colors();
            tc.verifySize(c, [7, 3], ...
                'Default palette should be 7×3 (bright).');
        end

        function test_colors_all_in_range(tc)
            palettes = {'bright','vibrant','dark','paired','high-vis', ...
                        'grayscale','sequential-blue','sequential-orange', ...
                        'sequential-gray','rainbow-7','rainbow-10'};
            for k = 1:numel(palettes)
                c = sciplot_colors(palettes{k});
                tc.verifyGreaterThanOrEqual(c(:), 0, ...
                    sprintf('"%s": values must be ≥ 0.', palettes{k}));
                tc.verifyLessThanOrEqual(c(:), 1, ...
                    sprintf('"%s": values must be ≤ 1.', palettes{k}));
            end
        end

        function test_colors_output_is_numeric_matrix(tc)
            c = sciplot_colors('vibrant');
            tc.verifyClass(c, 'double');
            tc.verifyEqual(ndims(c), 2);
            tc.verifyEqual(size(c,2), 3, 'Color matrix must have 3 columns (RGB).');
        end

        function test_colors_grayscale_equal_channels(tc)
            c = sciplot_colors('grayscale');
            % Each row must have R == G == B
            tc.verifyEqual(c(:,1), c(:,2), 'AbsTol', 1e-10, ...
                'Grayscale: R and G channels must be equal.');
            tc.verifyEqual(c(:,2), c(:,3), 'AbsTol', 1e-10, ...
                'Grayscale: G and B channels must be equal.');
        end

        function test_colors_rainbow7_has_7_rows(tc)
            c = sciplot_colors('rainbow-7');
            tc.verifyEqual(size(c,1), 7);
        end

        function test_colors_rainbow10_has_10_rows(tc)
            c = sciplot_colors('rainbow-10');
            tc.verifyEqual(size(c,1), 10);
        end

        function test_colors_unknown_palette_warns_and_falls_back(tc)
            tc.verifyWarning(@() sciplot_colors('nonexistent_palette'), ...
                'MATLAB:sciplot_colors:unknownPalette');
            % fallback should still return a valid palette
            warnState = warning('off', 'all');
            c = sciplot_colors('nonexistent_palette');
            warning(warnState);
            tc.verifySize(c, [7, 3]);
        end

        function test_colors_numeric_passthrough(tc)
            % Passing an N×3 matrix should return it unchanged
            rgb = [1 0 0; 0 1 0; 0 0 1];
            out = sciplot_colors(rgb);
            tc.verifyEqual(out, rgb);
        end
    end

    % ================================================================== %
    %  sciplot_init                                                       %
    % ================================================================== %
    methods (Test, TestTags = {'init'})

        function test_init_default_calls_without_error(tc)
            tc.verifyWarningFree(@() sciplot_init());
        end

        function test_init_science_sets_font(tc)
            sciplot_init('science');
            fn = get(groot, 'defaultAxesFontName');
            tc.verifyEqual(fn, 'Helvetica');
        end

        function test_init_science_sets_fontsize(tc)
            sciplot_init('science');
            fs = get(groot, 'defaultAxesFontSize');
            tc.verifyEqual(fs, 18);
        end

        function test_init_ieee_sets_narrow_width(tc)
            sciplot_init('ieee');
            pos = get(groot, 'defaultFigurePosition');
            tc.verifyEqual(pos(3), 3.5, 'AbsTol', 1e-9, ...
                'IEEE style should set figure width to 3.5 in.');
        end

        function test_init_ieee_sets_small_fontsize(tc)
            sciplot_init('ieee');
            fs = get(groot, 'defaultAxesFontSize');
            tc.verifyEqual(fs, 8);
        end

        function test_init_nature_sets_arial(tc)
            sciplot_init('nature');
            fn = get(groot, 'defaultAxesFontName');
            tc.verifyEqual(fn, 'Arial');
        end

        function test_init_notebook_enables_xgrid(tc)
            sciplot_init('notebook');
            xg = get(groot, 'defaultAxesXGrid');
            tc.verifyEqual(char(xg), 'on');
        end

        function test_init_sets_color_order(tc)
            sciplot_init('science');
            co = get(groot, 'defaultAxesColorOrder');
            tc.verifyEqual(ndims(co), 2);
            tc.verifyEqual(size(co,2), 3, ...
                'ColorOrder must be N×3.');
        end

        function test_init_tick_direction_out(tc)
            sciplot_init('science');
            td = get(groot, 'defaultAxesTickDir');
            tc.verifyEqual(td, 'out');
        end

        function test_init_box_off(tc)
            sciplot_init('science');
            b = get(groot, 'defaultAxesBox');
            tc.verifyEqual(char(b), 'off');
        end

        function test_init_unknown_style_warns(tc)
            tc.verifyWarning(@() sciplot_init('unknown_style_xyz'), ...
                'MATLAB:sciplot_init:unknownStyle');
        end

        function test_init_all_valid_styles_warn_free(tc)
            styles = {'science','ieee','ieee-double','nature','notebook','minimal'};
            for k = 1:numel(styles)
                reset(groot);
                tc.verifyWarningFree(@() sciplot_init(styles{k}), ...
                    sprintf('Style "%s" should not warn.', styles{k}));
            end
        end
    end

    % ================================================================== %
    %  sciplot_style                                                      %
    % ================================================================== %
    methods (Test, TestTags = {'style'})

        function test_style_applies_to_current_axes(tc)
            fig = figure('Visible','off');
            plot(1:5, rand(1,5));
            sciplot_style('science');
            ax = gca;
            tc.verifyEqual(ax.FontName, 'Helvetica');
            close(fig);
        end

        function test_style_accepts_axes_handle(tc)
            fig = figure('Visible','off');
            ax = axes(fig);
            plot(ax, 1:5, rand(1,5));
            sciplot_style(ax, 'science');
            tc.verifyEqual(ax.FontName, 'Helvetica');
            close(fig);
        end

        function test_style_ieee_sets_fontsize8(tc)
            fig = figure('Visible','off');
            ax = axes(fig);
            plot(ax, 1:5, rand(1,5));
            sciplot_style(ax, 'ieee');
            tc.verifyEqual(ax.FontSize, 8);
            close(fig);
        end

        function test_style_nature_sets_arial(tc)
            fig = figure('Visible','off');
            ax = axes(fig);
            plot(ax, 1:5, rand(1,5));
            sciplot_style(ax, 'nature');
            tc.verifyEqual(ax.FontName, 'Arial');
            close(fig);
        end

        function test_style_fontsize_override(tc)
            fig = figure('Visible','off');
            ax = axes(fig);
            plot(ax, 1:5, rand(1,5));
            sciplot_style(ax, 'science', 'FontSize', 12);
            tc.verifyEqual(ax.FontSize, 12);
            close(fig);
        end

        function test_style_ygrid_override(tc)
            fig = figure('Visible','off');
            ax = axes(fig);
            plot(ax, 1:5, rand(1,5));
            sciplot_style(ax, 'science', 'YGrid', 'off');
            tc.verifyEqual(char(ax.YGrid), 'off');
            close(fig);
        end

        function test_style_box_off(tc)
            fig = figure('Visible','off');
            ax = axes(fig);
            plot(ax, 1:5, rand(1,5));
            sciplot_style(ax, 'science');
            tc.verifyEqual(char(ax.Box), 'off');
            close(fig);
        end

        function test_style_sets_color_order(tc)
            fig = figure('Visible','off');
            ax = axes(fig);
            plot(ax, 1:5, rand(1,5));
            sciplot_style(ax, 'science');
            tc.verifyEqual(size(ax.ColorOrder,2), 3);
            close(fig);
        end

        function test_style_tick_direction_out(tc)
            fig = figure('Visible','off');
            ax = axes(fig);
            plot(ax, 1:5, rand(1,5));
            sciplot_style(ax, 'science');
            tc.verifyEqual(ax.TickDir, 'out');
            close(fig);
        end
    end

    % ================================================================== %
    %  sciplot_export                                                     %
    % ================================================================== %
    methods (Test, TestTags = {'export'})

        function test_export_svg_creates_file(tc)
            fig = figure('Visible','off');
            plot(1:5, rand(1,5));
            outfile = fullfile(tempdir, 'sciplot_test_output.svg');
            tc.addTeardown(@() delete_if_exists_(outfile));
            sciplot_export(outfile, fig);
            tc.verifyTrue(isfile(outfile), 'SVG file should exist after export.');
            close(fig);
        end

        function test_export_svg_default_extension(tc)
            fig = figure('Visible','off');
            plot(1:5, rand(1,5));
            base    = fullfile(tempdir, 'sciplot_test_noext');
            outfile = [base, '.svg'];
            tc.addTeardown(@() delete_if_exists_(outfile));
            sciplot_export(base, fig);   % no extension → should add .svg
            tc.verifyTrue(isfile(outfile), ...
                'Export without extension should produce .svg file.');
            close(fig);
        end

        function test_export_png_creates_file(tc)
            fig = figure('Visible','off');
            plot(1:5, rand(1,5));
            outfile = fullfile(tempdir, 'sciplot_test_output.png');
            tc.addTeardown(@() delete_if_exists_(outfile));
            sciplot_export(outfile, fig, 'DPI', 72);
            tc.verifyTrue(isfile(outfile), 'PNG file should exist after export.');
            close(fig);
        end

        function test_export_pdf_creates_file(tc)
            fig = figure('Visible','off');
            plot(1:5, rand(1,5));
            outfile = fullfile(tempdir, 'sciplot_test_output.pdf');
            tc.addTeardown(@() delete_if_exists_(outfile));
            sciplot_export(outfile, fig);
            tc.verifyTrue(isfile(outfile), 'PDF file should exist after export.');
            close(fig);
        end

        function test_export_svg_is_nonempty(tc)
            fig = figure('Visible','off');
            plot(1:5, rand(1,5));
            outfile = fullfile(tempdir, 'sciplot_test_nonempty.svg');
            tc.addTeardown(@() delete_if_exists_(outfile));
            sciplot_export(outfile, fig);
            info = dir(outfile);
            tc.verifyGreaterThan(info.bytes, 0, 'SVG file should not be empty.');
            close(fig);
        end

        function test_export_resize_width(tc)
            fig = figure('Visible','off');
            plot(1:5, rand(1,5));
            outfile = fullfile(tempdir, 'sciplot_resize_test.svg');
            tc.addTeardown(@() delete_if_exists_(outfile));
            sciplot_export(outfile, fig, 'Width', 3.5, 'Height', 2.625);
            fig.Units = 'inches';
            tc.verifyEqual(fig.Position(3), 3.5, 'AbsTol', 0.01, ...
                'Figure width should be resized to 3.5 in.');
            close(fig);
        end

        function test_export_format_override(tc)
            fig = figure('Visible','off');
            plot(1:5, rand(1,5));
            % Supply no extension but force pdf via Format option
            base    = fullfile(tempdir, 'sciplot_fmt_override');
            outfile = [base, '.pdf'];
            tc.addTeardown(@() delete_if_exists_(outfile));
            sciplot_export(base, fig, 'Format', 'pdf');
            tc.verifyTrue(isfile(outfile), ...
                'Format override to pdf should produce a .pdf file.');
            close(fig);
        end

        function test_export_unsupported_format_errors(tc)
            fig = figure('Visible','off');
            plot(1:5, rand(1,5));
            tc.verifyError( ...
                @() sciplot_export(fullfile(tempdir,'x.bmp'), fig), ...
                'MATLAB:sciplot_export:unsupportedFormat');
            close(fig);
        end
    end
end


% ======================================================================= %
%  File-local helper                                                       %
% ======================================================================= %

function delete_if_exists_(f)
    if isfile(f), delete(f); end
end
