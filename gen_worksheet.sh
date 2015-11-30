#!/bin/bash

if [ $# -ne 2 ] || ! [[ $1 = +([[:digit:]]) ]] || ! [[ $2 = +([[:digit:]]) ]]; then
	exit 1;
fi

KEYS=$1
OPTIONS=$2

emit_keycode () {
	CODE=$1
	OPTIONAL=$2

	case $CODE in
		9) CODE="0"
			;;
		10) CODE="X"
			;;
		11) CODE="Y"
			;;
		12) CODE="Z"
			;;
		*) CODE=$((CODE + 1))
			;;
	esac

	if [ -z "$OPTIONAL" ]; then
		echo -n $CODE;
	else
		echo -n "["$CODE"]";
	fi
}

emit_tab () {
	local TABS=$1
	local i=0

	for ((; i < TABS; i = i + 1)); do
		echo -n "    ";
	done
}

emit_triangles () {
	local START=$1
	local TABS=$2
	local PREFIX=$3
	local REMOPTS=$4

	if [ $REMOPTS -eq 2 ]; then
		emit_tab $TABS
		echo -n $PREFIX $(emit_keycode $START)

		local i=$((START + 1));

		for ((; i < KEYS; i = i + 1)); do
			echo -n " "
			emit_keycode $i 1;
		done

		echo;

		return;
	fi

	local i=0;

	for ((; i < KEYS - START - 2; i = i + 1)); do
		emit_triangles $((i + START + 1)) $((TABS + i)) "$PREFIX$(emit_keycode $START) " $((REMOPTS - 1))
	done
}

SETS=$((KEYS - OPTIONS))

for ((set = 0; set <= SETS; set = set + 1)); do
	emit_triangles $set 0 "" $OPTIONS;
done
