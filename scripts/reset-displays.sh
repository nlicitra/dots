#!/bin/bash
intern=eDP-1
extern=DP-3

if xrandr | grep "$extern disconnected" > /dev/null 2>&1; then
  xrandr --output "$extern" --off --output "$intern" --auto
else
  xrandr --output "$extern" --primary --auto --output "$intern" --right-of "$extern" --auto
fi
