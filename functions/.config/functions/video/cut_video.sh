#!/usr/bin/env bash

# 1 : input
# 2 : start (hh:mm:ss)
# 3 : end (hh:mm:ss)
ffmpeg -i "$1" -ss "$2" -to "$3" -c copy output.mp4
