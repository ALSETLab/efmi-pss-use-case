@echo off
setlocal

rem Clear any user set ERRORLEVEL variable:
set "ERRORLEVEL="

rem Enable advanced batch file commands:
verify argument_to_enforce_error 2>nul
setlocal EnableExtensions
if ERRORLEVEL 1 (
	echo=SCRIPT ABORTED: Command extensions not supported.
	exit /b 1
)
verify argument_to_enforce_error 2>nul
setlocal EnableDelayedExpansion
if ERRORLEVEL 1 (
	endlocal rem Undo "setlocal EnableExtensions"
	echo=SCRIPT ABORTED: Delayed expansion not supported.
	exit /b 1
)

rem Configure binary code generation:
set "tgtInstrSetArch=x86"

rem Initialize Microsoft build environment:
call where msbuild >nul 2>nul
if ERRORLEVEL 1 (
	for %%y in ( "2019" "2017" ) do (
		for %%v in ( "Enterprise" "Professional" "Community" "BuildTools" ) do (
			if exist "C:\Program Files (x86)\Microsoft Visual Studio\%%y\%%v\VC\Auxiliary\Build\vcvarsall.bat" (
				call "C:\Program Files (x86)\Microsoft Visual Studio\%%y\%%v\VC\Auxiliary\Build\vcvarsall.bat" %tgtInstrSetArch%
				if ERRORLEVEL 1 ( rem Not working: 'vcvarsall.bat' never returns error code.
					set "EMESSAGE=Microsoft build environment initialization failed (Microsoft Visual Studio %%y)"
					goto :ERROR
				)
				goto :VISUAL_STUDIO_INITIALIZED
			)
		)
	)
	for %%v in ( "14.0" "12.0" "11.0" "10.0" ) do (
		if exist "C:\Program Files (x86)\Microsoft Visual Studio %%v\VC\vcvarsall.bat" (
			call "C:\Program Files (x86)\Microsoft Visual Studio %%v\VC\vcvarsall.bat" %tgtInstrSetArch%
			if ERRORLEVEL 1 (
				set "EMESSAGE=Microsoft build environment initialization failed (Microsoft Visual Studio v%%v)"
				goto :ERROR
			)
			goto :VISUAL_STUDIO_INITIALIZED
		)
	)
	set "EMESSAGE=No Microsoft Visual Studio installation found"
	goto :ERROR
)
:VISUAL_STUDIO_INITIALIZED

rem Build binaries:
nmake > buildReport.txt 2>&1
exit %ERRORLEVEL%


rem ********************************************************************************************************** Support functions:

rem Print error message and exit:
:ERROR
echo=
echo=ERROR: %EMESSAGE%.
echo=
exit 1
