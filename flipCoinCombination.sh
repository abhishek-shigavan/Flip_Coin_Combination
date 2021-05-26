#!/bin/bash -x

isHead=0
isTail=1

coinSimulator=$(($RANDOM%2))

if [ $coinSimulator -eq $isHead ]
then
        echo " Head is the Winner "
else
        echo " Tail is the Winner "
fi

