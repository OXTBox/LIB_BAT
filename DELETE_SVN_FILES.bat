@echo off
setlocal

echo Searching for .DS_Store files...

@echo off

for /d /r "%~1" %%D in (.svn) do (
    echo Deleting: "%%D"
    rd /s /q "%%D"
)

echo Done.
pause


for /r "%~1" %%F in (.svn_base) do (
    echo Deleting: "%%F"
    del /f /q "%%F"
)

for /r "%~1" %%F in (.svn) do (
    echo Deleting: "%%F"
    del /f /q "%%F"
)


echo Done.
pause