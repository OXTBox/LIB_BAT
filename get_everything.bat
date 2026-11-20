@echo off
REM Get the whole LIB_ARRAY: every OXTBox project, side by side in one folder.
REM Double-click to get them into a "projects" folder next to this file; run again to update.
REM Needs Git for Windows (https://git-scm.com). Private projects ask you to log in to GitHub once.
setlocal
cd /d "%~dp0"
if not exist projects mkdir projects
cd projects
if exist "LIB_ARRAY\.git" (echo update  LIB_ARRAY& git -C "LIB_ARRAY" pull -q --ff-only) else (echo get     LIB_ARRAY& git clone -q https://github.com/OXTBox/LIB_ARRAY.git)
if exist "LIB_BAT\.git" (echo update  LIB_BAT& git -C "LIB_BAT" pull -q --ff-only) else (echo get     LIB_BAT& git clone -q https://github.com/OXTBox/LIB_BAT.git)
if exist "LIB_BIN\.git" (echo update  LIB_BIN& git -C "LIB_BIN" pull -q --ff-only) else (echo get     LIB_BIN& git clone -q https://github.com/OXTBox/LIB_BIN.git)
if exist "LIB_BIT\.git" (echo update  LIB_BIT& git -C "LIB_BIT" pull -q --ff-only) else (echo get     LIB_BIT& git clone -q https://github.com/OXTBox/LIB_BIT.git)
if exist "LIB_BUILD\.git" (echo update  LIB_BUILD& git -C "LIB_BUILD" pull -q --ff-only) else (echo get     LIB_BUILD& git clone -q https://github.com/OXTBox/LIB_BUILD.git)
if exist "LIB_BVH\.git" (echo update  LIB_BVH& git -C "LIB_BVH" pull -q --ff-only) else (echo get     LIB_BVH& git clone -q https://github.com/OXTBox/LIB_BVH.git)
if exist "LIB_COMFY\.git" (echo update  LIB_COMFY& git -C "LIB_COMFY" pull -q --ff-only) else (echo get     LIB_COMFY& git clone -q https://github.com/OXTBox/LIB_COMFY.git)
if exist "LIB_DATA\.git" (echo update  LIB_DATA& git -C "LIB_DATA" pull -q --ff-only) else (echo get     LIB_DATA& git clone -q https://github.com/OXTBox/LIB_DATA.git)
if exist "LIB_DEV\.git" (echo update  LIB_DEV& git -C "LIB_DEV" pull -q --ff-only) else (echo get     LIB_DEV& git clone -q https://github.com/OXTBox/LIB_DEV.git)
if exist "LIB_EDITOR\.git" (echo update  LIB_EDITOR& git -C "LIB_EDITOR" pull -q --ff-only) else (echo get     LIB_EDITOR& git clone -q https://github.com/OXTBox/LIB_EDITOR.git)
if exist "LIB_GAD\.git" (echo update  LIB_GAD& git -C "LIB_GAD" pull -q --ff-only) else (echo get     LIB_GAD& git clone -q https://github.com/OXTBox/LIB_GAD.git)
if exist "LIB_GAMES\.git" (echo update  LIB_GAMES& git -C "LIB_GAMES" pull -q --ff-only) else (echo get     LIB_GAMES& git clone -q https://github.com/OXTBox/LIB_GAMES.git)
if exist "LIB_GENERICA\.git" (echo update  LIB_GENERICA& git -C "LIB_GENERICA" pull -q --ff-only) else (echo get     LIB_GENERICA& git clone -q https://github.com/OXTBox/LIB_GENERICA.git)
if exist "LIB_GLOBALS\.git" (echo update  LIB_GLOBALS& git -C "LIB_GLOBALS" pull -q --ff-only) else (echo get     LIB_GLOBALS& git clone -q https://github.com/OXTBox/LIB_GLOBALS.git)
if exist "LIB_GUI\.git" (echo update  LIB_GUI& git -C "LIB_GUI" pull -q --ff-only) else (echo get     LIB_GUI& git clone -q https://github.com/OXTBox/LIB_GUI.git)
if exist "LIB_HOWTO\.git" (echo update  LIB_HOWTO& git -C "LIB_HOWTO" pull -q --ff-only) else (echo get     LIB_HOWTO& git clone -q https://github.com/OXTBox/LIB_HOWTO.git)
if exist "LIB_INPUT\.git" (echo update  LIB_INPUT& git -C "LIB_INPUT" pull -q --ff-only) else (echo get     LIB_INPUT& git clone -q https://github.com/OXTBox/LIB_INPUT.git)
if exist "LIB_LISTS\.git" (echo update  LIB_LISTS& git -C "LIB_LISTS" pull -q --ff-only) else (echo get     LIB_LISTS& git clone -q https://github.com/OXTBox/LIB_LISTS.git)
if exist "LIB_LLMIN\.git" (echo update  LIB_LLMIN& git -C "LIB_LLMIN" pull -q --ff-only) else (echo get     LIB_LLMIN& git clone -q https://github.com/OXTBox/LIB_LLMIN.git)
if exist "LIB_LLMOUT\.git" (echo update  LIB_LLMOUT& git -C "LIB_LLMOUT" pull -q --ff-only) else (echo get     LIB_LLMOUT& git clone -q https://github.com/OXTBox/LIB_LLMOUT.git)
if exist "LIB_MAP\.git" (echo update  LIB_MAP& git -C "LIB_MAP" pull -q --ff-only) else (echo get     LIB_MAP& git clone -q https://github.com/OXTBox/LIB_MAP.git)
if exist "LIB_MCP\.git" (echo update  LIB_MCP& git -C "LIB_MCP" pull -q --ff-only) else (echo get     LIB_MCP& git clone -q https://github.com/OXTBox/LIB_MCP.git)
if exist "LIB_MENU\.git" (echo update  LIB_MENU& git -C "LIB_MENU" pull -q --ff-only) else (echo get     LIB_MENU& git clone -q https://github.com/OXTBox/LIB_MENU.git)
if exist "LIB_MOCAP\.git" (echo update  LIB_MOCAP& git -C "LIB_MOCAP" pull -q --ff-only) else (echo get     LIB_MOCAP& git clone -q https://github.com/OXTBox/LIB_MOCAP.git)
if exist "LIB_PORTS\.git" (echo update  LIB_PORTS& git -C "LIB_PORTS" pull -q --ff-only) else (echo get     LIB_PORTS& git clone -q https://github.com/OXTBox/LIB_PORTS.git)
if exist "LIB_PUBLIC\.git" (echo update  LIB_PUBLIC& git -C "LIB_PUBLIC" pull -q --ff-only) else (echo get     LIB_PUBLIC& git clone -q https://github.com/OXTBox/LIB_PUBLIC.git)
if exist "LIB_RAYGUI\.git" (echo update  LIB_RAYGUI& git -C "LIB_RAYGUI" pull -q --ff-only) else (echo get     LIB_RAYGUI& git clone -q https://github.com/OXTBox/LIB_RAYGUI.git)
if exist "LIB_RTS\.git" (echo update  LIB_RTS& git -C "LIB_RTS" pull -q --ff-only) else (echo get     LIB_RTS& git clone -q https://github.com/OXTBox/LIB_RTS.git)
if exist "LIB_SCRIPTBLOCKS\.git" (echo update  LIB_SCRIPTBLOCKS& git -C "LIB_SCRIPTBLOCKS" pull -q --ff-only) else (echo get     LIB_SCRIPTBLOCKS& git clone -q https://github.com/OXTBox/LIB_SCRIPTBLOCKS.git)
if exist "LIB_SFX\.git" (echo update  LIB_SFX& git -C "LIB_SFX" pull -q --ff-only) else (echo get     LIB_SFX& git clone -q https://github.com/OXTBox/LIB_SFX.git)
if exist "LIB_SPARK\.git" (echo update  LIB_SPARK& git -C "LIB_SPARK" pull -q --ff-only) else (echo get     LIB_SPARK& git clone -q https://github.com/OXTBox/LIB_SPARK.git)
if exist "LIB_SYSTEM\.git" (echo update  LIB_SYSTEM& git -C "LIB_SYSTEM" pull -q --ff-only) else (echo get     LIB_SYSTEM& git clone -q https://github.com/OXTBox/LIB_SYSTEM.git)
if exist "LIB_TEST\.git" (echo update  LIB_TEST& git -C "LIB_TEST" pull -q --ff-only) else (echo get     LIB_TEST& git clone -q https://github.com/OXTBox/LIB_TEST.git)
if exist "LIB_THEME\.git" (echo update  LIB_THEME& git -C "LIB_THEME" pull -q --ff-only) else (echo get     LIB_THEME& git clone -q https://github.com/OXTBox/LIB_THEME.git)
if exist "LIB_TOOLBAR\.git" (echo update  LIB_TOOLBAR& git -C "LIB_TOOLBAR" pull -q --ff-only) else (echo get     LIB_TOOLBAR& git clone -q https://github.com/OXTBox/LIB_TOOLBAR.git)
if exist "LIB_TRACE\.git" (echo update  LIB_TRACE& git -C "LIB_TRACE" pull -q --ff-only) else (echo get     LIB_TRACE& git clone -q https://github.com/OXTBox/LIB_TRACE.git)
if exist "LIB_TTRPG\.git" (echo update  LIB_TTRPG& git -C "LIB_TTRPG" pull -q --ff-only) else (echo get     LIB_TTRPG& git clone -q https://github.com/OXTBox/LIB_TTRPG.git)
if exist "LIB_UNICODE\.git" (echo update  LIB_UNICODE& git -C "LIB_UNICODE" pull -q --ff-only) else (echo get     LIB_UNICODE& git clone -q https://github.com/OXTBox/LIB_UNICODE.git)
if exist "LIB_UPBGE\.git" (echo update  LIB_UPBGE& git -C "LIB_UPBGE" pull -q --ff-only) else (echo get     LIB_UPBGE& git clone -q https://github.com/OXTBox/LIB_UPBGE.git)
if exist "LIB_USERS\.git" (echo update  LIB_USERS& git -C "LIB_USERS" pull -q --ff-only) else (echo get     LIB_USERS& git clone -q https://github.com/OXTBox/LIB_USERS.git)
if exist "LIB_XTJSON\.git" (echo update  LIB_XTJSON& git -C "LIB_XTJSON" pull -q --ff-only) else (echo get     LIB_XTJSON& git clone -q https://github.com/OXTBox/LIB_XTJSON.git)
if exist "LIB_ig3d\.git" (echo update  LIB_ig3d& git -C "LIB_ig3d" pull -q --ff-only) else (echo get     LIB_ig3d& git clone -q https://github.com/OXTBox/LIB_ig3d.git)
if exist "PROMPT_GLAZE\.git" (echo update  PROMPT_GLAZE& git -C "PROMPT_GLAZE" pull -q --ff-only) else (echo get     PROMPT_GLAZE& git clone -q https://github.com/OXTBox/PROMPT_GLAZE.git)
if exist "Vibecode3D\.git" (echo update  Vibecode3D& git -C "Vibecode3D" pull -q --ff-only) else (echo get     Vibecode3D& git clone -q https://github.com/OXTBox/Vibecode3D.git)
if exist "xt3D_Raylib_Livecode_Bridge\.git" (echo update  xt3D_Raylib_Livecode_Bridge& git -C "xt3D_Raylib_Livecode_Bridge" pull -q --ff-only) else (echo get     xt3D_Raylib_Livecode_Bridge& git clone -q https://github.com/OXTBox/xt3D_Raylib_Livecode_Bridge.git)
if exist "xtalk_py\.git" (echo update  xtalk_py& git -C "xtalk_py" pull -q --ff-only) else (echo get     xtalk_py& git clone -q https://github.com/OXTBox/xtalk_py.git)
echo.
echo Done: the projects are in %cd%
pause
