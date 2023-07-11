#!/bin/sh
xset +fp /home/kim/.local/share/fonts &
xset fp rehash &
xrdb -load ~/.Xresources &
dunst &
setxkbmap dk &
pulseaudio &
dbus-run-session &
clipmenud &
dropbox &
emacs --daemon &
transmission-daemon &
nitrogen --restore &
mpDris2 &
#xwallpaper --zoom ~/.local/share/bg &
#setbg ~/.dots/.baggrunde &
xsetroot -cursor_name left_ptr &
/usr/lib/polkit-1/polkit-agent-helper-1 &
xfce4-power-manager &
redshift -l 55.49:12.6 &
ssh-agent &
xbacklight -set 90 &
xset r rate 200 50 &
#picom --config ~/.config/picom/config &
#mpd ~/.config/mpd/mpd.conf &
#~/.config/scripts/bar.sh &
#while type dwm >/dev/null; do dwm && continue || break; done
exec awesome
