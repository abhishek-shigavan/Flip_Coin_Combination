#!/bin/bash -x

isHead=0
isTail=1
isHH=00
isTT=11
isHT=01
isTH=10
isHHH=000
isHHT=001
isHTH=010
isHTT=011
isTTT=111
isTTH=110
isTHT=101
isTHH=100

headCounter=0
tailCounter=0

hhCounter=0
ttCounter=0
htCounter=0
thCounter=0

hhhCounter=0
hhtCounter=0
hthCounter=0
httCounter=0
tttCounter=0
tthCounter=0
thtCounter=0
thhCounter=0

maxResult=0

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

for((i=1; i<=50; i++))
do
        firstCoin=$(($RANDOM%2))
        secondCoin=$(($RANDOM%2))
        thirdCoin=$(($RANDOM%2))
        tripletCombination=$firstCoin$secondCoin$thirdCoin
        totalComb=$i

        if [ $tripletCombination -eq $isHHH ]
        then
                ((hhhCounter++))
                hhhCounter=$hhhCounter
                result_dictonary["HHH"]="$hhhCounter"
        elif [ $tripletCombination -eq $isHHT ]
        then
                ((hhtCounter++))
                hhtCounter=$hhtCounter
                result_dictonary["HHT"]="$hhtCounter"
        elif [ $tripletCombination -eq $isHTH ]
        then
                ((hthCounter++))
                hthCounter=$hthCounter
                result_dictonary["HTH"]="$hthCounter"
        elif [ $tripletCombination -eq $isHTT ]
        then
                ((httCounter++))
                httCounter=$httCounter
                result_dictonary["HTT"]="$httCounter"
        elif [ $tripletCombination -eq $isTTT ]
        then
                ((tttCounter++))
                tttCounter=$tttCounter
                result_dictonary["TTT"]="$tttCounter"
        elif [ $tripletCombination -eq $isTTH ]
        then
                ((tthCounter++))
                tthCounter=$tthCounter
                result_dictonary["TTH"]="$tthCounter"
        elif [ $tripletCombination -eq $isTHT ]
        then
                ((thtCounter++))
                thtCounter=$thtCounter
                result_dictonary["THT"]="$thtCounter"
        elif [ $tripletCombination -eq $isTHH ]
        then
                ((thhCounter++))
                thhCounter=$thhCounter
                result_dictonary["THH"]="$thhCounter"

        fi
done

hhhPercentage=`awk "BEGIN {print ($hhhCounter / $totalComb) * 100 }"`
hhhPercentage=${hhhPercentage%.*}

hhtPercentage=`awk "BEGIN {print ($hhtCounter / $totalComb) * 100 }"`
hhtPercentage=${hhtPercentage%.*}

hthPercentage=`awk "BEGIN {print ($hthCounter / $totalComb) * 100 }"`
hthPercentage=${hthPercentage%.*}

httPercentage=`awk "BEGIN {print ($httCounter / $totalComb) * 100 }"`
httPercentage=${httPercentage%.*}

tttPercentage=`awk "BEGIN {print ($tttCounter / $totalComb) * 100 }"`
tttPercentage=${tttPercentage%.*}

tthPercentage=`awk "BEGIN {print ($tthCounter / $totalComb) * 100 }"`
tthPercentage=${tthPercentage%.*}

thtPercentage=`awk "BEGIN {print ($thtCounter / $totalComb) * 100 }"`
thtPercentage=${thtPercentage%.*}

thhPercentage=`awk "BEGIN {print ($thhCounter / $totalComb) * 100 }"`
thhPercentage=${thhPercentage%.*}


winningPercentage_dictonary["HHH"]="$hhhPercentage"
winningPercentage_dictonary["HHT"]="$hhtPercentage"
winningPercentage_dictonary["HTH"]="$hthPercentage"
winningPercentage_dictonary["HTT"]="$httPercentage"
winningPercentage_dictonary["TTT"]="$tttPercentage"
winningPercentage_dictonary["TTH"]="$tthPercentage"
winningPercentage_dictonary["THT"]="$thtPercentage"
winningPercentage_dictonary["THH"]="$thhPercentage"

for key in ${!winningPercentage_dictonary[@]}
do
        resultCount=${winningPercentage_dictonary[$key]}

        if [ $resultCount -ge $maxResult ]
        then
                maxResult=$resultCount
                maxKey=$key
                maxValue=${winningPercentage_dictonary[$key]}
        fi
done

echo " The Winning Combination is $maxKey with winning percentage $maxValue %  "
