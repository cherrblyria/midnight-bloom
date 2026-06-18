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

## Reload everything

```fish
mb-reload
```

Covers: `hyprctl reload`, `makoctl reload`, waybar `SIGUSR2`, `hypridle`, re-runs `stow --adopt` to sync changes back, and `chmod +x` on `~/.local/bin/*`.

## Structure

```
yuri/                     # stow root — mirrors $HOME layout directly
  .config/                # per-app configs
    hypr/                 # Hyprland compositor config (Lua-driven)
    fish/                 # Shell config, aliases, helper functions
    waybar/               # Status bar (JSONC + CSS)
    yazi/                 # File manager
    opencode/             # OpenCode editor config
    ...
  .local/bin/             # Personal scripts (mb-*, assoc-app)
```

## Key configs

| Purpose | Path |
|---|---|
| Shell aliases, env, PATH | `yuri/.config/fish/config.fish` |
| Helper functions (dotadd, dotremove, y, yc, r, gray) | `yuri/.config/fish/functions/` |
| Hyprland entrypoint | `yuri/.config/hypr/hyprland.lua` (loads `configs/*.lua`) |
| Color variables (Catppuccin Mocha) | `yuri/.config/hypr/themes/catppuccin-mocha.lua` |
| Hyprlock, Hypridle | `yuri/.config/hypr/hyprlock.conf`, `hypridle.conf` |
| Lua LSP stubs | `.luarc.json` (points to `/usr/share/hypr/stubs`) |
| Reload script | `yuri/.local/bin/mb-reload` |
| Waybar | `yuri/.config/waybar/config.jsonc` + `style.css` |
| Personal scripts | `.local/bin/` — `mb-*` (reload, record, wallpaper, brightness, volume, kblayout, osd), `assoc-app` |
| OpenCode theme | `yuri/.config/opencode/themes/catppuccin-mocha-pink.json` |

## Editing conventions

- **Hyprland** config is **Lua** (`hyprland.lua` → `configs/*.lua`). Apply changes with `hyprctl reload`.
- **Waybar** hot-reloads on `SIGUSR2` (not SIGHUP) — `pkill -SIGUSR2 waybar`.
- **JSONC files** use `trailingComma: none` (set in `.prettierrc`; overrides default Prettier JSONC parser which adds trailing commas).
- **Lua LSP** is configured via `.luarc.json` (requires `/usr/share/hypr/stubs` for Hyprland API types).
- **Personal scripts** must be executable — `mb-reload` runs `chmod +x` on `.local/bin/*`.
- No build system, no tests, no CI — editing configs is the only work.

## Commit style

```
type(scope): description
```

Types: `feat`, `fix`, `refactor`, `style`, `tweak`/`tweaks`.  
Scope is the app or area (e.g. `fish`, `hyprland`, `structure`).  
Keep the description lowercase, no period.
