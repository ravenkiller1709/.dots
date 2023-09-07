#!/bin/bash
sudo virsh net-start default
sleep 10
virsh --connect qemu:///system start win11
sleep 30
xfreerdp -grab-keyboard /v:192.168.122.177 /u:kim /p:aFR8of55 /size:100% /d: /dynamic-resolution /gfx-h264:avc444 +gfx-progressive
