#!/usr/bin/env bash

# 1 : file list
# 2 : pattern match
# 3 : replacement for the match

rename(){
	for f in "$3"; do mv "$f" "$(echo "$f" | sed s/"$2"/"$3"/)"; done
}

rename $@
