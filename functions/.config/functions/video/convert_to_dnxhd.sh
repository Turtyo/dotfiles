#!/usr/bin/env bash

ffmpeg -i "$1" -c:v dnxhd -vf "scale=1280:720,fps=30000/1001,format=yuv422p" -b:v 110M -c:a pcm_s16le "$1".mov
