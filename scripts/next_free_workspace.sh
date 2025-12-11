#!/bin/bash

# Maximum number of workspaces to check
max_ws=20

# Get list of used workspace numbers
used_ws=$(i3-msg -t get_workspaces | jq '.[].num')

# Find first unused workspace
for i in $(seq 1 $max_ws); do
    if ! echo "$used_ws" | grep -q "$i"; then
        target_ws=$i
        break
    fi
done

# Fallback if all workspaces are used
target_ws=${target_ws:-$(($max_ws + 1))}

if [ "$1" == "move" ]; then
    # Move focused window to the next free workspace and switch to it
    i3-msg move container to workspace number "$target_ws"
    i3-msg workspace number "$target_ws"
else
    # Just switch to next free workspace
    i3-msg workspace number "$target_ws"
fi
