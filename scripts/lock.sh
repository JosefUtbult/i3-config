#!/bin/bash

# Temporary screenshot file
tmpbg=$(mktemp /tmp/XXX.png)
rm $tmpbg

# Take a screenshot of the current screen
scrot $tmpbg

# Blur and darken the screenshot
magick convert $tmpbg -blur 0x8 -fill 'rgba(0,0,0,0.4)' -colorize 40% $tmpbg

# Lock screen using blurred screenshot
i3lock -i $tmpbg
