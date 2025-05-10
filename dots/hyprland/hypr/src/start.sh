#!/usr/bin/env bash

swww init &
swww img ~/.nixconf/dots/wallpapers/wallpaper.png &

nm-applet --indicator &

waybar -c ~/.nixconf/dots/hyprland/waybar/config.jsonc -s ~/.nixconf/dots/hyprland/waybar/style.css &

swww img ~/.nixconf/dots/wallpapers/wallpaper.png &

dunst -conf "~/.nixconf/dots/hyprland/dunst/.dunstrc"
