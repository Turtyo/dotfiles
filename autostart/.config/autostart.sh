#!/usr/bin/env bash 

setxkbmap fr &
nitrogen --restore & >> /tmp/restore.log
xsetroot -cursor_name left_ptr
picom -f -D 5 -b
unclutter &
fcitx5 &
