#!/bin/bash

read -p "Do you want to save data into file? (Y/N): " answer

if [ "$answer" == "Y" ] || [ "$answer" == "y" ];
then
    name="$(date +"%d_%m_%y_%H_%M_%S").status"
    ./print.sh > $name
fi
