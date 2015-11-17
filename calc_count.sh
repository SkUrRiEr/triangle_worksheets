#!/bin/bash

if [ $# -ne 2 ] || ! [[ $1 = +([[:digit:]]) ]] || ! [[ $2 = +([[:digit:]]) ]]; then
	echo 0;

	exit 0;
fi

if [ $1 -gt $2 ]; then
	TOTAL=$1
	COUNT=$2
else
	TOTAL=$2
	COUNT=$1
fi

DIFF=$((TOTAL-COUNT))

if [ $COUNT -lt $DIFF ]; then
	FLIMIT=$DIFF
	SLIMIT=$COUNT
else
	FLIMIT=$COUNT
	SLIMIT=$DIFF
fi

ACCUM=1

for ((i = TOTAL; i > FLIMIT; i = i - 1)); do
	ACCUM=$((ACCUM * i))
done

for ((i = 2; i <= SLIMIT; i = i + 1)); do
	ACCUM=$((ACCUM / i))
done

echo $ACCUM
