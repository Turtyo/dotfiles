#!/usr/bin/env bash

# echo $@
for f in "$@"
	do
	# echo "checking for "$f""
	# echo $(file "$f")
	if [ -f "$f" ]; then
		# echo ""$f" is a file"
		xdg-open "$f" &
	elif [ -d "$f" ]; then
		# echo ""$f" is a directory"
		$FUNC/zsh/alias_open.sh "$f"/*
	else 
		echo ""$f" is not a file nor a directory, skipping"
	fi 
done
