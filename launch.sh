#!/usr/bin/env bash

set -euo pipefail

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar || true

# Launch bar1
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar laptop --config=${HOME}/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar1.log & disown
polybar monitor --config=${HOME}/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
