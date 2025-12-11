#!/bin/bash
# Fix ghost monitors
for o in $(xrandr | awk '/disconnected/{print $1}'); do
    xrandr --output "$o" --off
done

xrandr --output eDP-1 --auto
