#!/usr/bin/env bash 

setxkbmap fr &
nitrogen --restore &
xsetroot -cursor_name left_ptr
picom -f --experimental-backends --animations &
unclutter &
firefox &
fcitx5 &
