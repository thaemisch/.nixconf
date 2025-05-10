#!/bin/sh

cat "./mini.conf" "./common.conf" > "../devices/mini/hyprland.conf"
cat "./laptop.conf" "./common.conf" > "../devices/laptop/hyprland.conf"

cp "./start.sh" "../devices/mini/start.sh"
cp "./start.sh" "../devices/laptop/start.sh"
