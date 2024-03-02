__________   _________ ___ ___    _____  ________  ___________
::\____    /  /   _____//   |   \  /  _  \ \______ \ \_   _____/
::  /     /   \_____  \/    ~    \/  /_\  \ |    |  \ |    __)_ 
:: /     /_   /        \    Y    /    |    \|    `   \|        \
::/_______ \ /_______  /\___|_  /\____|__  /_______  /_______  /
::        \/         \/       \/         \/        \/        \/
:: ZShade v1.1b made by zv800 (I'm not the one who figured out this exploit)
@echo off 
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

cd "C:\Program Files\NVIDIA Corporation"
if exist Ansel\ (
  goto showinfo
) else (
  goto MakeAnsel
)

:showinfo
@echo off
title Z-Shade - NVIDIA Ansel exploit.
cls
echo " __________   _________ ___ ___    _____  ________  ___________"
echo "\____    /  /   _____//   |   \  /  _  \ \______ \ \_   _____/"
echo  "/     /   \_____  \/    ~    \/  /_\  \ |    |  \ |    __)_"
echo "/     /_   /        \    Y    /    |    \|    `   \|        \"
echo "/_______ \ /_______  /\___|_  /\____|__  /_______  /_______  /
echo "        \/         \/       \/         \/        \/        \/"
echo.
echo First Open "nvidiaProfileInspector.exe"
echo.
echo.
echo If you do not have Nvidia display drivers goto "https://www.nvidia.com/en-us/geforce/geforce-experience/download/" or open GeForceNOW-release.exe to install GeForce experience
echo.
echo.
echo Open nvidiaProfileInspector and In the nvidiaProfileInspector window find: "Ansel flags for enabled applications" set it to ANSEL_ALLOWLISTED_ALLOWED then click Aply Changes.
echo.
echo then open up ZShadeInstalller.cmd
echo.
echo Then just open roblox and click Alt + F3 when in any game and thats it!
pause
goto Install

:GiveAdmin


:Install
echo Installing
copy "%~dp0\Assets\Shaders\*.*" "Ansel\"
set "C:\Users\z3ck2\AppData\Local\Roblox\Versions\"
set "file_name=RobloxPlayerBeta.exe"
for /f %%f in ('dir /b C:\Users\%username%\AppData\Local\Roblox\Versions') do ren "C:\Users\%username%\AppData\Local\Roblox\Versions\%%f\RobloxPlayerBeta.exe" "eurotrucks2.exe" 
cls
echo Done! Remember not to open Roblox the normal way otherwise it will reinstall and not work. find where Roblox is installed and open eurotrucks2.exe.
pause
cls

exit
:MakeAnsel
echo Makeing Ansel Folder
mkdir Ansel
goto showinfo
