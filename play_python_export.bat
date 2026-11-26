@echo off
rem play_python_export.bat [GAME]: a Vibecode3D game exported as a Python program (xtalk_py/tools/export_py.py)
rem plays in its own window; what it prints goes to xtalk_py\exports\GAME\play.log
set "GAME=%~1"
if "%GAME%"=="" set "GAME=uDead_CullTest"
wsl.exe -d Ubuntu -e sh /home/igame3d/projects/xtalk_py/exports/%GAME%/play.sh
