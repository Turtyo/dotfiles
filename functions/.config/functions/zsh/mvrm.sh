#!/usr/bin/env bash

mvrm(){
	mv "$1"/* "$2" && rmdir "$1"
}

mvrm $@
