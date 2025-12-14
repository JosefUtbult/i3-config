#!/bin/bash
# Fix ghost monitors
for o in $(xrandr | awk '/disconnected/{print $1}'); do
    xrandr --output "$o" --off
done

xrandr --output eDP-1 --auto
xrandr --output DP-3-3 --auto --above eDP-1

feh --bg-scale ~/.config/i3/misc/background.jpg
