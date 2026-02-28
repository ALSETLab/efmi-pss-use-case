@echo off
setlocal

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
