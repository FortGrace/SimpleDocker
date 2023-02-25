#!/bin/bash
number="^[+-]?[0-9]+([.][0-9]+)?$"
if [ $# == 1 ];
then
    if [[ $1 =~ $number ]];
    then
    echo "Incorrect input: string expected"
    else
    echo $1
    fi
else
echo "Wrong parameters"
fi
