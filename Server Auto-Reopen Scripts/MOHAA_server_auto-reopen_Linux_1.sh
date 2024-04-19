#!/bin/bash

MOHAA="/home/Searingwolfe/Desktop/MOHAA_1.12_server/mohaa_lnxded"
Source="/home/Searingwolfe/Desktop/MOHAA_1.12_server/main"
Destination="/home/Searingwolfe/Desktop"

Filename="qconsole"
a=0

while true; do
    "$MOHAA" +set dedicated 2 +exec server_cfg
    ((a++))
    cp "$Source/$Filename.log" "$Destination/${Filename}_${a}.log"
    echo "Copied: $(date '+%F %T')"
done