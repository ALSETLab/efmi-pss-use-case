@rem Check source code of the Production Code container using Cppcheck and clang-tidy.

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

rem *****************************************************************************************************************************
rem    Configure build environment (user settings, log files, etc)
rem *****************************************************************************************************************************

rem Use user-defined build environment if any is selected:
if defined DYMOLA_eFMI_BUILD_ENVIRONMENT (
	call "%DYMOLA_eFMI_BUILD_ENVIRONMENT%"
)

rem Configure absolute path used as anchor for any further file references:
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

rem Configure "exit" to terminate subroutines and entire script:
if not "%SELFWRAPPED%"=="%~0" (
	set "SELFWRAPPED=%~0"
	"%COMSPEC%" /s /c ""%~0" %*"
	goto :eof
)

rem Cleanup logs:
set "LOG_DIR=%SCRIPT_DIR%\..\logs\check-code"
if exist "%LOG_DIR%" (
	rd /s /q "%LOG_DIR%"
)
md "%LOG_DIR%"
set "LOG_BUILD=%LOG_DIR%\build-log.txt"
echo=> "%LOG_BUILD%"

set "CHECKS_PERFORMED="

rem *****************************************************************************************************************************
rem    Cppcheck
rem *****************************************************************************************************************************

echo=>>"%LOG_BUILD%"
echo=******************************************************************************************************************************************>>"%LOG_BUILD%"
echo= Cppcheck>>"%LOG_BUILD%"
echo=******************************************************************************************************************************************>>"%LOG_BUILD%"
echo=>>"%LOG_BUILD%"

rem ************************************************************************************** Initialize Python runtime environment:

if not defined DYMOLA_eFMI_BUILD_ENVIRONMENT (
	if defined "!PYTHONHOME!" (
		if exist "!PYTHONHOME!\python.exe" (
			set "PATH=!PYTHONHOME!;!PYTHONHOME!\Scripts;!PATH!"
			goto :PYTHON_INITIALIZED
		)
	) 
	set "PYTHON_NO_DEFAULT=false"
	call where python >nul 2>nul
	if ERRORLEVEL 1 (
		set "PYTHON_NO_DEFAULT=true"
	) else if not ERRORLEVEL 0 (
		set "PYTHON_NO_DEFAULT=true"
	) else (
		for /f "delims=" %%a in ( 'where python' ) do (
			set PYTHON_LOCATION=%%a
		)
		if "!PYTHON_LOCATION!" == "%LOCALAPPDATA%\Microsoft\WindowsApps\python.exe" (
			rem The Microsoft store is NOT Python:
			set "PYTHON_NO_DEFAULT=true"
		) else (
			call :BASENAME PYTHONHOME "!PYTHON_LOCATION!"
			set "PATH=!PYTHONHOME!;!PYTHONHOME!\Scripts;!PATH!"
			goto :PYTHON_INITIALIZED
		)
	)
	if "!PYTHON_NO_DEFAULT!"=="true" (
		for /d %%j in (
			"%LOCALAPPDATA%\Programs\Python\Python3"*
			"%ProgramFiles%\Python3"*
			"%ProgramFiles(x86)%\Python3\"*
		) do (
			if exist "%%j" (
				set "PYTHONHOME=%%~fj"
				set "PATH=!PYTHONHOME!;!PYTHONHOME!\Scripts;!PATH!"
				goto :PYTHON_INITIALIZED
			)
		)
	)
	echo=No Python 3 installation found.>> "%LOG_BUILD%"
	goto :CPPCHECK_SKIPPED
)
:PYTHON_INITIALIZED

rem ************************************************************************************************* Find Cppcheck installation:

call where cppcheck >nul 2>nul
if ERRORLEVEL 1 (
	for /d %%j in (
		"%ProgramFiles%\Cppcheck Premium"
		"%ProgramFiles(x86)%\Cppcheck Premium"
	) do (
		if exist "%%j" (
			echo=Using Cppcheck Premium from [ %%~fj ].>> "%LOG_BUILD%"
			echo=>> "%LOG_BUILD%"
			set "CPPCHECK_HOME=%%~fj"
			set "CPPCHECK_PREMIUM_AVAILABLE=true"
			goto :CPPCHECK_INITIALIZED
		)
	)
	for /d %%j in (
		"%ProgramFiles%\Cppcheck"
		"%ProgramFiles(x86)%\Cppcheck"
	) do (
		if exist "%%j" (
			echo=Using open source Cppcheck from [ %%~fj ].>> "%LOG_BUILD%"
			echo=>> "%LOG_BUILD%"
			set "CPPCHECK_HOME=%%~fj"
			set "CPPCHECK_PREMIUM_AVAILABLE="
			goto :CPPCHECK_INITIALIZED
		)
	)
	echo=No Cppcheck installation found.>> "%LOG_BUILD%"
	goto :CPPCHECK_SKIPPED
) else (
	for /f "delims=" %%i in ( 'where cppcheck' ) do (
		call :BASENAME CPPCHECK_HOME "%%i"
	)
)
:CPPCHECK_INITIALIZED

rem *************************************************************************************************** Check code with Cppcheck:

set "CHECKS_PERFORMED=%CHECKS_PERFORMED%,Cppcheck"

rem Configure Cppcheck logs:
set "LOG_DIR_CPPCHECK=%LOG_DIR%\Cppcheck"
md "%LOG_DIR_CPPCHECK%"
set "LOG_CPPCHECK_CHECKERS=%LOG_DIR_CPPCHECK%\checkers-report.txt"
echo=> "%LOG_CPPCHECK_CHECKERS%"

rem Cleanup Cppcheck work folder:
set "CPPCHECK_WORK_FOLDER=%SCRIPT_DIR%\work-folder"
if exist "%CPPCHECK_WORK_FOLDER%" (
	rd /s /q "%CPPCHECK_WORK_FOLDER%"
)
md "%CPPCHECK_WORK_FOLDER%"

rem Select Cppcheck output format (if Python pygments package is available, generate XML results for HTML report, otherwise
rem plain text file):
"!PYTHONHOME!\python.exe" ^
	-c "import pygments"> NUL 2>&1
if ERRORLEVEL 1 (
	set "CPPCHECK_XML_REPORT="
	set "LOG_CPPCHECK_RESULTS=%LOG_DIR_CPPCHECK%\results.txt"
) else if not ERRORLEVEL 0 (
	set "CPPCHECK_XML_REPORT="
	set "LOG_CPPCHECK_RESULTS=%LOG_DIR_CPPCHECK%\results.txt"
) else (
	set "CPPCHECK_XML_REPORT=--xml"
	set "LOG_CPPCHECK_RESULTS=%LOG_DIR_CPPCHECK%\results.xml"
	md "%LOG_DIR_CPPCHECK%\html"
)
echo=> "%LOG_CPPCHECK_RESULTS%

rem Find bug hunting, MISRA C, SEI CERT C Coding Standard and HTML report addons:
if not "%CPPCHECK_PREMIUM_AVAILABLE%"=="" (
	set "CPPCHECK_SEI_CERT_C=--premium=cert-c-2016"
	set "CPPCHECK_MISRA_C=--premium=misra-c-2023"
	rem Deactivate --premium=bughunting; it takes VERY long and there are too many false-positives:
	set "CPPCHECK_BUGHUNTING="
	set "CPPCHECK_HTMLREPORT=!CPPCHECK_HOME!\cppcheck-htmlreport.py"
) else (
	if exist "!CPPCHECK_HOME!\addons\cert.py" (
		set "CPPCHECK_SEI_CERT_C=--addon=!CPPCHECK_HOME!\addons\cert.py"
	) else (
		set "CPPCHECK_SEI_CERT_C="
	)
	set "CPPCHECK_MISRA_C=--addon=%SCRIPT_DIR%\MISRA-C-configuration.json"
	set "CPPCHECK_BUGHUNTING="
	set "CPPCHECK_HTMLREPORT=%SCRIPT_DIR%\cppcheck-htmlreport.py"
)

rem Check source code:
set "EMESSAGE=Cppcheck failed"
"!CPPCHECK_HOME!\cppcheck.exe" ^
	--verbose ^
	--report-progress ^
	--check-library ^
	--checkers-report="%LOG_CPPCHECK_CHECKERS%" ^
	--suppress=missingIncludeSystem ^
	%CPPCHECK_XML_REPORT% ^
	--language=c ^
	--std=c11 ^
	%CPPCHECK_MISRA_C% ^
	!CPPCHECK_SEI_CERT_C! ^
	--library="%SCRIPT_DIR%\SPE-configuration.xml.cfg" ^
	%CPPCHECK_BUGHUNTING% ^
	--enable=warning,style,performance,portability,information,missingInclude ^
	--check-level=exhaustive ^
	--inconclusive ^
	--max-configs=1 ^
	--max-ctu-depth=256 ^
	-j 4 ^
	--cppcheck-build-dir="%CPPCHECK_WORK_FOLDER%" ^
	-I "%SCRIPT_DIR%\.." ^
	"%SCRIPT_DIR%\.." 1>>"%LOG_BUILD%" 2>"%LOG_CPPCHECK_RESULTS%"
if ERRORLEVEL 1 (
	call :ERROR
) else if not ERRORLEVEL 0 (
	call :ERROR
)

rem Compile HTML report if HTML reporting module is available:
if not "%CPPCHECK_XML_REPORT%"=="" (
	echo=>> "%LOG_BUILD%"
	echo=Processing Cppcheck XML results with [ !CPPCHECK_HTMLREPORT! ].>> "%LOG_BUILD%"
	echo=>> "%LOG_BUILD%"
	set "EMESSAGE=Compiling Cppcheck HTML results failed"
	"!PYTHONHOME!\python.exe" ^
		"!CPPCHECK_HTMLREPORT!" ^
		--file="%LOG_CPPCHECK_RESULTS%" ^
		--report-dir="%LOG_DIR_CPPCHECK%\html" ^
		--source-dir="%SCRIPT_DIR%" >>"%LOG_BUILD%" 2>&1
	if ERRORLEVEL 1 (
		call :ERROR
	) else if not ERRORLEVEL 0 (
		call :ERROR
	)
)

:CPPCHECK_SKIPPED

rem *****************************************************************************************************************************
rem    clang-tidy
rem *****************************************************************************************************************************

echo=>>"%LOG_BUILD%"
echo=******************************************************************************************************************************************>>"%LOG_BUILD%"
echo= clang-tidy>>"%LOG_BUILD%"
echo=******************************************************************************************************************************************>>"%LOG_BUILD%"
echo=>>"%LOG_BUILD%"

rem *********************************************************************************************** Find clang-tidy installation:

call where clang-tidy >nul 2>nul
if ERRORLEVEL 1 (
	rem Clang/LLVM is supported since Microsoft Visual Studio 2019 version 16.4 and later:
	for %%y in ( "2022" ) do (
		for %%v in ( "Enterprise" "Professional" "Community" "BuildTools" ) do (
			if exist "%ProgramFiles%\Microsoft Visual Studio\%%y\%%v\VC\Tools\Llvm\x64\bin\clang-tidy.exe" (
				set "EMESSAGE=Microsoft build environment initialization failed (Microsoft Visual Studio %%y)"
				if not exist "%ProgramFiles%\Microsoft Visual Studio\%%y\%%v\VC\Auxiliary\Build\vcvarsall.bat" (
					call :ERROR
				)
				call "%ProgramFiles%\Microsoft Visual Studio\%%y\%%v\VC\Auxiliary\Build\vcvarsall.bat" ^
					x64
				if ERRORLEVEL 1 ( rem Not working: 'vcvarsall.bat' never returns error code.
					call :ERROR
				) else if not ERRORLEVEL 0 (
					call :ERROR
				)
				set "CLANGTIDY_HOME=%ProgramFiles%\Microsoft Visual Studio\%%y\%%v\VC\Tools\Llvm\x64\bin"
				goto :CLANGTIDY_INITIALIZED
			)
		)
	)
	for %%y in ( "2019" ) do (
		for %%v in ( "Enterprise" "Professional" "Community" "BuildTools" ) do (
			if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\%%y\%%v\VC\Tools\Llvm\x64\bin\clang-tidy.exe" (
				set "EMESSAGE=Microsoft build environment initialization failed (Microsoft Visual Studio %%y)"
				if not exist "%ProgramFiles(x86)%\Microsoft Visual Studio\%%y\%%v\VC\Auxiliary\Build\vcvarsall.bat" (
					call :ERROR
				)
				call "%ProgramFiles(x86)%\Microsoft Visual Studio\%%y\%%v\VC\Auxiliary\Build\vcvarsall.bat" ^
					x64
				if ERRORLEVEL 1 ( rem Not working: 'vcvarsall.bat' never returns error code.
					call :ERROR
				) else if not ERRORLEVEL 0 (
					call :ERROR
				)
				set "CLANGTIDY_HOME=%ProgramFiles(x86)%\Microsoft Visual Studio\%%y\%%v\VC\Tools\Llvm\x64\bin"
				goto :CLANGTIDY_INITIALIZED
			)
		)
	)
	echo=No Microsoft Visual Studio based clang-tidy installation found.>> "%LOG_BUILD%"
	goto :CLANGTIDY_SKIPPED
) else (
	for /f "delims=" %%i in ( 'where cppcheck' ) do (
		call :BASENAME CLANGTIDY_HOME "%%i"
	)
)
:CLANGTIDY_INITIALIZED

rem ************************************************************************************************* Check code with clang-tidy:

set "CHECKS_PERFORMED=%CHECKS_PERFORMED%,clang-tidy"

rem Configure clang-tidy logs:
set "LOG_DIR_CLANGTIDY=%LOG_DIR%\clang-tidy"
md "%LOG_DIR_CLANGTIDY%"
set "LOG_CLANGTIDY_RESULTS=%LOG_DIR_CLANGTIDY%\results.txt"
echo=> "%LOG_CLANGTIDY_RESULTS%"

rem The following checks are disabled:
rem   readability-identifier-length:
rem     The GALEC builtin function specification uses short parameter identifiers. For documentation such are best reused.
rem     Likewise, names in the Modelica source model should appear unaltered in production code.
rem   cppcoreguidelines-avoid-magic-numbers, readability-magic-numbers:
rem     Magic numbers in generated production code can stem from magic numbers in the source Modelica model or inlined
rem     constants and parameters.
rem   altera-unroll-loops, altera-id-dependent-backward-branch:
rem     #pragma unroll(N) is implementation defined. The implementation of multi-dimensional GALEC functions are general,
rem     i.e., defined for any sizes; hence, their loops depend on the passed size argument. Respective sizes are fixed and
rem     passed as literals from the generated production code however. We leave it up to the compiler to find, and more
rem     importantly, decide on optimization and tradeoff between unrolling and code size.
rem   altera-struct-pack-align:
rem     To optimize alignment requires target platform knowledge; our code shall be portable however.
rem     We also assume, that the compiler at hand should pick the best alignment (i.e., optimize alignment).
set "EMESSAGE=Clang-tidy failed"
"!CLANGTIDY_HOME!\clang-tidy.exe" ^
	-checks="*,-readability-identifier-length,-cppcoreguidelines-avoid-magic-numbers,-readability-magic-numbers,-altera-unroll-loops,-altera-id-dependent-backward-branch,-altera-struct-pack-align" ^
	"%SCRIPT_DIR%\..\block.c" ^
	-- -I"%SCRIPT_DIR%\.." 2>>"%LOG_BUILD%" 1>"%LOG_CLANGTIDY_RESULTS%"
if ERRORLEVEL 1 (
	call :ERROR
) else if not ERRORLEVEL 0 (
	call :ERROR
)

:CLANGTIDY_SKIPPED

rem *****************************************************************************************************************************
rem    Final cleanup
rem *****************************************************************************************************************************

if "%CHECKS_PERFORMED%"=="" (
	set "EMESSAGE=No checks perfomed! No installations of Cppcheck nor clang-tidy found"
	call :ERROR
)
exit 0

rem *****************************************************************************************************************************
rem    Support functions
rem *****************************************************************************************************************************

rem Get full qualified path of root directory of second argument in first:
:BASENAME
set "%~1=%~dp2"
exit /b 0

rem Append error message to progress log, print the log and exit:
:ERROR
echo=>> "%LOG_BUILD%"
echo=ERROR: %EMESSAGE%.>> "%LOG_BUILD%"
echo=>> "%LOG_BUILD%"
type "%LOG_BUILD%"
exit 1
