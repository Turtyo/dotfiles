#!/usr/bin/env bash

bspc query -N | awk "NR == $( xtitle $(bspc query -N) | grep -m 1 -n "^.*${1}.*$" | cut -d : -f 1 )"
