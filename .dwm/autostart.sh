#!/bin/sh

xset +fp /home/kim/.local/share/fonts &
xset fp rehash &
xrdb -load ~/.Xresources &
picom -f &
dunst &
#pulseaudio &
setxkbmap dk &
dbus-run-session &
clipmenud &
dropbox &
transmission-daemon &
xsetroot -cursor_name left_ptr &
/usr/lib/polkit-1/polkit-agent-helper-1 &
redshift -l 55.49:12.6 &
#slstatus &
#dwmblocks &
