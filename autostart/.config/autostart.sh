#!/usr/bin/env bash 

setxkbmap fr &
nitrogen --restore &
xsetroot -cursor_name left_ptr
picom -experimental-backends --animations &
unclutter &
firefox &
fcitx5 &
