# Midnight Bloom — dotfiles

## Quick start

```fish
stow --adopt --no-folding -d $HOME/.dotfiles -t $HOME yuri
# or: dotsync
```

## Key commands

| Command | What it does |
|---|---|
| `dotsync` | Re-deploy all configs (alias in `config.fish`) |
| `mb-reload` | Reload everything: `hyprctl reload`, `makoctl reload`, `pkill -SIGUSR2 waybar`, `hypridle`, re-stow, `chmod +x ~/.local/bin/*` |
| `dotadd ~/.config/app/file` | Move file into repo + relink via stow |
| `dotremove ~/.config/app/file` | Remove from repo + restore to `$HOME` |
| `dot` / `ldot` | `cd ~/.dotfiles` / open lazygit in dotfiles dir |
| `zedot` / `vdot` | Open dotfiles in Zed / Neovim |

`dotadd` and `dotremove` are fish functions at `yuri/.config/fish/functions/dot{add,remove}.fish`.

## Structure

```
yuri/                     # stow root — mirrors $HOME layout directly
  .config/
    hypr/                 # Hyprland (Lua — see below)
    fish/                 # Shell config, aliases, functions
    waybar/               # JSONC + CSS (SIGUSR2 to reload)
    nvim/                 # LazyVim (TUI editor)
    zed/                  # GUI editor config
    yazi/                 # File manager
    rofi/                 # Launcher (Catppuccin theme)
    opencode/             # Editor config + Catppuccin theme
    …
  .local/bin/             # Personal scripts (mb-*, assoc-app)
  .tmux.conf              # Prefix is C-s (not C-b)
assets/                   # README screenshots
chrome-extensions/        # Settings backups (Dark Reader, Stylus)
```

## Editing conventions

- **Hyprland** config is **Lua** (`hyprland.lua` → `configs/*.lua`). Apply with `hyprctl reload`.
- **Waybar** hot-reloads on `SIGUSR2` — `pkill -SIGUSR2 waybar`.
- **JSONC files** use `trailingComma: none` (set in `.prettierrc`; overrides Prettier default).
- **Lua LSP** configured via `.luarc.json` (requires `/usr/share/hypr/stubs`).
- **Personal scripts** must be executable — `mb-reload` runs `chmod +x` on `.local/bin/*`.
- **Neovim** uses LazyVim (`yuri/.config/nvim/`); `yuri/.config/nvim/init.lua` → `require("config.lazy")`.
- **Shell** is fish; helper functions include `y` (yazi + cd on exit), `yc`, `r`, `gray`.
- No build system, no tests, no CI — editing config files is the only work.
- Tmux prefix is `C-s` (set in `yuri/.tmux.conf:20`).

## Commit style

```
type(scope): description
```

Types: `feat`, `fix`, `refactor`, `style`, `tweak`/`tweaks`.  
Scope: app or area (e.g. `fish`, `hyprland`, `structure`).  
Lowercase description, no period.
