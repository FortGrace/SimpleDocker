#!/bin/bash

topF=($top10F)
topFS=($top10FS)
topFT=($top10FT)

topEF=($top10EXE)
topEFS=($top10EXES)

echo "Total number of folders (including all nested ones) = $numberOfFolders"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$topFiveFolders"
echo "Total number of files = $totalNumFiles"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $numConf"
echo "Text files = $numTXT"
echo "Executable files = $numEXE"
echo "Log files (with the extension .log) = $numLOG"
echo "Archive files = $numRAR"
echo "Symbolic links = $numSYM"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
for (( i = 0; i < 10; i++)); do
    printf "%d - " "$((i + 1))"
    printf "${topF[$i]}, "
    printf "${topFS[$i]}, "
    printf "${topFT[$i]}\n"
done
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
for (( i = 0; i < 10; i++)); do
    printf "%d - " "$((i + 1))"
    printf "${topEF[$i]}, "
    printf "${topEFS[$1]}, "
    Fhash=$(sudo md5sum ${topEF[$i]} | awk '{print $1}')
    printf "$Fhash\n"
done
end=$(date +%s)
echo "Script execution time (in seconds) = $(($end-$begin))"
