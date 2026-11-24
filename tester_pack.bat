@echo off
rem tester_pack.bat - on a play tester's PC: gathers the play record and the in-game notes into one
rem folder (and a .zip of it) on the Desktop, to bring back. Double-click it; it only copies, it changes nothing.
rem   play record:  Documents\My Games\Vibecode3D\  (play_record.txt + each game's last.state)
rem   notes:        <Data folder>\Games\<Game>\LIB_LLM\tell_*.txt  (the ` or F2 note box in a game)
rem The Data folder: data_root.txt beside this file, else %APPDATA%\Vibecode3D\data_root.txt, else Documents\Data
rem (the same order the games use). Back home: python3 -I LIB_TEST/play_report.py <the pack folder>
rem Optional: tester_pack.bat "<folder>" puts the pack there instead, with no window and no pause (tests).
rem LIB_BAT, play test 0001 bubble p1-08, 23 Nov 2026.
setlocal

set "DOCS="
for /f "usebackq delims=" %%D in (`powershell -NoProfile -Command "[Environment]::GetFolderPath('MyDocuments')"`) do set "DOCS=%%D"
if not defined DOCS set "DOCS=%USERPROFILE%\Documents"
set "DESK="
for /f "usebackq delims=" %%D in (`powershell -NoProfile -Command "[Environment]::GetFolderPath('Desktop')"`) do set "DESK=%%D"
if not defined DESK set "DESK=%USERPROFILE%\Desktop"

set "REC=%DOCS%\My Games\Vibecode3D"
set "DATA="
if exist "%~dp0data_root.txt" set /p DATA=<"%~dp0data_root.txt"
if not defined DATA if exist "%APPDATA%\Vibecode3D\data_root.txt" set /p DATA=<"%APPDATA%\Vibecode3D\data_root.txt"
if not defined DATA set "DATA=%DOCS%\Data"
set "DATA=%DATA:/=\%"

set "STAMP="
for /f "usebackq delims=" %%T in (`powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HHmm"`) do set "STAMP=%%T"
set "OUTDIR=%DESK%"
if not "%~1"=="" set "OUTDIR=%~1"
set "PACK=%OUTDIR%\Vibecode3D_PlayPack_%STAMP%"

echo Vibecode3D tester pack
echo   play record from: %REC%
echo   notes from:       %DATA%\Games
echo   pack:             %PACK%
echo.

if not exist "%REC%\play_record.txt" echo   (no play_record.txt yet: has a game been played?)
if exist "%REC%" robocopy "%REC%" "%PACK%\My Games Vibecode3D" /S /NFL /NDL /NJH /NJS /NP >nul
if exist "%DATA%\Games" robocopy "%DATA%\Games" "%PACK%\notes\Games" tell_*.txt /S /NFL /NDL /NJH /NJS /NP >nul

if not exist "%PACK%" (
  echo Nothing to pack: no play record and no notes found.
  if "%~1"=="" pause
  exit /b 1
)

set "NNOTES=0"
for /r "%PACK%\notes" %%F in (tell_*.txt) do set /a NNOTES+=1
echo   %NNOTES% note(s) copied
if exist "%PACK%\My Games Vibecode3D\play_record.txt" echo   play record copied

powershell -NoProfile -Command "Compress-Archive -Path '%PACK%\*' -DestinationPath '%PACK%.zip' -Force" >nul 2>&1
if exist "%PACK%.zip" echo   zip: %PACK%.zip
echo.
echo Bring back the .zip (or the folder). Thank you for playing!
if not "%~1"=="" exit /b 0
explorer "%PACK%"
pause
