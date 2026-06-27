---- WINDOWS RULES ----

local rule = hl.window_rule

rule({
  name = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

rule({
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },

  no_focus = true,
})

rule({
  name = "quick terminal",
  match = { class = "footclient", title = "quickterminal" },
  float = true,
  size = { "(monitor_w*0.5)", "(monitor_h*0.2)" },
  move = { "(monitor_w*0.25)", 0 },
})

---@param class string
---@param workspace number
local function workspace(class, workspace)
  rule({
    match = { class = class },
    workspace = workspace,
  })
end

---@param class string
---@param title string
local function float(class, title, size)
  rule({
    match = { class = class, title = title },
    float = true,
    size = { "(monitor_w*0.75)", "(monitor_h*0.7)" },
    center = true,
  })
end

---@param class string
---@param title string
local function rfloat(class, title, size)
  rule({
    match = { class = class, title = title },
    float = true,
    center = true,
  })
end

workspace("(?i)brave(.*)", 1)
workspace("(?i)obsidian", 8)
workspace("(?i)vesktop", 9)
workspace("(?i)spotify", 10)
workspace("(?i)(.*)youtube_music$", 10)

float("footclient", "^ft(.*)$")
float("xdg-desktop-portal-gtk", "(.*)")
float("(?i)brave(.*)", "^_crx_(.*)$")

rfloat("(?i)thunar", "(?i)Rename(.*)")
rfloat("(?i)thunar", "(?i)(.*)Properties")
rfloat("(?i)thunar", "(?i)File Operation Progress")

---- LAYER RULES ----

local lrule = hl.layer_rule

---@param namespace string
local function lnoanim(namespace)
  lrule({
    match = { namespace = namespace },
    no_anim = true,
  })
end

---@param namespace string
---@param animation string
local function lanim(namespace, animation)
  lrule({
    match = { namespace = namespace },
    animation = animation,
  })
end

---@param namespace string
local function lblur(namespace)
  lrule({
    match = { namespace = namespace },
    blur = true,
    blur_popups = true,
  })
end

lblur("rofi")
lblur("wlogout")
lblur("logout_dialog")
lblur("waybar")
lblur("vicinae")
lblur("notifications")

lanim("waybar", "slide top")
lanim("notifications", "slide")

lnoanim("awww-daemon")
lnoanim("selection")
lnoanim("hyprpicker")
