@echo off
setlocal

if "%1"=="clean" goto :clean
if "%1"=="noclean" (
	set __NOCLEAN__=true
	shift)

setlocal
call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat" amd64
call :build x64 Release v110 || goto :eof
call :build x64 Debug v110 || goto :eof
endlocal

setlocal
call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat" x86
call :build Win32 Release v110 || goto :eof
call :build Win32 Debug v110 || goto :eof
endlocal

REM TODO - DELETE THE FOLLOWING LINE
goto :eof

setlocal
call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" amd64
call :build x64 Release v100 || goto :eof
call :build x64 Debug v100 || goto :eof
endlocal

setlocal
call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" x86
call :build Win32 Release v100 || goto :eof
call :build Win32 Debug v100 || goto :eof
endlocal

if "__NOCLEAN__"=="true" goto :eof

goto :clean
goto :eof

:build

pushd %~dp0\..
mkdir msvc
dir
copy jconfig.vc   msvc\jconfig.h       
copy makejsln.v10 msvc\makejsln.sln
copy makeasln.v10 msvc\makeasln.sln
copy makejvcx.v10 msvc\jpeg.vcxproj
copy makelvcx.v10 msvc\jpegdll.vcxproj
copy makecvcx.v10 msvc\cjpeg.vcxproj
copy makedvcx.v10 msvc\djpeg.vcxproj
copy maketvcx.v10 msvc\jpegtran.vcxproj
copy makewvcx.v10 msvc\wrjpgcom.vcxproj
copy makervcx.v10 msvc\rdjpgcom.vcxproj
copy *.h msvc
copy *.c msvc
	
msbuild /P:Platform=%1 /P:Configuration=%2 /P:PlatformToolset=%3 /P:ConfigurationType=DynamicLibrary /P:CallingConvention=Cdecl   msvc\makejsln.sln || goto :eof
msbuild /P:Platform=%1 /P:Configuration=%2 /P:PlatformToolset=%3 /P:ConfigurationType=StaticLibrary /P:CallingConvention=Cdecl    msvc\makejsln.sln || goto :eof
msbuild /P:Platform=%1 /P:Configuration=%2 /P:PlatformToolset=%3 /P:ConfigurationType=DynamicLibrary /P:CallingConvention=stdcall msvc\makejsln.sln || goto :eof
msbuild /P:Platform=%1 /P:Configuration=%2 /P:PlatformToolset=%3 /P:ConfigurationType=StaticLibrary /P:CallingConvention=stdcall  msvc\makejsln.sln || goto :eof
msbuild /P:Platform=%1 /P:Configuration=%2 /P:PlatformToolset=%3 /P:ConfigurationType=DynamicLibrary /P:CallingConvention=Cdecl   msvc\makeasln.sln || goto :eof
msbuild /P:Platform=%1 /P:Configuration=%2 /P:PlatformToolset=%3 /P:ConfigurationType=StaticLibrary /P:CallingConvention=Cdecl    msvc\makeasln.sln || goto :eof
msbuild /P:Platform=%1 /P:Configuration=%2 /P:PlatformToolset=%3 /P:ConfigurationType=DynamicLibrary /P:CallingConvention=stdcall msvc\makeasln.sln || goto :eof
msbuild /P:Platform=%1 /P:Configuration=%2 /P:PlatformToolset=%3 /P:ConfigurationType=StaticLibrary /P:CallingConvention=stdcall  msvc\makeasln.sln || goto :eof

popd
goto :eof

:clean
REM rd /s /q v90
rd /s /q intermediate