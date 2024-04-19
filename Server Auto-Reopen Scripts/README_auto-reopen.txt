<><><> Server Auto-Reopen Scripts <><><>

First, open your desired script with Notepad or similar, and modify the file paths to your MOHAA directories.
Then, run your server by opening the batch/shell script.
Whenever your server crashes, qconsole will be saved, timestamp of crash will be logged, and your server will reopen.

Windows:
Set MOHAA to your Shortcut to MOHAA_server.exe (must be a shortcut with "+set dedicated 2 +exec server.cfg" in the target path).
Set Source to your "main" directory.
Set Destination to the folder you want qconsole(1).log, qconsole(2).log, etc to be saved.

Linux #1:
Set MOHAA to the directory of your MOHAA server executable (mohaa_lnxded).
Set Source to your "main" directory.
Set Destination to the folder you want qconsole(1).log, qconsole(2).log, etc to be saved.

Linux #2:
Set MOHAA_server_path to the directory of your MOHAA server executable (mohaa_lnxded).
Set MOHAA_server_log to your "main" directory.

<><><> <><><>