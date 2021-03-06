#!/usr/bin/env bash

#xrandr --output DP-1-2-1 --off
#xrandr --output DP-1-2-1 --right-of eDP-1
#echo 400 | sudo tee /sys/class/backlight/intel_backlight/brightness

MONITORS=$(xrandr --current | grep connected | grep -v disconnected | cut -d' ' -f1)
echo "Connected displays:"
echo "${MONITORS}"

xrandr --auto

for MONITOR in ${MONITORS[@]}
do
  if [ "${MONITOR}" != "eDP-1" ]
  then
    xrandr --output ${MONITOR} --right-of ${PREVIOUS}
  fi
  PREVIOUS=${MONITOR}
done

# Restart compositing
killall picom
picom -b --experimental-backends

# Redraw background
feh --bg-fill /usr/share/backgrounds/Milky_Way_by_Paulo_José_Oliveira_Amaro.jpg

xset -dpms
xset s off
