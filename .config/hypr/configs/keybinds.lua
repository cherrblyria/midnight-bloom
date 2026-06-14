---- CONFIG ----

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

hl.config({
  binds = {
    scroll_event_delay = 0
  }
})

---- HELPERS ----

local bind = hl.bind
local dsp = hl.dsp
local dispatch = hl.dispatch
local cmd = dsp.exec_cmd
local rcmd = dsp.exec_raw

local float = { float = true, size = { "(monitor_w*0.85)", "(monitor_h*0.8)" } }
local sfloat = { float = true, size = { "(monitor_w*0.75)", "(monitor_h*0.7)" } }

local MAX_ZOOM = 9
local MIN_ZOOM = 1
local ZOOM_TOGGLE_FACTOR = 1.5

---@param offset number
---@return nil
local function zoom(offset)
  local current = hl.get_config("cursor.zoom_factor")
  if offset ~= nil then
    current = current + offset
  elseif current ~= MIN_ZOOM then
    current = MIN_ZOOM
  else
    current = ZOOM_TOGGLE_FACTOR
  end
  current = math.max(MIN_ZOOM, math.min(MAX_ZOOM, current))
  hl.config({ cursor = { zoom_factor = current } })
end

---@param s string
local function esc(s)
  return s:gsub("'", "'\\''")
  -- ends the quote, adds literal ', reopens quote
  -- e.g.  it's  →  it'\''s
end

---- LAUNCHERS ----

bind("SUPER + Space", cmd("vicinae toggle"))
bind("SUPER + Return", cmd("kitty"))
bind("SUPER + E", cmd("kitty yazi"))
bind("SUPER + SHIFT + C", cmd("hyprpicker -aln"))
bind("SUPER + SHIFT + A", cmd("kitty pulsemixer", sfloat))
bind("SUPER + SHIFT + B", cmd("kitty bluetui", sfloat))
bind("CTRL + SHIFT + Escape", cmd("kitty btop", float))

---- SYSTEM ----

bind("SUPER + I", function()
  local title      = esc(hl.get_active_window().title)
  local class      = esc(hl.get_active_window().class)
  local initTitle  = esc(hl.get_active_window().initial_title)
  local initClass  = esc(hl.get_active_window().initial_class)
  local isXwayland = hl.get_active_window().xwayland

  dispatch(cmd(
    "notify-send 'Window' 'title: " .. title ..
    "\nclass: " .. class ..
    "\ninitTitle: " .. initTitle ..
    "\ninitClass: " .. initClass ..
    "\nisXwayland: " .. tostring(isXwayland) .. "'"
  ))
  dispatch(cmd("wl-copy '" .. class .. "'"))
end)

bind("ALT + Space", cmd("~/.config/hypr/scripts/kb_layout.sh"), { locked = true })
bind("SUPER + V", cmd("vicinae vicinae://launch/clipboard/history"))
bind("SUPER + SHIFT + W", cmd("vicinae vicinae://launch/@sovereign/store.vicinae.awww-switcher/wpgrid"))
bind("SUPER + ALT + W", cmd("vicinae vicinae://launch/@sovereign/store.vicinae.awww-switcher/wprandom"))

bind("SUPER + N", cmd("notify-send 'Notification' 'Hello, World!'"))
bind("SUPER + SHIFT + R", cmd("~/.config/hypr/scripts/reload.sh"))

bind("SUPER + ALT + L", cmd("hyprlock"))
bind("CTRL + ALT + Delete",
  cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

---- WINDOW CONTROL ----

bind("SUPER + Q", dsp.window.close())
bind("SUPER + F", dsp.window.float())
bind("SUPER + P", dsp.window.pseudo())
bind("SUPER + O", dsp.layout("togglesplit"))
bind("SUPER + C", dsp.window.center())
bind("SUPER + S", dsp.window.toggle_swallow())
bind("SUPER + T", dsp.window.pin())
bind("SUPER + SHIFT + F", dsp.window.fullscreen())

---- FOCUS MOVEMENT ----

bind("SUPER + H", dsp.focus({ direction = "left" }))
bind("SUPER + J", dsp.focus({ direction = "down" }))
bind("SUPER + K", dsp.focus({ direction = "up" }))
bind("SUPER + L", dsp.focus({ direction = "right" }))

bind("SUPER + left", dsp.focus({ direction = "left" }))
bind("SUPER + down", dsp.focus({ direction = "down" }))
bind("SUPER + up", dsp.focus({ direction = "up" }))
bind("SUPER + right", dsp.focus({ direction = "right" }))

---- WINDOW MOVEMENT ----

bind("SUPER + SHIFT + H", dsp.window.move({ direction = "left" }))
bind("SUPER + SHIFT + J", dsp.window.move({ direction = "down" }))
bind("SUPER + SHIFT + K", dsp.window.move({ direction = "up" }))
bind("SUPER + SHIFT + L", dsp.window.move({ direction = "right" }))

bind("SUPER + SHIFT + left", dsp.window.move({ direction = "left" }))
bind("SUPER + SHIFT + down", dsp.window.move({ direction = "down" }))
bind("SUPER + SHIFT + up", dsp.window.move({ direction = "up" }))
bind("SUPER + SHIFT + right", dsp.window.move({ direction = "right" }))

---- WINDOW RESIZE ----

bind("SUPER + CTRL + H", dsp.window.resize({ x = -25, y = 0, relative = true }), { repeating = true })
bind("SUPER + CTRL + J", dsp.window.resize({ x = 0, y = 25, relative = true }), { repeating = true })
bind("SUPER + CTRL + K", dsp.window.resize({ x = 0, y = -25, relative = true }), { repeating = true })
bind("SUPER + CTRL + L", dsp.window.resize({ x = 25, y = 0, relative = true }), { repeating = true })

bind("SUPER + CTRL + left", dsp.window.resize({ x = -25, y = 0, relative = true }), { repeating = true })
bind("SUPER + CTRL + down", dsp.window.resize({ x = 0, y = 25, relative = true }), { repeating = true })
bind("SUPER + CTRL + up", dsp.window.resize({ x = 0, y = -25, relative = true }), { repeating = true })
bind("SUPER + CTRL + right", dsp.window.resize({ x = 25, y = 0, relative = true }), { repeating = true })

---- WORKSPACES ----

for i = 1, 10 do
  local key = i % 10
  bind("SUPER + " .. key, dsp.focus({ workspace = i }))
  bind("SUPER + SHIFT + " .. key, dsp.window.move({ workspace = i }))
end

bind("SUPER + mouse_down", dsp.focus({ workspace = "e+1" }))
bind("SUPER + mouse_up", dsp.focus({ workspace = "e-1" }))

bind("SUPER + Tab", dsp.focus({ workspace = "e+1" }), { repeating = true })
bind("SUPER + SHIFT + Tab", dsp.focus({ workspace = "e-1" }), { repeating = true })

bind("SUPER + mouse:272", dsp.window.drag(), { mouse = true })
bind("SUPER + mouse:273", dsp.window.resize(), { mouse = true })

---- SCREENSHOTS ----

local screenshot_output = "~/Pictures/Screenshots/"

bind("Print", cmd("hyprshot -m output -m active -t 1000 -o " .. screenshot_output))
bind("ALT + Print", cmd("hyprshot -m window -m active -t 1000 -o " .. screenshot_output))
bind("SHIFT + Print", cmd("hyprshot -m region -t 1000 -o " .. screenshot_output))
bind("CTRL + Print", cmd("~/.config/hypr/scripts/record.sh"))

---- MEDIA CONTROLS ----

bind("SUPER + ALT + N", cmd("playerctl next"))
bind("SUPER + ALT + B", cmd("playerctl previous"))
bind("SUPER + ALT + P", cmd("playerctl play-pause"))

bind("XF86AudioNext", cmd("playerctl next"), { locked = true })
bind("XF86AudioPause", cmd("playerctl play-pause"), { locked = true })
bind("XF86AudioPlay", cmd("playerctl play-pause"), { locked = true })
bind("XF86AudioPrev", cmd("playerctl previous"), { locked = true })

---- HARDWARE KEYS ----

bind("XF86AudioRaiseVolume",
  cmd(
    "volume_int=$(wpctl get-volume @DEFAULT_SINK@ | awk '{printf \"%d\", $2 * 100}') && [ \"$volume_int\" -lt 100 ] && wpctl set-volume @DEFAULT_SINK@ 5%+ && volume=$(wpctl get-volume @DEFAULT_SINK@ | awk '{printf \"%d%%\\n\", $2 * 100}') && volume_int=$(wpctl get-volume @DEFAULT_SINK@ | awk '{printf \"%d\\n\", $2 * 100}') && $HOME/.config/hypr/scripts/osd.sh Volume \"$volume\" int \"$volume_int\""),
  { locked = true, repeating = true })
bind("XF86AudioLowerVolume",
  cmd(
    "wpctl set-volume @DEFAULT_SINK@ 5%- && volume=$(wpctl get-volume @DEFAULT_SINK@ | awk '{printf \"%d%%\\n\", $2 * 100}') && volume_int=$(wpctl get-volume @DEFAULT_SINK@ | awk '{printf \"%d\\n\", $2 * 100}') && $HOME/.config/hypr/scripts/osd.sh Volume \"$volume\" int \"$volume_int\""),
  { locked = true, repeating = true })
bind("XF86AudioMute", cmd("wpctl set-mute @DEFAULT_SINK@ toggle"),
  { locked = true, repeating = true })
bind("XF86AudioMicMute", cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })
bind("XF86MonBrightnessUp",
  cmd(
    "brightnessctl -n2 set 5%+ && brightness=$(brightnessctl -m | awk -F, '{printf \"%d%%\\n\", $4}') && brightness_int=$(brightnessctl -m | awk -F, '{printf \"%d\\n\", $4}') && $HOME/.config/hypr/scripts/osd.sh Brightness \"$brightness\" int \"$brightness_int\""),
  { locked = true, repeating = true })
bind("XF86MonBrightnessDown",
  cmd(
    "brightnessctl -n2 set 5%- && brightness=$(brightnessctl -m | awk -F, '{printf \"%d%%\\n\", $4}') && brightness_int=$(brightnessctl -m | awk -F, '{printf \"%d\\n\", $4}') && $HOME/.config/hypr/scripts/osd.sh Brightness \"$brightness\" int \"$brightness_int\""),
  { locked = true, repeating = true })

---- ZOOM ----

bind("SUPER + Z", zoom)
bind("SUPER + equal", function()
  zoom(0.5)
end, { repeating = true })
bind("SUPER + minus", function()
  zoom(-0.5)
end, { repeating = true })
bind("SUPER + CTRL + mouse_down", function()
  zoom(0.5)
end, { repeating = true })
bind("SUPER + CTRL + mouse_up", function()
  zoom(-0.5)
end, { repeating = true })
