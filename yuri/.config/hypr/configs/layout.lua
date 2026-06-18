---- LAYOUT ----

hl.config({
  dwindle = {
    force_split                  = 2,
    preserve_split               = true,
    smart_split                  = false,
    smart_resizing               = true,
    permanent_direction_override = false,
    special_scale_factor         = 1,
    split_width_multiplier       = 1.0,
    use_active_for_splits        = true,
    default_split_ratio          = 1.0,
    split_bias                   = 0,
    precise_mouse_move           = false,
  },
})

---- WINDOWS RULES ----

local rule = hl.window_rule

rule({
  name           = "suppress-maximize-events",
  match          = { class = ".*" },
  suppress_event = "maximize",
})

rule({
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
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
local function float(class, title)
  rule({
    match = { class = class, title = title },
    float = true,
    size = { "(monitor_w*0.75)", "(monitor_h*0.7)" },
    center = true
  })
end

workspace("brave-origin-nightly", 1)
workspace("obsidian", 8)
workspace("vesktop", 9)
workspace("spotify", 10)

float("footclient", "^ft(.*)$")
float("xdg-desktop-portal-gtk", "(.*)")
float("brave-origin-nightly", "^_crx_(.*)$")

---- LAYER RULES ----

local lrule = hl.layer_rule

---@param namespace string
local function lnoanim(namespace)
  lrule({
    match   = { namespace = namespace },
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
    match        = { namespace = namespace },
    blur         = true,
    blur_popups  = true,
    ignore_alpha = 0.5,
  })
end

lblur("rofi")
lblur("waybar")
lblur("vicinae")
lblur("notifications")

lanim("waybar", "slide top")
lanim("notifications", "slide")

lnoanim("awww-daemon")
lnoanim("selection")
lnoanim("hyprpicker")
