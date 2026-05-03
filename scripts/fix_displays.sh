#!/bin/bash
# Fix ghost monitors
for o in $(xrandr | awk '/disconnected/{print $1}'); do
    xrandr --output "$o" --off
done

xrandr --output eDP-1 --auto

# Main display
xrandr --output DP-3-3 --auto --above eDP-1

# Left display
xrandr --output DP-3-1 --rotate left --auto --left-of DP-3-3

feh --bg-center ~/.config/i3/misc/background.jpg
