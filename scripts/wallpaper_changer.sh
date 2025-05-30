#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/" # Change if your directory is different
INTERVAL=600 # Change 600 to your desired interval in seconds (10 minutes)

while true; do
  # Find a random file in your Wallpapers directory
  WALLPAPER_PATH="$(find "$WALLPAPER_DIR" -type f -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.tiff" -o -iname "*.webp" -o -iname "*.heic"| shuf -n 1)"

  # Check if a file was found
  if [ -f "$WALLPAPER_PATH" ]; then
    echo "Setting wallpaper: $WALLPAPER_PATH"
    # Set the wallpaper using swaybg
    swaybg -i "$WALLPAPER_PATH"
  else
    echo "No wallpaper file found in $WALLPAPER_DIR or subdirectories."
  fi

  echo "Sleeping for $INTERVAL seconds..."
  # Wait for the specified interval
  sleep "$INTERVAL"

  echo "Waking up, changing wallpaper again..."
done
