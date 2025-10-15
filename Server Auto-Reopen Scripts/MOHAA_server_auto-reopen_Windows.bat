@echo off
setlocal enabledelayedexpansion

:: Phrases to search for within the log file.
:: Runtime errors almost always occur when the server is changing maps (currently running "intermission", but not necessarily caused by it).
:: If the server crashes, errors will appear in this standalone script, printing at minimum: "(global/intermission_serverautoreopen.scr," to qconsole.log just before hanging or closing.
::
:: For multiple search phrases, modify the "findstr" line to this: findstr /C:"%search1%" /C:"%search2%" /C:"%search3%" "%LOGFILE%" >nul
::
set "search1=(global/intermission_serverautoreopen.scr,"

set "dllfail=...reason: 'A dynamic link library (DLL) initialization routine failed."

:: ////////////////////////////////////////////////////////////////////////

echo Medal of Honor: Server Auto-Reopen Script
echo -----------------------------------------
echo(
echo Please make sure no space bars exist within your filepaths, or shortcuts to MOHAA_server.exe.
echo(
set "MOHAA=C:\Users\Wolfe\Desktop\Shortcut_MOHAA_server.exe.lnk"
set "LOGFILE=C:\Users\Wolfe\Desktop\MOHAA_1.12_server\main\qconsole.log"
set "Destination=C:\Users\Wolfe\Desktop"
set "SERVER_EXE=C:\Users\Wolfe\Desktop\MOHAA_1.12_server\MOHAA_server.exe"
set "SERVER_PROCESS=MOHAA_server.exe"

echo Server shortcut path:      !MOHAA!
echo qconsole.log file path:    !LOGFILE!
echo Destination path for logs: !Destination!
echo Server .exe file path:     !SERVER_EXE!
echo Server .exe file name:     !SERVER_PROCESS!
echo(

:: ////////////////////////////////////////////////////////////////////////

:: Loop through each variable.
for %%V in (MOHAA LOGFILE Destination SERVER_EXE SERVER_PROCESS) do (
    set "original=!%%V!"
    set "noSpaces=!original: =!"

    if "!original!" neq "!noSpaces!" (
        echo [ERROR] %%V contains a space: "!original!"
	echo(
	echo Close this window, edit .bat file with Notepad, and then reopen.
	pause
    )
)

:: Check if folders exist.
for %%D in (Destination) do (
    if not exist "!%%D!\*" (
        echo [ERROR] This folder does not exist: "!%%D!"
	echo(
	echo Close this window, edit .bat file with Notepad, and then reopen.
	pause
    )
)

:: Check if files exist.
for %%F in (MOHAA LOGFILE SERVER_EXE) do (
    if not exist "!%%F!" (
        echo [ERROR] This file does not exist: "!%%F!"
	echo(
	echo Close this window, edit .bat file with Notepad, and then reopen.
	pause
    )
)

set Filename=qconsole
set a=0

:: Check if the server process is running.
tasklist | findstr /I "%SERVER_PROCESS%" >nul
if %errorlevel% neq 0 (
	echo Starting !SERVER_PROCESS!...
	start "" %MOHAA%
) else (
	echo !SERVER_PROCESS! is running.
)

timeout /t 1 /nobreak >nul

echo Script initialized. Monitoring !SERVER_PROCESS!...

:: Loop to continuously monitor.
:monitor

:: Wait 3 seconds before checking again.
timeout /t 3 /nobreak >nul

:: Check if runtime errors exist in the log file.
findstr /C:"%search1%" "%LOGFILE%" >nul
if %errorlevel% equ 0 (
	echo [ERROR] !SERVER_PROCESS! Runtime Error detected^^!
	goto restart
)

:: Check if DLL errors exist in the log file.
findstr /C:"%dllfail%" "%LOGFILE%" >nul
if %errorlevel% equ 0 (
	echo [ERROR] !SERVER_PROCESS! DLL initialization failed^^!
	goto restart
)

:: Check if the server process is running
tasklist | findstr /I "%SERVER_PROCESS%" >nul
if %errorlevel% neq 0 (
	echo [ERROR] !SERVER_PROCESS! is no longer running^^!
	goto restart
)

goto monitor

:: Thread for restarting the server.
:restart

:: Kill the MOHAA_server.exe process if it's running.
taskkill /F /IM MOHAA_server.exe >nul 2>&1

:: Save a copy of the logfile to desktop before restarting server.
set /a a+=1
copy %LOGFILE% "%Destination%\%Filename%(%a%).log"
@echo Copied: %date% %time%

:: Wait 2 seconds before restarting.
timeout /t 2 /nobreak >nul

:: Restart the MOHAA Server.
echo Restarting !SERVER_PROCESS!...
start "" %MOHAA%
    
:: Clear the log file after restart to avoid infinite loop detection.
echo. > "%LOGFILE%"

goto monitor