#!/bin/sh
xset +fp /home/kim/.local/share/fonts &
xset fp rehash &
xrdb -merge ~/.Xresources &
dunst &
setxkbmap dk &
dropbox &
dbus-run-session &
clipmenud &
transmission-daemon &
mpDris2 &
#xwallpaper --zoom ~/.baggrunde/Imgur.png &
feh --bg-scale ~/.baggrunde/0147.jpg &
#nitrogen --restore &
emacs --daemon &
#setbg ~/.dots/.baggrunde &
xsetroot -cursor_name left_ptr &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
xfce4-power-manager &
redshift -l 55.49:12.6 &
#ssh-agent &
xbacklight -set 90 &
xset r rate 200 50 &
picom -f &
#picom --config ~/.config/picom/config &
#mpd ~/.config/mpd/mpd.conf &
#~/.config/scripts/bar.sh &
#while type dwm >/dev/null; do dwm && continue || break; done
qtile start
