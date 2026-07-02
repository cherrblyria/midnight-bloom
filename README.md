<div align=center>
  <h2>𓄼 ╱ ，× 𝐌𝐢𝐝𝐧𝐢𝐠𝐡𝐭 𝐁𝐥𝐨𝐨𝐦  ˟ ˚☾ ⌁</h2>
  
  <h3>“Cozy Vim-ish MangoWM Setup”</h3>

  <img src="https://www.shieldcn.dev/github/last-commit/cherrblyria/midnight-bloom.svg?variant=secondary&size=sm&theme=gray" alt="Last commit" /> <img src="https://www.shieldcn.dev/github/commits/cherrblyria/midnight-bloom.svg?variant=secondary&size=sm&theme=gray" alt="Commits" /> <img src="https://www.shieldcn.dev/github/stars/cherrblyria/midnight-bloom.svg?variant=secondary&size=sm&theme=gray" alt="GitHub Stars" /> <img src="https://www.shieldcn.dev/github/release/cherrblyria/midnight-bloom.svg?size=sm&theme=gray" alt="Release" />
  
  <img src="https://www.shieldcn.dev/github/branches/cherrblyria/midnight-bloom.svg?variant=ghost&size=sm&theme=gray" alt="Branches" /> <img src="https://www.shieldcn.dev/github/merged-prs/cherrblyria/midnight-bloom.svg?variant=ghost&size=sm&theme=gray" alt="Merged PRs" /> <img src="https://www.shieldcn.dev/github/license/cherrblyria/midnight-bloom.svg?variant=ghost&size=sm&theme=gray" alt="License" />

</div>

<h2>PLS READ</h2>

I'm currently working on migrating to [MangoWM](https://mangowm.github.io/).\
[Hyprland](https://hypr.land/)'s stuff will be unmaintained, and archive in `hyprland` branch.\
MangoWM migration will be in `mangowm` branch.\
`main` branch will be the latest stable version.

<h3>Notable Things</h3>

- Vim-like binding: I primary use `keymode` (submap) instead of normal keybinds
- ColorScheme: **Catppuccin Mocha**
- Compositor: **MangoWM**
- Bar: **Waybar**
- Launcher: **Rofi**
- Terminal: **Foot**
- File Manager: **Yazi**
- IDE
  - **Zed**: GUI
  - **NeoVim** (lazyvim): TUI
- Terminal First: **Use TUI programs when possible**

### Screenshots (out dated)

| ![](/assets/clean.png) | ![](/assets/monkeytype.png) |
| --- | --- |
| ![](/assets/fetch.png) | ![](/assets/terminals.png) |
| ![](/assets/lockscreen.png) |  |

### How to get this?

Basically just clone the repo, stow configs then pray..

```bash
git clone https://github.com/cherrblyria/midnight-bloom.git ~/.dotfiles
cd ~/.dotfiles
stow --no-folding --adopt yuri
```

Or you can download the source code from [latest release](https://github.com/cherrblyria/midnight-bloom/releases/latest) then extract it and stow the config just like above.\
I'll make a new release monthly and when it's stable.

#### wlogout

for `wlogout` you *must* have to use [my fork](https://github.com/cherrblyria/wlogout) instead of the original one for icon to display correctly
