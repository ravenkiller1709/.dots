#!/bin/sh

function get_volume {
	VALUE=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/^Volume/ { print substr($5, 1, length($5)-1) }')

	if [ "$(pactl get-sink-mute @DEFAULT_SINK@)" = "Mute: yes" ]; then
		ICON="^c#cc6666^󰝟^c#c5c8c6^"
	else
		if [ $VALUE -lt 30 ]; then
			ICON="^c#cc6666^󰕿^c#c5c8c6^"
		else
			if [ $VALUE -lt 60 ]; then
				ICON="^c#cc6666^󰖀^c#c5c8c6^"
			else
				ICON="^c#cc6666^󰕾^c#c5c8c6^"
			fi
		fi
	fi

  if [ "$(pactl get-source-mute @DEFAULT_SOURCE@)" = "Mute: yes" ]; then
    MIC="^c#cc6666^󰍭^c#c5c8c6^ "
  else
    MIC=""
  fi

	echo "$MIC$ICON $VALUE%"
}

function get_brightness {
	echo "^c#8abeb7^  ^c#c5c8c6^ $(printf "%.0f\n" $(xbacklight))%"
}

function get_battery {
	CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)

	if [ $(cat /sys/class/power_supply/BAT0/status) = "Charging" ]; then
		ICON="^c#b5bd68^󰂄 ^c#c5c8c6^"
	else
		if [ $CAPACITY == 100 ]; then
			ICON="^c#b5bd68^󰁹 ^c#c5c8c6^"
		else if [ $CAPACITY -lt 10 ]; then
			ICON="^c#cc6666^󰂃 ^c#c5c8c6^"
		else
			ICON=$(printf "^c#b5bd68^\U000$(printf "%x"^c#c5c8c6^ $((0xf0079 + $CAPACITY / 10)))")
		fi fi
	fi

	echo "$ICON $CAPACITY%"
}

function get_mem {
  echo "^c#f0c674^󰘚 ^c#c5c8c6^$(free -h | awk '/^Mem:/ { print $3 "/" $2 }')"
}

function hard_set {
  echo "  $(get_brightness) $(get_volume) $(get_battery) $(get_mem)  " > /tmp/dwmstatus
	soft_set
}

function soft_set {
	xsetroot -name "$(cat /tmp/dwmstatus)$(date +'^c#81a2be^󰅐^c#c5c8c6^ %X ^c#b294bb^󰃭^c#c5c8c6^ %a %B %d, %Y') "
}

while [ $(ps -C dwm -ocmd | grep "dwm") != "" ]; do
	hard_set
	[ "$1" != "true" ] || break
	sleep 1

	for i in {1..9}
	do
        if [ $(ps -C dwm -ocmd | grep "dwm") != "" ]; then
            soft_set
            sleep 1
        else
            exit 0
        fi
	done
done

