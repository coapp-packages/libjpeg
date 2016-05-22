
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"

msbuild ..\msvc\makejsln.sln /p:PlatformToolset=%1;Platform=%2;Configuration=%3;UsesConfigurationType=%4;CallingConvention=%5

msbuild ..\msvc\makeasln.sln /p:PlatformToolset=%1;Platform=%2;Configuration=%3;UsesConfigurationType=%4;CallingConvention=%5

