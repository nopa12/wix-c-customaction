# Wix Toolset Custom Action C example
* Wix toolset 3
* without `vcxproj`
* only x64
* C code
* based on: https://github.com/kurtanr/WiXInstallerExamples/tree/main/08_CppCustomAction

* tested on Win11

# build:
```batch
cmd
cd MyCppCustomAction
powershell .\get-wix-toolset.ps1
.\build.cmd
cd ..\InstallerWithMyCppCustomAction
powershell .\build.ps1
```