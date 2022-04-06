#!/usr/bin/env bash

set -euo pipefail

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar || true

MONITORS=($(xrandr --current | grep connected | grep -v disconnected | cut -d' ' -f1))

# Launch bars
for OUT in ${MONITORS[@]}
do
    echo "---" | tee -a "/tmp/polybar_${OUT}.log"
    MONITOR=${OUT} polybar monitor --config=${HOME}/.config/polybar/config.ini 2>&1 | tee -a "/tmp/polybar_${OUT}.log" & disown
done

echo "Bars launched..."
