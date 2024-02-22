#!/usr/bin/env bash

name(){
for file in "$@";
do
	mv "$file" `echo "${file,}" | tr ' ' '_'` ;
done
}

name "$@"
