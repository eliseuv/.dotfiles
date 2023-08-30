#!/bin/sh
xrandr \
	--output DP-0 --mode 1920x1080 --pos 0x0 --rotate left \
	--output HDMI-0 --primary --mode 1920x1080 --rate 240 --pos 1080x0 --rotate normal \
	--output DP-4 --mode 2560x1080 --rate 75 --pos 3000x0 --rotate normal \
	--output DP-2 --off \
	--output DP-1 --off \
	--output DP-3 --off \
	--output DP-5 --off \
	--output USB-C-0 --off \
	--output None-1-1 --off
