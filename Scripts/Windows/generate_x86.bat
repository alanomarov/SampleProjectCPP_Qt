@echo off

set ROOT_DIR=%~dp0

cd %ROOT_DIR%

IF NOT "%1"=="" GOTO START
ECHO Qt path parameter required

pause
exit /b

: START

set QT_PREFIX_PATH=%1

set SOURCE_DIR=%ROOT_DIR%/../../SampleProjectQt
set BUILD_DIR_WIN32=%SOURCE_DIR%/build/Win32

rem create build directory for Win32
if not exist "%BUILD_DIR_WIN32%" mkdir "%BUILD_DIR_WIN32%"
cd "%BUILD_DIR_WIN32%"

rem clear CMake cache
del "CMakeCache.txt"

call cmake ^
-G "Visual Studio 15 2017" -T v141 ^
-DCMAKE_CONFIGURATION_TYPES="Debug;Release" ^
-DCMAKE_PREFIX_PATH="%QT_PREFIX_PATH%" ^
-DCMAKE_SYSTEM_VERSION=8.1 ^
"%SOURCE_DIR%"

cd %ROOT_DIR%