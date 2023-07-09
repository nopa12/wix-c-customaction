@REM x86
@REM call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat"

@REM x64
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"


@REM builds debug

cl /c /Zi /nologo /EHsc /MDd /GS /Od /W3 /RTC1 /MDd /I "wix311-binaries\sdk\inc" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "CUSTOMACTIONTEST_EXPORTS" /FpCustomAction.pch /FeCustomAction.obj /Fdvc142.pdb /FS /Gd /TP /analyze- /errorReport:prompt CustomAction.cpp

cl /c /Zi /nologo /EHsc /MDd /GS /Od /W3 /RTC1 /MDd /I "wix311-binaries\sdk\inc" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "CUSTOMACTIONTEST_EXPORTS" /Fpstdafx.pch /Festdafx.obj /Fdvc142.pdb /FS /Gd /TP /analyze- /errorReport:prompt stdafx.cpp

link /DLL /NOLOGO /MACHINE:X64 /OUT:customaction.dll /LIBPATH:"\Program Files (x86)\Windows Kits\10\Lib\10.0.22621.0\um\x64" /LIBPATH:wix311-binaries\sdk\vs2017\lib\x64\ /PDB:vc142.pdb /INCREMENTAL /SUBSYSTEM:WINDOWS /DLL Shell32.lib version.lib user32.lib AdvAPI32.Lib Msi.Lib deputil.lib dutil.lib wcautil.lib CustomAction.obj stdafx.obj