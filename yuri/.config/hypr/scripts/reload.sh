#!/usr/bin/env bash

## Reload the configuration
hyprctl reload
makoctl reload
pkill -SIGUSR2 waybar
# systemctl --user restart foot-server
systemctl --user restart hypridle
systemctl --user restart vicinae

## Make scripts executable
chmod +x ~/.config/hypr/scripts/*

notify-send 'Reload' 'Configuration reloaded'
