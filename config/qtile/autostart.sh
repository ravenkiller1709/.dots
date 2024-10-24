# My screen resolution
xset +fp /home/kim/.local/share/fonts &
xset fp rehash &
xrdb -merge ~/.Xresources
dropbox &
dbus-run-session &
clipmenud &
transmission-daemon &
mpDris2 &
emacs --daemon &
xsetroot -cursor_name left_ptr &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
xfce4-power-manager &
redshift -l 55.49:12.6 &
xbacklight -set 90 &
xset r rate 200 50 &

# For Virtual Machine 
# xrandr --outout Virtual-1 --mode 1920x1080

# Set keyboard mapping
setxkbmap dk
# setxkbmap en

# Load picom
picom &

# Load power manager
xfce4-power-manager &

# Load notification service
dunst &

swww-daemon &
# Launch polybar
# ~/dotfiles/polybar/launch.sh &

# Setup Wallpaper and update colors
~/.scripts/updatewal.sh &

# Load Windows 11 VM
# virsh --connect qemu:///system start win11
