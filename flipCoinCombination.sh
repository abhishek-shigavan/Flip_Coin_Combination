#!/bin/bash -x

isHead=0
isTail=1

headCounter=0
tailCounter=0

declare -A result_dictonary

declare -A winningPercentage_dictonary

for((i=1; i<=50; i++))
do

        coinSimulator=$(($RANDOM%2))
        totalCount=$i

        if [ $coinSimulator -eq $isHead ]
        then
                ((headCounter++))
                headCounter=$headCounter
                result_dictonary["Head"]="$headCounter"
        else
                ((tailCounter++))
                tailCounter=$tailCounter
                result_dictonary["Tail"]="$tailCounter"
        fi
done

headPercentage=`awk "BEGIN {print ($headCounter / $totalCount) * 100 }"`
headPercentage=${headPercentage%.*}

tailPercentage=`awk "BEGIN {print ($tailCounter / $totalCount) * 100 }"`
tailPercentage=${tailPercentage%.*}

winningPercentage_dictonary["Head"]="$headPercentage"
winningPercentage_dictonary["Tail"]="$tailPercentage"

