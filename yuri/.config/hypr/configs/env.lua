local env = hl.env

env("XDG_CURRENT_DESKTOP", "Hyprland")
env("XDG_SESSION_TYPE", "wayland")

env("QT_QPA_PLATFORMTHEME", "qt6ct")
env("QT_QPA_PLATFORM", "wayland")

env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
env("GDK_BACKEND", "wayland,x11,*")
env("MOZ_ENABLE_WAYLAND", "1")

env("XCURSOR_SIZE", "24")
env("XCURSOR_THEME", "Catppuccin Mocha Light")
env("HYPRCURSOR_SIZE", "24")
env("HYPRCURSOR_THEME", "Catppuccin Mocha Light")
