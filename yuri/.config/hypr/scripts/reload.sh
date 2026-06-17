#!/usr/bin/env bash

## Reload the configuration
hyprctl reload
makoctl reload
pkill -SIGUSR2 waybar
# systemctl --user restart foot-server
systemctl --user restart hypridle
systemctl --user restart vicinae

## Sync dotfiles
stow --adopt --no-folding -d $HOME/.dotfiles -t $HOME yuri

## Make scripts executable
chmod +x ~/.config/hypr/scripts/*
chmod +x ~/.local/bin/*

notify-send 'Reload' 'Configuration reloaded'
