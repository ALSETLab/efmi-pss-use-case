@echo off
setlocal

rem -----------------------------------------------------------------------------
rem Launch Dymola Auto.cmd
rem
rem Purpose:
rem   Portable launcher for the efmi-pss-use-case startup flow.
rem   This file is meant to be double-clicked and reused on different computers.
rem
rem What it does:
rem   1) Finds Dymola.exe automatically (tries known versions first, then scans
rem      "C:\Program Files\Dymola *\bin64\Dymola.exe").
rem   2) Resolves paths relative to THIS .cmd file location:
rem        - startup-generic.mos is expected in the same folder (Shortcuts)
rem        - repository root is assumed to be the parent folder of Shortcuts
rem   3) Exports EFMI_PSS_ROOT for the .mos script to consume as project root.
rem   4) Starts Dymola with -nosplash and the startup .mos script.
rem
rem Assumed structure:
rem   <repo-root>\Shortcuts\Launch Dymola Auto.cmd
rem   <repo-root>\Shortcuts\startup-generic.mos
rem -----------------------------------------------------------------------------

rem 1. Auto-detect Dymola executable
set "dymolaPath="

for %%F in (
	"C:\Program Files\Dymola 2026x Fixpack 1\bin64\Dymola.exe"
	"C:\Program Files\Dymola 2026x\bin64\Dymola.exe"
	"C:\Program Files\Dymola 2025x Refresh 1\bin64\Dymola.exe"
) do (
	if not defined dymolaPath if exist "%%~F" set "dymolaPath=%%~F"
)

if not defined dymolaPath (
	for /f "delims=" %%D in ('dir /b /ad /o-n "C:\Program Files\Dymola *" 2^>nul') do (
		if not defined dymolaPath if exist "C:\Program Files\%%D\bin64\Dymola.exe" set "dymolaPath=C:\Program Files\%%D\bin64\Dymola.exe"
	)
)

if not defined dymolaPath (
	echo Could not find Dymola.exe under C:\Program Files\Dymola *\bin64\
	pause
	exit /b 1
)

rem 2. Resolve paths from this .cmd location (portable across computers)
set "shortcutDir=%~dp0"
set "mosScript=%shortcutDir%startup-generic.mos"
for %%I in ("%shortcutDir%..") do set "repoRoot=%%~fI"
set "repoRoot=%repoRoot:\=/%"

rem 3. Pass repo root to Dymola startup script via environment variable
set "EFMI_PSS_ROOT=%repoRoot%"

rem 4. Launch Dymola with -nosplash and the script path
start "" "%dymolaPath%" -nosplash "%mosScript%"

endlocal
