# LIB_BAT

The batch files and small utility scripts we use, each with what it is for (the owner, 18 Nov 2026).
Windows `.bat` files run by dragging a folder onto them in Explorer; the `.sh` scripts run inside WSL (Ubuntu).

## Folder and file audit

Lists everything in a folder, one text file per file extension, so you can see what a folder holds
(and what does not belong in git). Both skip `.git` folders and git's own files. Output: an `AUDIT/<folder>_Lists/`
folder in the current folder, with `Folder_Paths.txt`, `noExt_Files.txt` and `<ext>_Files.txt`.

| Script | Where | Use |
|---|---|---|
| `audit.sh` | WSL | `./audit.sh ~/projects` - **the one to use for anything in WSL** (Windows batch files can't see inside WSL properly). This made the 17 Nov audit of ~/projects (98 lists). |
| `Deep_folder_file_lists.bat` | Windows | drag a Windows folder onto it. Also skips WSL paths. |
| `deep_folder_lists_new.bat` | Windows | the older version (Aug 2026). Its folder list stays empty (`for /r` only walks files); keep for history, use the one above. |

## Images (need ImageMagick: `magick` on the Windows path)

| Script | Does | Watch out |
|---|---|---|
| `black_to_transparent_magick.bat` | every `.png` under the dropped folder: black (within 10%) becomes transparent; copies go to `<folder>\output\` | all copies land flat in `output\`, so two files with the same name in different subfolders overwrite each other |
| `invert_color_drop_magick.bat` | inverts the colours of every png/jpg/jpeg/webp under the dropped folder | **changes the originals in place**: copy the folder first |

## Clean-up

| Script | Does | Watch out |
|---|---|---|
| `DELETE_SVN_FILES.bat` | deletes every `.svn` folder (and `.svn` / `.svn_base` files) under the dropped folder: old Subversion leftovers | deletes without asking; its first message wrongly says ".DS_Store"; it pauses halfway (press a key to go on) |

## Old shortcuts (2023, the old machine's paths)

| Script | Does |
|---|---|
| `change_directory_and_run_igame3d.bat` | runs `igame3d.exe` in `C:\Users\Private\Documents\GitHub\igame3d` |
| `explore_repo.bat` | opens that folder in Explorer |

These point at a folder that may not exist any more; fix the path before using them.

## Desktop shortcuts and session logs (WSL, 19 Nov 2026)

| Script | Use |
|---|---|
| `desk_shortcut.sh` | `./desk_shortcut.sh "Tests 19 Nov night" "1 Vector Toss" <wsl path>` - a Windows shortcut in a Desktop folder pointing into WSL (how Claude leaves things to try while the owner is away). |
| `save_session_log.sh` | `./save_session_log.sh <session id> "title"` - copies a Claude session's transcript into `~/projects/logs` (raw `.jsonl` + plain `.txt` of the words only). |
| `get_everything.bat` | Windows (double-click): gets every OXTBox project into a `projects` folder next to it; run again to update them all. Needs Git for Windows. |
| `kill_explorer_exes.bat` | Windows (double-click): closes every explorer.exe and starts one fresh (for when 20-odd stray Explorers pile up). The desktop and taskbar blink while it restarts. |

## Play tests (23 Nov 2026)

| Script | Use |
|---|---|
| `tester_pack.bat` | Windows (double-click), on a play tester's PC: copies the play record (`Documents\My Games\Vibecode3D`: `play_record.txt` + each game's `last.state`) and the in-game notes (`<Data folder>\Games\<Game>\LIB_LLM\tell_*.txt`) into `Desktop\Vibecode3D_PlayPack_<date>_<time>` and a `.zip` of it. Only copies. Back home: `python3 -I LIB_TEST/play_report.py <the pack folder>`. `tester_pack.bat "<folder>"` puts the pack there, no window, no pause. |
| `play_python_export.bat` | Windows (double-click): plays a Vibecode3D game exported as a Python program (`xtalk_py/tools/export_py.py GAME` writes `xtalk_py/exports/GAME`); `play_python_export.bat Antack` plays another export (default uDead_CullTest). Its log: `exports/GAME/play.log`. |

## Licence

MIT (see `LICENSE`), Copyright (c) 2026 xAction.
