#!/bin/bash
# desk_shortcut.sh FOLDER_NAME LINK_NAME WSL_TARGET_PATH
# Makes a Windows shortcut (.lnk) in Desktop\FOLDER_NAME pointing at a file inside WSL.
# Example: ./desk_shortcut.sh "Tests 19 Nov" "1 Vector Toss" ~/projects/LIB_GAMES/Vibecode3D_Games/VectorToss/STAMINA_NOTE.md
set -e
folder="$1"; name="$2"; target="$3"
desk='C:\Users\Private\Desktop'
abs=$(realpath "$target")
win='\\wsl$\Ubuntu'"${abs//\//\\}"
powershell.exe -NoProfile -Command "\$d='$desk\\$folder'; New-Item -ItemType Directory -Force -Path \$d | Out-Null; \$s=(New-Object -ComObject WScript.Shell).CreateShortcut(\"\$d\\$name.lnk\"); \$s.TargetPath='$win'; \$s.Save()" 
echo "made: Desktop\\$folder\\$name.lnk -> $win"
