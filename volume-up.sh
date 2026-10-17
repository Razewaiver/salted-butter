#!/bin/sh

vol=$(pactl get-sink-volume @DEFAULT_SINK@ |
      head -n1 |
      grep -o '[0-9]\+%' |
      head -n1 |
      tr -d '%')

new=$((vol + 10))

[ "$new" -gt 100 ] && new=100

pactl set-sink-volume @DEFAULT_SINK@ "${new}%"
killall -SIGUSR1 i3status
