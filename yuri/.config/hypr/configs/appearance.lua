local colors = require('themes.catppuccin-mocha')

hl.config({
  general = {
    gaps_in          = 3,
    gaps_out         = 6,
    border_size      = 1,

    col              = {
      active_border   = colors.surface0,
      inactive_border = colors.base,
    },

    snap             = {
      enabled = true,
    },

    resize_on_border = false,
    allow_tearing    = false,
    layout           = "dwindle",
  },

  decoration = {
    rounding         = 0,
    rounding_power   = 0,

    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow           = {
      enabled      = false,
      range        = 4,
      render_power = 3,
      color        = 0xee1a1a1a,
    },

    blur             = {
      enabled = false,
      size = 8,
      passes = 2,
      popups = true,
      popups_ignorealpha = 0.2,
      ignore_opacity = true,
    },
  },

  cursor = {
    inactive_timeout = 5,
    hide_on_key_press = true,
    zoom_detached_camera = false,
  },

  animations = { enabled = true },
})
