#!/bin/sh
# xinit is currently unused since Xorg is started by LightDM display manager

# Load nVidia proprietary driver
#xrandr --setprovideroutputsource modesetting NVIDA-0
#xrandr --auto

# Dual screen setup
[[ -f $HOME/.config/X11/dualscreen ]] && . $HOME/.config/X11/dualscreen

# Locate Xresources file
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Locate Xprofile file
[[ -f ~/.xprofile ]] && . ~/.xprofile

# Start WM
exec xmonad
