@echo off
setlocal enabledelayedexpansion

rem Check if a folder was provided
if "%~1"=="" (
    echo Drag and drop a folder onto this script, or pass a path via Command Prompt.
    pause
    exit /b
)

rem Path of dropped folder
set "sourceFolder=%~1"
set "foldername=%~n1"

rem Output folder (creates AUDIT next to the script/current directory)
set "outputFolder=%cd%\AUDIT"
set "listFolder=%outputFolder%\%foldername%_Lists"

if not exist "%listFolder%" mkdir "%listFolder%"

rem Prepare special files
set "noExtFile=%listFolder%\noExt_Files.txt"
set "folderList=%listFolder%\Folder_Paths.txt"

rem Start fresh
> "%noExtFile%" echo Files with NO extension:
> "%folderList%" echo Folder paths:

echo Scanning folder: %sourceFolder%
echo.

rem Traverse BOTH files and folders reliably
for /f "delims=" %%A in ('dir "%sourceFolder%" /s /b /a') do (
    set "fullPath=%%~A"
    set "itemName=%%~nxA"
    set "skip=0"

    rem --- EXCLUSION 1: Skip anything inside a .git folder ---
    if not "!fullPath:\.git\=!"=="!fullPath!" set "skip=1"
    if /i "!itemName!"==".git" set "skip=1"

    rem --- EXCLUSION 2: Skip Git-specific files ---
    if /i "!itemName!"==".gitignore" set "skip=1"
    if /i "!itemName!"==".gitattributes" set "skip=1"
    if /i "!itemName!"==".gitmodules" set "skip=1"
    if /i "!itemName!"==".gitkeep" set "skip=1"

    rem --- EXCLUSION 3: Skip WSL paths or WSL-specific files ---
    if not "!fullPath:\WSL\=!"=="!fullPath!" set "skip=1"
    if not "!fullPath:\wsl.localhost\=!"=="!fullPath!" set "skip=1"
    if not "!fullPath:\wsl$\=!"=="!fullPath!" set "skip=1"
    if /i "!itemName!"==".wslconfig" set "skip=1"
    if /i "!itemName!"=="wsl.conf" set "skip=1"

    if "!skip!"=="0" (
        rem Check if item is a directory (attribute starts with 'd')
        set "attrs=%%~aA"
        if /i "!attrs:~0,1!"=="d" (
            echo %%A>>"%folderList%"
        ) else (
            set "ext=%%~xA"

            rem Handle files with NO extension
            if "!ext!"=="" (
                echo %%A>>"%noExtFile%"
            ) else (
                rem Remove leading dot from extension
                set "cleanExt=!ext:~1!"
                set "extFile=%listFolder%\!cleanExt!_Files.txt"

                if not exist "!extFile!" (
                    echo Files with extension .!cleanExt!:>"!extFile!"
                )
                echo %%A>>"!extFile!"
            )
        )
    )
)

echo.
echo Output created in:
echo %listFolder%
echo.

endlocal
pause