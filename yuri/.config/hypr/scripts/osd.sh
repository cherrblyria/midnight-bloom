#!/usr/bin/env bash

case $3 in
  int)
    notify-send -a osd -h "int:value:$4" -h "string:x-canonical-private-synchronous:osd" "$1" "$2"
    ;;
  *)
    notify-send -a osd -h "string:x-canonical-private-synchronous:osd" "$1" "$2"
    ;;
esac
