#!/bin/bash -x

isHead=0
isTail=1
isHH=00
isTT=11
isHT=01
isTH=10

headCounter=0
tailCounter=0
hhCounter=0
ttCounter=0
htCounter=0
thCounter=0

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

for((i=1; i<=50; i++))
do
        firstCoin=$(($RANDOM%2))
        secondCoin=$(($RANDOM%2))
        doubletCombination=$firstCoin$secondCoin
        totalCombination=$i

        if [ $doubletCombination -eq $isHH ]
        then
                ((hhCounter++))
                hhCounter=$hhCounter
                result_dictonary["HH"]="$hhCounter"
        elif [ $doubletCombination -eq $isTT ]
        then
                ((ttCounter++))
                ttCounter=$ttCounter
                result_dictonary["TT"]="$ttCounter"
        elif [ $doubletCombination -eq $isHT ]
        then
                ((htCounter++))
                htCounter=$htCounter
                result_dictonary["HT"]="$htCounter"
        elif [ $doubletCombination -eq $isTH ]
        then
                ((thCounter++))
                thCounter=$thCounter
                result_dictonary["TH"]="$thCounter"
        fi
done

hhPercentage=`awk "BEGIN {print ($hhCounter / $totalCombination) * 100 }"`
hhPercentage=${hhPercentage%.*}

ttPercentage=`awk "BEGIN {print ($ttCounter / $totalCombination) * 100 }"`
ttPercentage=${ttPercentage%.*}

htPercentage=`awk "BEGIN {print ($htCounter / $totalCombination) * 100 }"`
htPercentage=${htPercentage%.*}

thPercentage=`awk "BEGIN {print ($thCounter / $totalCombination) * 100 }"`
thPercentage=${thPercentage%.*}

winningPercentage_dictonary["HH"]="$hhPercentage"
winningPercentage_dictonary["TT"]="$ttPercentage"
winningPercentage_dictonary["HT"]="$htPercentage"
winningPercentage_dictonary["TH"]="$thPercentage"

