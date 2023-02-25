#!/bin/bash

par[1]=$BCA
par[2]=$FCA
par[3]=$BCB
par[4]=$FCB

whiteF="\033[47m"
redF="\033[41m"
greenF="\033[42m"
blueF="\033[44m"
purpleF="\033[45m"
blackF="\033[40m"

end="\033[37m\033[0m"

whiteT="\033[37m"
redT="\033[31m"
greenT="\033[32m"
blueT="\033[34m"
purpleT="\033[35m"
blackT="\033[30m"

for i in 1 2 3 4; do
	if [[ -z ${par[$i]} ]]; then
		par[$i]=1
		param[$i]=1
	fi
done

for i in 1 2 3 4; do
	if [[ ${par[$i]} == 1 ]]; then
                color[$i]="(white)"
        elif [[ ${par[$i]} == 2 ]]; then
		color[$i]="(red)"
        elif [[ ${par[$i]} == 3 ]]; then
		color[$i]="(green)"
        elif [[ ${par[$i]} == 4 ]]; then
		color[$i]="(blue)"
        elif [[ ${par[$i]} == 5 ]]; then
		color[$i]="(purple)"
        elif [[ ${par[$i]} == 6 ]]; then
		color[$i]="(black)"
        fi
done

for i in 1 3;
do
    if [[ ${par[$i]} == 1 ]];
    then
        par[$i]=$whiteF
    elif [[ ${par[$i]} == 2 ]];
    then
		par[$i]=$redF
	elif [[ ${par[$i]} == 3 ]]; then
		par[$i]=$greenF
	elif [[ ${par[$i]} == 4 ]]; then
		par[$i]=$blueF
	elif [[ ${par[$i]} == 5 ]]; then
		par[$i]=$purpleF
	elif [[ ${par[$i]} == 6 ]]; then
		par[$i]=$blackF
	fi
done

for i in 2 4; do
	if [[ ${par[$i]} == 1 ]]; then
                par[$i]=$whiteT
        elif [[ ${par[$i]} == 2 ]]; then
                par[$i]=$redT
        elif [[ ${par[$i]} == 3 ]]; then
                par[$i]=$greenT
        elif [[ ${par[$i]} == 4 ]]; then
                par[$i]=$blueT
        elif [[ ${par[$i]} == 5 ]]; then
                par[$i]=$purpleT
        elif [[ ${par[$i]} == 6 ]]; then
                par[$i]=$blackT
        fi
done


echo -e "${par[1]}${par[2]}HOSTNAME$end = ${par[3]}${par[4]}$HOSTNAME$end"
echo -e "${par[1]}${par[2]}TIMEZONE$end = ${par[3]} ${par[4]}$TIMEZONE$end"
echo -e "${par[1]}${par[2]}USER$end = ${par[3]}${par[4]}$USER$end"
echo -e "${par[1]}${par[2]}OS$end = ${par[3]}${par[4]}$OS$end"
echo -e "${par[1]}${par[2]}DATE$end = ${par[3]}${par[4]}$DATE$end"
echo -e "${par[1]}${par[2]}UPTIME$end = ${par[3]}${par[4]}$UPTIME$end"
echo -e "${par[1]}${par[2]}UPTIME_SEC$end = ${par[3]}${par[4]}$UPTIME_SEC$end"
echo -e "${par[1]}${par[2]}IP$end = ${par[3]}${par[4]}$IP$end"
echo -e "${par[1]}${par[2]}MASK$end = ${par[3]}${par[4]}$MASK$end"
echo -e "${par[1]}${par[2]}GATEWAY$end = ${par[3]}${par[4]}$GATEWAY$end"
echo -e "${par[1]}${par[2]}RAM_TOTAL$end = ${par[3]}${par[4]}$RAM_TOTAL$end"
echo -e "${par[1]}${par[2]}RAM_USED$end = ${par[3]}${par[4]}$RAM_USED$end"
echo -e "${par[1]}${par[2]}RAM_FREE$end = ${par[3]}${par[4]}$RAM_FREE$end"
echo -e "${par[1]}${par[2]}SPACE_ROOT$end = ${par[3]}${par[4]}$SPACE_ROOT$end"
echo -e "${par[1]}${par[2]}SPACE_ROOT_USED$end = ${par[3]}${par[4]}$SPACE_ROOT_USED$end"
echo -e "${par[1]}${par[2]}SPACE_ROOT_FREE$end = ${par[3]}${par[4]}$SPACE_ROOT_FREE$end"
echo " "

if [[ ${param[1]} == 1 ]] || [[ $BCAdef == 1 ]]; then
	echo "Column 1 background = default ${color[1]}"
else
	echo "Column 1 background = $BCA ${color[1]}"
fi

if [[ ${param[2]} == 1 ]] || [[ $FCAdef == 1 ]]; then
        echo "Column 1 font color = default ${color[2]}"
else
        echo "Column 1 font color = $FCA ${color[2]}"
fi

if [[ ${param[3]} == 1 ]] || [[ $BCBdef == 1 ]]; then
        echo "Column 2 background = default ${color[3]}"
else
        echo "Column 2 background = $BCB ${color[3]}"
fi

if [[ ${param[4]} == 1 ]] || [[ $FCBdef == 1 ]]; then
        echo "Column 2 font color = default ${color[4]}"
else
        echo "Column 2 font color = $FCB ${color[4]}"
fi
