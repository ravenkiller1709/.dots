#!/bin/sh
xset +fp /home/kim/.local/share/fonts &
xset fp rehash &
xrdb -load ~/.Xresources &
picom -f &
dunst &
pulseaudio &
setxkbmap dk &
dbus-run-session &
clipmenud &
dropbox &
transmission-daemon &
#xwallpaper --zoom ~/.local/share/bg &
#setbg ~/.dots/.baggrunde &
xsetroot -cursor_name left_ptr &
/usr/lib/polkit-1/polkit-agent-helper-1 &
xfce4-power-manager &
redshift -l 55.49:12.6 &
ssh-agent &
xbacklight -set 90 &
xset r rate 200 50 &
wal -R
picom &
~/.config/scripts/bar.sh &
while type dwm >/dev/null; do dwm && continue || break; done

