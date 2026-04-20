@echo off
setlocal
rem -----------------------------------------------------------------------------
rem Launch Dymola Auto.cmd
rem
rem Overview of the Launcher Script:
rem This batch script acts as a portable, automated launcher for the Dymola 
rem simulation environment. It begins by auto-detecting the Dymola executable 
rem on the host machine, prioritizing the predefined default installation path. 
rem To maintain portability across different workstations, it resolves all 
rem necessary paths relative to the script's own location. Rather than relying 
rem on hardcoded file hashes, the script dynamically parses the project's 
rem .gitignore file to identify the latest generated eFMU directories and .mo 
rem testing artifacts. It automatically compiles these paths into a temporary 
rem Modelica helper script (load_artifacts.mos). Finally, it launches Dymola 
rem without the splash screen and executes the primary startup script, 
rem seamlessly loading all required dependencies and generated models.
rem -----------------------------------------------------------------------------

rem 1. Auto-detect Dymola executable
rem Updated to prioritize your default Dymola 2026x Refresh 1 path
set "dymolaPath=C:\Program Files\Dymola 2026x Refresh 1\bin64\Dymola.exe"

if not exist "%dymolaPath%" (
	for /f "delims=" %%D in ('dir /b /ad /o-n "C:\Program Files\Dymola *" 2^>nul') do (
		if not defined dymolaPath if exist "C:\Program Files\%%D\bin64\Dymola.exe" set "dymolaPath=C:\Program Files\%%D\bin64\Dymola.exe"
	)
)

if not exist "%dymolaPath%" (
	echo Could not find Dymola.exe under C:\Program Files\Dymola *\bin64\
	pause
	exit /b 1
)

rem 2. Resolve paths from this .cmd location (portable across computers) [cite: 5]
set "shortcutDir=%~dp0"
set "mosScript=%shortcutDir%startup-generic.mos"
for %%I in ("%shortcutDir%..") do set "repoRoot=%%~fI"

rem Convert backslashes to forward slashes for Modelica compatibility [cite: 7]
set "repoRootFwd=%repoRoot:\=/%"

rem Fallback to explicit repo root if relative resolution fails
if "%repoRootFwd%"=="" set "repoRootFwd=C:/dev/efmi-pss-use-case"

rem 3. Generate load_artifacts.mos dynamically from .gitignore
set "loadScript=%shortcutDir%load_artifacts.mos"
echo // Auto-generated script to load artifacts from .gitignore > "%loadScript%"

rem Parse .gitignore for exceptions and write the respective openModel commands [cite: 1]
for /f "tokens=* delims=!" %%F in ('findstr /b "!Modelica/work/" "%repoRoot%\.gitignore"') do (
	rem Check if the line ends with .mo
	echo %%F| findstr /i /e ".mo" >nul
	if errorlevel 1 (
		rem If no .mo extension, it's an eFMU directory. Point to the package.
		echo openModel^("%repoRootFwd%/%%F/SiL-integration/eFMU/_package_.mo"^); >> "%loadScript%"
	) else (
		rem It's a specific generated .mo file
		echo openModel^("%repoRootFwd%/%%F"^); >> "%loadScript%"
	)
)

rem 4. Pass repo root to Dymola startup script via environment variable [cite: 8]
set "EFMI_PSS_ROOT=%repoRootFwd%"

rem 5. Launch Dymola with -nosplash and the script path [cite: 6]
start "" "%dymolaPath%" -nosplash "%mosScript%"

endlocal