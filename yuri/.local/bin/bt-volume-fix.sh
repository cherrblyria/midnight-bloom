#!/usr/bin/env bash

TARGET_NAME="thinkplus GM2 Pro"
TARGET_VOLUME="10%"

pactl subscribe | while read -r line; do
  if [[ "$line" == *"new"*"sink"* ]]; then
    sink=$(wpctl status | grep -i "$TARGET_NAME" | grep -oP '\d+(?=\.)')
    if [[ -n "$sink" ]]; then
      wpctl set-volume "$sink" "$TARGET_VOLUME"
    fi
  fi
done
