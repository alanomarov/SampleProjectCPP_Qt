## Dependencies
* C++14 
* CMake 3.9 or later
* Qt 5.12.3 or later

### Windows specific dependencies
* VS 2017


## Build on Windows

## Visual Studio
Run generate_x64.bat and/or generate_x86.bat from Scripts/Windows folder. Use Qt path as script parameter. Solutions will be generated in SampleProjectQt/build/Win32 and SampleProjectQt/build/x64.

## QtCreator
You will need QtCreator 4.5 or later.

1. Add x64/x86 Qt version to Build&Run->Qt Versions
2. Create a Kit using this version in Build&Run->Kits.
2.1. Use VS 14.0 compilers. They should be detected by Qt. If not - add them.
2.2. For Cmake Generator use NMake Makefile JOM and CodeBlocks.
2.3. Add this string to Cmake Configuration CMAKE_MAKE_PROGRAM:STRING=c:\Qt\Qt5.12.3\Tools\QtCreator\bin\jom.exe (set your path to jom.exe)
3. Open Client/CmakeLists.txt in QtCreator.
4. Wait while IDE parses files and config and build.

Issues that you might expirience:
1. jom can't be found.
Possible solution for this right now - is to add jom.exe to your System Path variable.
2. mt can't be found. Usually it means you have more than one Microsoft SDKs installed and you have to change the current one in registry to 8.1 (install if you don't have it).
It can be done in HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Microsoft SDKs\Windows\CurrentVersion. You will need to restart your PC after setting it.

## Build on Mac OS

## XCode
Run generate.sh from Scripts/Mac folder. Use Qt path as script parameter. Xcode project will be generated in SampleProjectCPP/build.

## QtCreator
1. Add x64/x86 Qt version to Build&Run->Qt Versions
2. Create a Kit using this version in Build&Run->Kits.
3. For Cmake Generator use Unix Makefiles and CodeBlocks.
4. Open Client/CmakeLists.txt in QtCreator.
5. Wait while IDE parses files and config and build.

## Build on Linux

## Makefile
Run generate_stt.sh from Scripts/Linux folder. Use Qt path as script parameter. Makefiles will be generated in SampleProjectCPP/build/Debug and SampleProjectCPP/build/Release.

## QtCreator
1. Add Qt version to Build&Run->Qt Versions
2. Create a Kit using this version in Build&Run->Kits.
3. For Cmake Generator use Unix Makefiles and CodeBlocks.
4. Open Client/CmakeLists.txt in QtCreator.
5. Wait while IDE parses files and config and build.