#!/usr/bin/env bash

## Reload the configuration
hyprctl reload
makoctl reload
pkill -SIGUSR2 waybar
pkill -SIGUSR1 kitty
systemctl --user restart hypridle
systemctl --user restart vicinae

## Make scripts executable
chmod +x ~/.config/hypr/scripts/*

notify-send 'Reload' 'Configuration reloaded'
