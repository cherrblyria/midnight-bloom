hl.on("hyprland.start", function()
  hl.exec_cmd("uwsm app -- awww-daemon")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("systemctl --user start vicinae")

  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")

  hl.exec_cmd("hyprctl setcursor 'Catppuccin Mocha Light' 24")
end)
