#!/bin/bash

set -e

echo "Copying se_keymap to /usr/share/X11/xkb/symbols/..."
sudo cp ./se_keymap /usr/share/X11/xkb/symbols/

echo "Testing keymap syntax..."
if ! xkbcomp -w 0 /usr/share/X11/xkb/symbols/se_keymap /dev/null; then
    echo "Something went wrong compiling keymap. Exiting."
    exit 1
fi

echo "Reloading Hyprland..."
hyprctl reload

echo "Keymap setup complete! Dont forget to edit your hyprland input configuration if you haven't already"
exit 0
