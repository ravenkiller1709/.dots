#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/scripts/bar_themes/onedark

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$black^ ^b#c4a774^  ^c$black^ ^b#EBC88B^ CPU"
  printf "  $cpu_val ^b$grey^ "
}

pkg_updates() {
  # updates=$(doas xbps-install -un | wc -l) # void
  updates=$(checkupdates | wc -l)   # arch
  # updates=$(aptitude search '~U' | wc -l)  # apt (ubuntu,debian etc)

  if [ -z "$updates" ]; then
    printf " ^c$black^ ^b#31A56B^ 󰊡 ^c$black^ ^b#7EC7A2^ Fully Updated"
  else
    printf " ^c$black^ ^b#31A56B^ 󰊡 ^c$black^ ^b#7EC7A2^ $updates"" updates"
  fi
}

battery() {
  n="$(cat /sys/class/power_supply/BAT1/capacity)"
  m="$(cat /sys/class/power_supply/BAT0/capacity)"
  sum="$(($n + $m))"
  get_capacity="$(($sum / 2))"
  echo "^c$blue^   $get_capacity%"
}

mail() {
  m="$(ls -l $HOME/Mail/kimkruse/INBOX/new | wc -l)"
  n="$(ls -l $HOME/Mail/Hotmail/INBOX/new | wc -l)"
  sum="$(($n + $m))"
  mail="$((sum - 2))"
  printf "^b$black^ ^c#b5bd68^   ^c#b5bd68^^b$black^ $mail nye beskeder "
}

brightness() {
  printf "^c$red^   "
  printf "^c$red^%.0f\n" $(cat /sys/class/backlight/*/brightness)
}

mem() {
  printf "^c$blue^^b$black^    "
  printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

mpd() {
  PREFIX_PLAY=' '
  PREFIX_PAUSE=' '
  current_song="$(mpc current)"

	if [[ "$current_song" = "" ]]; then
		echo " "
		exit 0
	else
		playpause=$(mpc | awk '/\[.*]/{split($0, a, " "); print a[1]}')
		if [[ "$playpause" = "[playing]" ]]; then
			current_song="$PREFIX_PLAY $current_song"
		elif [[ "$playpause" = "[paused]" ]]; then
			current_song="$PREFIX_PAUSE $current_song"
		fi
	fi

	echo "^c#866f8c^ $current_song ^b#1d1f21^"
}


network() {
hostname="${HOSTNAME:-${hostname:-$(hostname)}}"
wire="$(ip a | grep 'enp4s0' | grep inet | wc -l)"
wifi="$(ip a | grep wlp4s0 | grep inet | wc -l)"

if [ $wire = 1 ]; then 
    echo "^c$black^ ^b#964a50^  " "^c$black^ ^b#b55960^ $(ifconfig | grep inet | awk 'NR==1 {print $2}')"
elif [ $wifi = 1 ]; then
    echo "^c$black^ ^b#964a50^  ^c$black^ ^b#b55960^ $(ifconfig | grep inet | awk 'NR==3 {print $2}')"
else 
    echo "睊 "
fi
}


vpn() {
  state="$(ip a | grep tun0 | grep inet | wc -l)"
  if [ $state = 1 ]; then
    echo "^c$black^ ^b#b55960^  ^d^"
  else
    echo "^c$black^ ^b#b55960^ ^d^"
fi
}

clock() {
	printf "^c$black^ ^b$darkblue^   "
	printf "^c$black^^b$blue^ $(date '+%H:%M')"
}

volume() {
level="$(amixer | grep Left | awk 'NR==2 { print $5 }' | sed 's/[][]//g')"
echo "^b$blue^^c$black^  $level ^b$black^   "
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(mpd) $(battery) $(pkg_updates) $(mail) $(network) $(vpn) $(clock) $(volume)" 
done
