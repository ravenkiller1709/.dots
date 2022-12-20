#!/bin/sh

xrdb merge ~/.Xresources 
xbacklight -set 10 &
feh --bg-fill ~/.baggrunde/nordtheme0.jpg &
xset r rate 200 50 &
picom &

~/.config/scripts/bar.sh &
while type dwm >/dev/null; do dwm && continue || break; done
