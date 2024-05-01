@echo off
setlocal enabledelayedexpansion

:: Set the text color to white and the background to red
color 4F

:: Display "Credit to Viper"
echo Credit to Viper
echo Note: Make sure to restart your roblox after doing this.

:: Wait for 3 seconds
ping localhost -n 3 > nul

:: Clear the screen
cls

title vipers roblox fps uncapper

:: Define the path to the Roblox version folder
set "robloxPath=%USERPROFILE%\AppData\Local\Roblox\Versions"

:: Find the directory containing RobloxPlayerBeta.exe
for /d %%A in ("%robloxPath%\*") do (
    if exist "%%A\RobloxPlayerBeta.exe" (
        set "versionFolder=%%A"
    )
)

:: Define the path to the ClientAppSettings.json file
set "settingsPath=!versionFolder!\ClientSettings\ClientAppSettings.json"

:: Check if the ClientSettings folder exists, if not, create it
if not exist "!versionFolder!\ClientSettings" (
    mkdir "!versionFolder!\ClientSettings"
)

:: Ask the user for the desired FPS cap
set /p fpsCap="Enter the desired FPS cap (max 500): "
if !fpsCap! gtr 500 (
    echo Error: 500 is the max. Going over the limit may cause crashing.
    exit /b
)

:: Create the ClientAppSettings.json file with the desired FPS cap
echo {"DFIntTaskSchedulerTargetFps": !fpsCap!} > "!settingsPath!"

:: Display a loading animation
set "loading=Loading "
set "hashes=####################"
for /L %%i in (1,1,20) do (
    cls
    echo !loading!!hashes:~0,%%i!
    ping localhost -n 1 > nul
)

echo FPS cap set to !fpsCap!.
pause

endlocal
