#!/bin/bash

if [[ $# != 1 ]]; then
    echo "Wrong arguments!"
else
    if [[ "${1: -1}" != "/" ]]; then
    echo "Directory should end with '/'"
    else
        if ! [[ -d $1 ]]; then
        echo "Directory not exist"
        else
        export begin=$(date +%s)
        export numberOfFolders=$(sudo find $1 -type d | wc -l)
        export topFiveFolders=$(sudo du -h $1 | sort -hr | head -5 | awk 'BEGIN{i=1}{printf "%d - %s, %s\n", i, $2, $1; i++}')
        export totalNumFiles=$(sudo ls -laR $1 | grep ^- | wc -l)
        export numConf=$(sudo find $1 -type f -name "*.conf" | wc -l)
        export numTXT=$(sudo find $1 -type f -name "*.txt" | wc -l)
        export numEXE=$(sudo find $1 -type f -name -executable | wc -l)
        export numLOG=$(sudo find $1 -type f -name "*.log" | wc -l)
        export numRAR=$(sudo find $1 -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" | wc -l)
        export numSYM=$(sudo find $1 -type l | wc -l)
        export top10F=$(sudo find $1 -type f -exec du -h {} + | sort -hr | head -10 | awk '{print $2}')
        export top10FS=$(sudo find $1 -type f -exec du -h {} + | sort -hr | head -10 | awk '{print $1}')
        export top10FT=$(sudo find $1 -type f -exec du -h {} + | sort -hr | head -10 | awk -F . '{print $2}')
        export top10EXE=$(sudo find $1 -type f -executable -exec du -h {} + | sort -hr | head -10 | awk '{print $2}')
        export top10EXES=$(sudo find $1 -type f -executable -exec du -h {} + | sort -hr | head -10 | awk '{print $1}')
        chmod +x print.sh
        ./print.sh
        fi
    fi
fi
