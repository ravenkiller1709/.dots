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
    printf " ^c$black^ ^b#769c9b^ 󰊡 ^c$black^ ^b#8FBCBB^ Fully Updated"
  else
    printf " ^c$black^ ^b#769c9b^ 󰊡 ^c$black^ ^b#8FBCBB^ $updates"" updates"
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
  m="$(ls -l $HOME/.local/share/mail/kim@kimkruse.xyz/INBOX/new | wc -l)"
  n="$(ls -l $HOME/.local/share/mail/kimkruse@hotmail.com/INBOX/new | wc -l)"
  sum="$(($n + $m))"
  mail="$((sum - 2))"
  printf "^c$black^ ^b#8FBCBB^  $mail ^b#8FBCBB^ ^b$black^"
}

brightness() {
  printf "^c$red^   "
  printf "^c$red^%.0f\n" $(cat /sys/class/backlight/*/brightness)
}

mem() {
  printf "^c$blue^^b$black^  "
  printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

network() {
hostname="${HOSTNAME:-${hostname:-$(hostname)}}"
wire="$(ip a | grep 'enp4s0' | grep inet | wc -l)"
wifi="$(ip a | grep wlp4s0 | grep inet | wc -l)"

if [ $wire = 1 ]; then 
    echo "^c$black^ ^b#964a50^  " "^c$black^ ^b#b55960^ $(ifconfig | grep inet | awk 'NR==1 {print $2}')"
elif [ $wifi = 1 ]; then
    echo "^c$black^ ^b#b55960^  " "^c#b5bd68^$(ifconfig | grep inet | awk 'NR==3 {print $2}')"
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
	printf "^c$black^ ^b$darkblue^  "
	printf "^c$black^^b$blue^ $(date '+%H:%M')"
}

volume() {
level="$(amixer get Master | egrep -o '[0-9]{1,3}%')"
echo "^b$blue^^c$black^  $level  "
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(pkg_updates) $(mail) $(cpu) $(mem) $(network) $(vpn) $(clock) $(volume)" 
done
