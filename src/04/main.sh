#!/bin/bash

colour_number="^[1-6]$"
source config.conf
export HOSTNAME=$(hostname)
export TIMEZONE="$(cat /etc/timezone) $(date -u "+%Z") $(date "+%:::z")"
export USER=$(whoami)
export OS=$(cat /etc/issue | awk '{print $1, $2, $3}' | tr -s '\r\n' ' ')
export DATE=$(date "+%d %b %Y %H:%M:%S")
export UPTIME=$(uptime -p | awk '{print $2, $3, $4, $5}')
export UPTIME_SEC=$(cat /proc/uptime | awk '{print int($1)" sec"}')
export IP=$(hostname -I | awk '{print $1}')
export MASK=$(netstat -rn | awk 'NR==4{print $3}')
export GATEWAY=$(ip r | awk '/default via/{print $3}')
export RAM_TOTAL=$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
export RAM_USED=$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
export RAM_FREE=$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
export SPACE_ROOT="$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')"
export SPACE_ROOT_USED="$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')"
export SPACE_ROOT_FREE="$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')"
export BCA=$column1_background
export FCA=$column1_font_color
export BCB=$column2_background
export FCB=$column2_font_color

if [ $# != 0 ]; then
    echo "Wrong parameters"
else
    if ! [[ $column1_background =~ $colour_number ]]; then
        export BCA=1
        export BCAdef=1
    else
        export BCA=$column1_background
    fi

    if ! [[ $column1_font_color =~ $colour_number ]]; then
        export FCA=6
        export FCAdef=1
    else
        export FCA=$column1_font_color
    fi

    if ! [[ $column2_background =~ $colour_number ]]; then
        export BCB=1
        export BCBdef=1
    else
        export BCB=$column2_background
    fi

    if ! [[ $column2_font_color =~ $colour_number ]]; then
        export FCB=6
        export FCBdef=1
    else
        export FCB=$column2_font_color
    fi

    if [[ $BCA == $FCA ]] || [[ $BCB == $FCB ]]; then
        echo "Background and text color must not match"
        echo "Your settings $BCA $FCA $BCB $FCB"
    else
        chmod +x print.sh
        ./print.sh
    fi
fi
