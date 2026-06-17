---- CONFIG ----

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

hl.config({
  binds = {
    scroll_event_delay = 0,
    workspace_back_and_forth = true,
  }
})

---- HELPERS ----

local bind = hl.bind
local dsp = hl.dsp
local dispatch = hl.dispatch
local cmd = dsp.exec_cmd
local rcmd = dsp.exec_raw

local float = { float = true, size = { "(monitor_w*0.75)", "(monitor_h*0.7)" } }

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
bind("SUPER + Return", cmd("footclient"))
bind("SUPER + E", cmd("footclient yazi"))
bind("SUPER + SHIFT + C", cmd("hyprpicker -aln"))
bind("SUPER + SHIFT + A", cmd("footclient --title ft-pulsemixer pulsemixer"))
bind("SUPER + SHIFT + B", cmd("footclient --title ft-bluetui bluetui"))
bind("CTRL + SHIFT + Escape", cmd("footclient --title ft-btop btop"))

bind("SUPER + V", cmd("vicinae vicinae://launch/clipboard/history"))
bind("SUPER + Period", cmd("vicinae vicinae://launch/core/search-emojis"))
bind("SUPER + W", cmd("vicinae vicinae://launch/@sovereign/store.vicinae.awww-switcher/wpgrid"))
bind("SUPER + ALT + W", cmd("vicinae vicinae://launch/@sovereign/store.vicinae.awww-switcher/wprandom"))
bind("SUPER + SHIFT + W",
  cmd(
    "wall_path=$(readlink -f \"$HOME/.config/background\") && stripped=$(basename \"$wall_path\") && notify-send 'Wallpaper' \"$stripped\""
  )
)

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

bind("SUPER + N", cmd("notify-send 'Notification' 'Hello, World!'"))
bind("SUPER + SHIFT + R", cmd("mb-reload"), { locked = true })

bind("ALT + Space", cmd("mb-kblayout"), { locked = true })
bind("SUPER + SHIFT + P", cmd("sleep 0.2 && hyprctl dispatch 'hl.dsp.dpms({ action = \"disable\" })'"), { locked = true })
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
bind("CTRL + Print", cmd("mb-record"))

---- MEDIA CONTROLS ----

bind("SUPER + ALT + N", cmd("playerctl next"), { locked = true })
bind("SUPER + ALT + B", cmd("playerctl previous"), { locked = true })
bind("SUPER + ALT + P", cmd("playerctl play-pause"), { locked = true })

bind("XF86AudioNext", cmd("playerctl next"), { locked = true })
bind("XF86AudioPause", cmd("playerctl play-pause"), { locked = true })
bind("XF86AudioPlay", cmd("playerctl play-pause"), { locked = true })
bind("XF86AudioPrev", cmd("playerctl previous"), { locked = true })

---- HARDWARE KEYS ----

bind("XF86AudioRaiseVolume", cmd("mb-vol raise"), { locked = true, repeating = true })
bind("XF86AudioLowerVolume", cmd("mb-vol lower"), { locked = true, repeating = true })
bind("SHIFT + XF86AudioRaiseVolume", cmd("mb-vol raise-fine"), { locked = true, repeating = true })
bind("SHIFT + XF86AudioLowerVolume", cmd("mb-vol lower-fine"), { locked = true, repeating = true })
bind("XF86AudioMute", cmd("mb-vol mute"), { locked = true, repeating = true })
bind("XF86AudioMicMute", cmd("mb-vol mic-mute"), { locked = true, repeating = true })

bind("XF86MonBrightnessUp", cmd("mb-bright raise"), { locked = true, repeating = true })
bind("XF86MonBrightnessDown", cmd("mb-bright lower"), { locked = true, repeating = true })

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
end)
bind("SUPER + CTRL + mouse_up", function()
  zoom(-0.5)
end)
