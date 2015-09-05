
if /i %1 == v100 set MAJORVERSION=10
if /i %1 == v110 set MAJORVERSION=11
if /i %1 == v120 set MAJORVERSION=12
if /i %1 == v140 set MAJORVERSION=14

if /i %2 == Win32 set PLATFORMARG=x86
if /i %2 == x64 set PLATFORMARG=amd64

call "C:\Program Files (x86)\Microsoft Visual Studio %MAJORVERSION%.0\VC\vcvarsall.bat" %PLATFORMARG%

msbuild ..\msvc\makejsln.sln /p:PlatformToolset=%1;Platform=%2;Configuration=%3;UsesConfigurationType=%4;CallingConvention=%5

msbuild ..\msvc\makeasln.sln /p:PlatformToolset=%1;Platform=%2;Configuration=%3;UsesConfigurationType=%4;CallingConvention=%5

