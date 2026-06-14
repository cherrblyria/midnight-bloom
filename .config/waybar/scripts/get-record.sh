#!/usr/bin/env bash

if pgrep -x "gpu-screen-reco" >/dev/null; then
  echo "REC"
else
  echo ""
fi
