@echo on
setlocal enabledelayedexpansion

rem Ensure folder argument exists
if "%~1"=="" (
    echo ERROR: No folder was passed to the script.
    echo Drag a folder ONTO the .bat file.
    pause
    exit /b
)

set "sourceFolder=%~1"
set "foldername=%~n1"

if not exist "%sourceFolder%" (
    echo ERROR: Folder does not exist: "%sourceFolder%"
    pause
    exit /b
)

rem Output folder
set "outputFolder=%cd%\AUDIT"

if not exist "%outputFolder%\%foldername%_Lists" (
    mkdir "%outputFolder%\%foldername%_Lists"
)
set "listFolder=%outputFolder%\%foldername%_Lists"

set "noExtFile=%listFolder%\noExt_Files.txt"
set "folderList=%listFolder%\Folder_Paths.txt"

> "%noExtFile%" echo Files with NO extension:
> "%folderList%" echo Folder paths:

echo Scanning folder: "%sourceFolder%"
echo.

rem Traverse reliably
for /r "%sourceFolder%" %%A in (*) do (

    rem Detect folder
    if /i "%%~aA:~0,1"=="d" (
        echo %%A>>"%folderList%"
    ) else (
        set "ext=%%~xA"

        if "!ext!"=="" (
            echo %%A>>"%noExtFile%"
        ) else (
            set "cleanExt=!ext:~1!"
            set "extFile=%listFolder%\!cleanExt!_Files.txt"

            if not exist "!extFile!" (
                echo Files with extension .!cleanExt!:>"!extFile!"
            )

            echo %%A>>"!extFile!"
        )
    )
)

echo.
echo Output created in:
echo %listFolder%
echo.

endlocal
pause
