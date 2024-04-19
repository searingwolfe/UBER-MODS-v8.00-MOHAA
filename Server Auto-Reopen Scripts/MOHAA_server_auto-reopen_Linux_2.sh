#!/bin/bash

dir="~/server"

# Set the path to your MOHAA server executable
MOHAA_SERVER_PATH="$dir/mohaa_lnxded"

# Set the name of your MOHAA server process
MOHAA_SERVER_PROCESS="mohaa_lnxded"

# Set the path to your server's log file
MOHAA_SERVER_LOG="~/.mohaa/main/qconsole.log"

# Set the maximum number of server crashes before the script stops restarting it
MAX_CRASHES=3

# Set the delay between server restarts in seconds
RESTART_DELAY=60

# Set the initial crash count to 0
CRASH_COUNT=0

# Loop indefinitely
while true; do
    # Check if the server process is running
    if pgrep -x "$MOHAA_SERVER_PROCESS" > /dev/null; then
        echo "Server is running."
        # Check if the server has crashed
        if grep -q "----- Server Shutdown -----" "$MOHAA_SERVER_LOG"; then
            echo "Server has crashed."
            ((CRASH_COUNT++))
            # Check if the maximum number of crashes has been reached
            if [ "$CRASH_COUNT" -ge "$MAX_CRASHES" ]; then
                echo "Maximum number of crashes reached. Script will stop restarting the server."
                exit 1
            fi
            # Wait before restarting the server
            echo "Waiting $RESTART_DELAY seconds before restarting the server..."
            sleep "$RESTART_DELAY"
            # Restart the server
            echo "Restarting the server..."
            "$MOHAA_SERVER_PATH" +set dedicated 2 +exec server.cfg
        else
            echo "Server is running normally."
        fi
    else
        echo "Server is not running. Starting the server..."
        # Start the server
        "$MOHAA_SERVER_PATH" +set dedicated 2 +exec server.cfg
    fi
done