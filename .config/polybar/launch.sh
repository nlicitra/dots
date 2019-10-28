#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# For some reason UID is not set when running from i3 config exec
if [ -z "$UID" ]; then
  UID=$(id -u)
fi

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
# polybar -c ~/.config/polybar/config.ini main &
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload -c $HOME/.config/polybar/config.ini main &
  done
else
  polybar --reload -c $HOME/.config/polybar/config.ini main &
fi
