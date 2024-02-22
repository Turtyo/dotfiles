#!/usr/bin/env bash

picomConfig="$1"

delta="$2"
winid=$(xdotool getactivewindow)
winclass=$(xprop -id "$winid" | grep WM_CLASS | cut -d '"' -f 4)

head='  "'
tail=":class_g = '${winclass}'\","

function newNumber(){
	echo $(grep -E "^.*\"([0-9]+)${tail}$" $picomConfig | awk 'BEGIN{FS="[\":]";}{ print $2 }')
}

function generateNewLine(){
	number=$(newNumber)
	echo "${head}$((${number} + ${delta}))${tail}"	
}

function replaceLine(){
	newLine=$(generateNewLine)
	sed -i -E "s/^.*${tail}$/${newLine}/" ${picomConfig}
}

replaceLine
