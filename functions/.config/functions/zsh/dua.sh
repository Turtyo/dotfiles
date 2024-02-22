#!/usr/bin/env bash

dua() {
     if [[ -z "$1" ]]; then
         du -h --summarize *
     else
         du -h --summarize "$1"/*
     fi | sort --human-numeric-sort | while IFS=$'\t' read -r size line;
         do
         printf "%s\t%s" $size "$line";
         [[ -d $line ]] && printf "/";
         echo;
         done;
}

dua $@
