@echo off
setlocal

rem *****************************************************************************************************************************
rem This batch script acts as a portable, automated launcher for setting up Dymola for OpenIPSL_CHIL based PSS development.
rem It begins by auto-detecting the Dymola executable on the host machine, prioritizing predefined default installation paths.
rem To maintain portability it resolves all necessary paths w.r.t. the script's own location. Finally, it launches Dymola with a
rem generic startup script that seamlessly loads all required dependencies and generated models.
rem 
rem To use a certain Dymola installation, the DYMOLA_EXECUTABLE environment variable has to be set to the installation's
rem executable before launching the script, causing it to bypass auto-detection.
rem *****************************************************************************************************************************

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

rem Find Dymola executable:
if not defined DYMOLA_EXECUTABLE (
	set "DYMOLA_EXECUTABLE=C:\Program Files\Dymola 2026x Refresh 1\bin64\Dymola.exe"

	if not exist "!DYMOLA_EXECUTABLE!" (
		for /f "delims=" %%D in ( 'dir /b /ad /o-n "C:\Program Files\Dymola *" 2^>nul' ) do (
			if exist "C:\Program Files\%%D\bin64\Dymola.exe" (
				set "DYMOLA_EXECUTABLE=C:\Program Files\%%D\bin64\Dymola.exe"
			)
		)
	)
)
if not exist "!DYMOLA_EXECUTABLE!" (
	set "EMESSAGE=Could not find Dymola.exe; [!DYMOLA_EXECUTABLE!] does not exist."
	call :ERROR
)

rem Resolve paths (but fallback to default repository root if resolution fails):
set "SCRIP_DIR=%~dp0"
set "SCRIP_DIR=%SCRIP_DIR:~0,-1%"
for %%I in ( "%SCRIP_DIR%\.." ) do (
	set "EFMI_PSS_ROOT=%%~fI"
)
if "!EFMI_PSS_ROOT!"=="" (
	set "EFMI_PSS_ROOT=C:/dev/efmi-pss-use-case"
)
if not exist "!EFMI_PSS_ROOT!" (
	set "EMESSAGE=Failed to resolve repository path."
	call :ERROR
)

rem Launch Dymola with the generic startup script configured with EFMI_PSS_ROOT:
start "" /high "!DYMOLA_EXECUTABLE!" -nosplash "%SCRIP_DIR%\start-Dymola.mos"

exit 0

rem ********************************************************************************************************** Support functions:

rem Print error message and exit:
:ERROR
echo=
echo=ERROR: %EMESSAGE%.
echo=
pause
exit 1
