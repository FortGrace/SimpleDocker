#!/bin/bash

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
export BCA=$1
export FCA=$2
export BCB=$3
export FCB=$4
colour_number="^[1-6]$"

if [ $# != 4 ];
then
    echo "Wrong parameters"
else
    if [[ $1 =~ $colour_number ]] && [[ $2 =~ $colour_number ]] && [[ $3 =~ $colour_number ]] && [[ $4 =~ $colour_number ]];
    then
        if [ $1 == $2 ] || [ $3 == $4 ];
        then
            echo "Parameter 1 can't be equal parameter 2, and parameter 3 can't be equal parameter 4. Try again."
        else
            chmod +x print.sh
            ./print.sh
        fi
    else
        echo "Parameters should be a numbers (1-6). Try again."
    fi
fi
