#!/bin/bash

# Get wallpapers path
WALLPAPERS_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Set wallpaper
feh --bg-fill $WALLPAPERS_PATH/geometric-pattern-spiral-neon-gradient.png $WALLPAPERS_PATH/grid-black-background-neon-squares.png
