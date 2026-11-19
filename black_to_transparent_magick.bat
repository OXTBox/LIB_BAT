@echo off

set "SRC=%~1"
set "OUT=%SRC%\output"

if not exist "%OUT%" mkdir "%OUT%"

for /r "%SRC%" %%f in (*.png) do (
    set "FILE=%%f"
    call set "REL=%%f"
    call set "REL=%%REL:%SRC%\=%%"

    if not exist "%OUT%\!REL!\.." mkdir "%OUT%\!REL!\.."

    magick "%%f" -fuzz 10%% -transparent black "%OUT%\%%~nxf"
)

pause