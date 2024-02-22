#!/usr/bin/env bash

# 1 : input

ffmpeg -i "$1" -vcodec libx265 -crf 28 output.mp4

# ffmpeg -i "$1" -vcodec lixbx264 -crf 20 output.mp4
# for videos that can be embedded on discord
