#!/usr/bin/env bash

# 1 : input
ffmpeg -i "$1" -c:a copy -c:v copy "$1".mkv
