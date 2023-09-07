#!/bin/sh

#------------------------------------------------------------
# Select random wallpaper and create color scheme
# -----------------------------------------------------------
wal -q -i ~/.baggrunde/

#------------------------------------------------------------
# Load current pywal color scheme
#------------------------------------------------------------
source "$HOME/.cache/wal/colors.sh"

#------------------------------------------------------------
#Copy color file to waybar folder
#------------------------------------------------------------
cp ~/.cache/wal/colors-waybar.css ~/.dots/config/waybar/

#------------------------------------------------------------
# get wallpaper image name
#------------------------------------------------------------
newall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")

#------------------------------------------------------------
#Set the new wallpaper
#------------------------------------------------------------
swww img $wallpaper --transition-step 20 --transition-fps-20
~/.dots/config/waybar/reload.sh

#-----------------------------------------------------------
#Send notification
#-----------------------------------------------------------

notify-send "Theme and wallpaper updated" "with image $newall"

echo "DONE!"
