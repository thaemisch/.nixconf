#!/usr/bin/env bash

nm-applet --indicator &
kdeconnectd &
kdeconnect-indicator &
qs -c caelestia &
fish -c '/home/tim/.local/bin/caelestia wallpaper -f (readlink /home/tim/.local/state/caelestia/wallpaper/current)'
