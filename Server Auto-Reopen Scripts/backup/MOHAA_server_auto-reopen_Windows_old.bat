@echo off
set MOHAA="C:\Users\Searingwolfe\Desktop\Shortcut MOHAA_server.exe.lnk"
set Source="C:\Users\Searingwolfe\Desktop\MOHAA 1.12 server\main"
set Destination="C:\Users\Searingwolfe\Desktop"

set Filename=qconsole
set a=0

:start
start /wait "" %MOHAA%
set /a a+=1
copy %Source%\%Filename%.log %Destination%\%Filename%(%a%).log
@echo Copied: %date% %time%
goto start