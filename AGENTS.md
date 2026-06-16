# Midnight Bloom — dotfiles

## Quick start

```fish
# Deploy all configs to $HOME (idempotent, safe to run repeatedly):
stow --adopt --no-folding -d $HOME/.dotfiles -t $HOME yuri

# Or use the alias (defined in fish/config.fish):
dotsync
```

## Adding / removing tracked files

Run from anywhere:

```fish
dotadd ~/.config/app/config.conf    # move file into repo + relink via stow
dotremove ~/.config/app/config.conf  # remove from repo + restore to $HOME
```

Both are fish functions at `yuri/.config/fish/functions/dot{add,remove}.fish`.

## Structure

```
yuri/                     # stow root — mirrors $HOME layout directly
  .config/                # per-app configs
    hypr/                 # Hyprland compositor config (Lua-driven)
    fish/                 # Shell config, aliases, helper functions
    waybar/               # Status bar
    yazi/                 # File manager
    opencode/             # OpenCode editor config
    ...
  .local/bin/             # Personal scripts (on PATH via config.fish)
```

## Environment

- **OS:** Arch Linux
- **Shell:** Fish (config.fish defines all aliases and abbreviations)
- **Compositor:** Hyprland (config is Lua: `hyprland.lua` → `configs/*.lua`)
- **Theme:** Catppuccin Mocha (Pink accent)
- **Package manager:** paru (aliased from pamac/yay)

## Key configs

| Purpose | Path |
|---|---|
| Shell aliases, env, PATH | `yuri/.config/fish/config.fish` |
| Helper functions (dotadd, dotremove, y, yc, r, gray) | `yuri/.config/fish/functions/` |
| Hyprland entrypoint | `yuri/.config/hypr/hyprland.lua` (loads `configs/*.lua`) |
| Color variables (Catppuccin Mocha) | `yuri/.config/hypr/themes/catppuccin-mocha.lua` |
| Hyprlock, Hypridle | `yuri/.config/hypr/hyprlock.conf`, `hypridle.conf` |
| Hypr reload script | `yuri/.config/hypr/scripts/reload.sh` |
| Waybar | `yuri/.config/waybar/config.jsonc` + `style.css` |
| OpenCode theme | `yuri/.config/opencode/themes/catppuccin-mocha-pink.json` |

## Notable aliases (from config.fish)

```
dot        → cd $HOME/.dotfiles
dotsync    → stow --adopt --no-folding -d $HOME/.dotfiles -t $HOME yuri
oc         → opencode
zeddot     → zed $HOME/.dotfiles
lg         → lazygit
ff         → fastfetch
```

## Editing conventions

- Hyprland config is Lua. Use `hyprctl reload` to apply changes.
- Waybar hot-reloads on `SIGUSR2` (see `reload.sh`).
- JSONC files use `trailingComma: none` (set in `.prettierrc`).
- No build system, no tests, no CI — editing configs is the only work.

## Commit style

```
type(scope): description
```

Types: `feat`, `fix`, `refactor`, `style`, `tweak`/`tweaks`.  
Scope is the app or area (e.g. `fish`, `hyprland`, `structure`).  
Keep the description lowercase, no period.
