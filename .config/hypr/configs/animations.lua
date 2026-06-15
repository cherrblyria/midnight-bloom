--[[

global
  ↳ windows - styles: slide, popin, gnomed
    ↳ windowsIn - window open - styles: same as windows
    ↳ windowsOut - window close - styles: same as windows
    ↳ windowsMove - everything in between, moving, dragging, resizing.
  ↳ layers - styles: slide, popin, fade
    ↳ layersIn - layer open
    ↳ layersOut - layer close
  ↳ fade
    ↳ fadeIn - fade in for window open
    ↳ fadeOut - fade out for window close
    ↳ fadeSwitch - fade on changing activewindow and its opacity
    ↳ fadeShadow - fade on changing activewindow for shadows
    ↳ fadeDim - the easing of the dimming of inactive windows
    ↳ fadeLayers - for controlling fade on layers
      ↳ fadeLayersIn - fade in for layer open
      ↳ fadeLayersOut - fade out for layer close
    ↳ fadePopups - for controlling fade on wayland popups
      ↳ fadePopupsIn - fade in for wayland popup open
      ↳ fadePopupsOut - fade out for wayland popup close
    ↳ fadeDpms - for controlling fade when dpms is toggled
  ↳ border - for animating the border's color switch speed
  ↳ borderangle - for animating the border's gradient angle - styles: once (default), loop
  ↳ workspaces - styles: slide, slidevert, fade, slidefade, slidefadevert
    ↳ workspacesIn - styles: same as workspaces
    ↳ workspacesOut - styles: same as workspaces
    ↳ specialWorkspace - styles: same as workspaces
      ↳ specialWorkspaceIn - styles: same as workspaces
      ↳ specialWorkspaceOut - styles: same as workspaces
  ↳ zoomFactor - animates the screen zoom
  ↳ monitorAdded - monitor added zoom animation

Example usage:

hl.animation({ leaf = "workspaces", enabled = true, speed = 8, bezier = "my_epic_bezier" })
hl.animation({ leaf = "windows", enabled = true, speed = 10, spring = "my_epic_spring", style = "slide"})
hl.animation({ leaf = "fade", enabled = 0 })

hl.curve( NAME, { type = "bezier", points = { {X0, Y0}, {X1, Y1} } })

hl.curve( NAME, { type = "spring", mass = MASS, stiffness = STIFF, dampening = DAMP })

]]

---@param name string
---@param points table
local function bezier(name, points)
  hl.curve(name, { type = "bezier", points = points })
end

---@param name string
---@param mass number
---@param stiffness number
---@param dampening number
local function spring(name, mass, stiffness, dampening)
  hl.curve(name, { type = "spring", mass = mass, stiffness = stiffness, dampening = dampening })
end

---@param leaf string
---@param enabled boolean
---@param speed number
---@param type string
---@param bezier? string
---@param spring? string
---@param style? string
local function anim(leaf, enabled, speed, type, bezier, spring, style)
  if type == "bezier" then
    hl.animation({ leaf = leaf, enabled = enabled, speed = speed, bezier = bezier, style = style })
  elseif type == "spring" then
    hl.animation({ leaf = leaf, enabled = enabled, speed = speed, spring = spring, style = style })
  end
end

bezier("some", { { 0.1, 0.8 }, { 0.1, 1.0 } })
spring("overshoot", 1, 40, 9)
spring("smoothshoot", 1, 25, 8)
spring("smooth", 1, 70, 15)
spring("smoother", 1, 25, 10)

anim("global", true, 5, "spring", nil, "smooth")
anim("workspaces", true, 5, "spring", nil, "smoothshoot")
anim("windows", true, 5, "spring", nil, "smoothshoot", "slide")
anim("windowsOut", true, 5, "spring", nil, "smoothshoot", "popin 40%")
anim("layers", true, 5, "spring", nil, "smooth", "popin 60%")
anim("layersOut", true, 5, "spring", nil, "smooth", "popin 40%")
anim("fade", true, 5, "spring", nil, "smoother")
anim("zoomFactor", true, 5, "spring", nil, "smoother")
anim("monitorAdded", true, 5, "spring", nil, "smoother")
