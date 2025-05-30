#!/bin/bash

SCREENSHOT_FILE="/home/raghaveendrawork/Pictures/LockscreenScreenshots/Lockscreenshot.png"

WORKSPACE_NUM="$(./lockscreen_script.py)"

# Switch to the default 10th space
swaymsg "workspace number 10"

# Take a screenshot of the current shot
grim -o eDP-1 "$SCREENSHOT_FILE"
convert $SCREENSHOT_FILE -gaussian-blur 0x3 $SCREENSHOT_FILE

swaymsg "workspace prev"

swaymsg "workspace number $WORKSPACE_NUM"

swaylock --image $SCREENSHOT_FILE

