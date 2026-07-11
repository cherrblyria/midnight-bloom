<div align=center>
  <h2>𓄼 ╱ ，× 𝐌𝐢𝐝𝐧𝐢𝐠𝐡𝐭 𝐁𝐥𝐨𝐨𝐦  ˟ ˚☾ ⌁</h2>
  
  <h3>“Cozy MangoWM Setup”</h3>

  <img src="https://www.shieldcn.dev/github/last-commit/cherrblyria/midnight-bloom.svg?variant=secondary&size=sm&theme=gray" alt="Last commit" /> <img src="https://www.shieldcn.dev/github/commits/cherrblyria/midnight-bloom.svg?variant=secondary&size=sm&theme=gray" alt="Commits" /> <img src="https://www.shieldcn.dev/github/stars/cherrblyria/midnight-bloom.svg?variant=secondary&size=sm&theme=gray" alt="GitHub Stars" /> <img src="https://www.shieldcn.dev/github/release/cherrblyria/midnight-bloom.svg?size=sm&theme=gray" alt="Release" />
  
  <img src="https://www.shieldcn.dev/github/branches/cherrblyria/midnight-bloom.svg?variant=ghost&size=sm&theme=gray" alt="Branches" /> <img src="https://www.shieldcn.dev/github/merged-prs/cherrblyria/midnight-bloom.svg?variant=ghost&size=sm&theme=gray" alt="Merged PRs" /> <img src="https://www.shieldcn.dev/github/license/cherrblyria/midnight-bloom.svg?variant=ghost&size=sm&theme=gray" alt="License" />

</div>

<h3>Notable Things</h3>

- ColorScheme: **Catppuccin Mocha**
- Compositor: **MangoWM**
- Bar: **Waybar**
- Launcher: **Rofi**
- Terminal: **Foot**
- File Manager: **Yazi**, Nautilus
- IDE: **Zed**, NeoVim
- Most **Overkill Wallpaper Picker** ever

<h3>Screenshots :3</h3>

| ![](/assets/clean.png) | ![](/assets/rofi.png) |
| :---: | :---: |
| Empty | Rofi |
| ![](/assets/fetch.png) | ![](/assets/terminals.png) |
| FastFetch | Nvim, tty-clock, cava, Yazi |
| ![](/assets/wlogout.png) | ![](/assets/overview.png) |
| Wlogout | Overview |

<h3>How to get this?</h3>

Basically just clone the repo, stow configs then pray..

```bash
git clone https://github.com/cherrblyria/midnight-bloom.git ~/.dotfiles
cd ~/.dotfiles
stow --no-folding --adopt yuri
```

Or you can download the source code from [latest release](https://github.com/cherrblyria/midnight-bloom/releases/latest) then extract it and stow the config just like above.\
I'll make a new release monthly and when it's stable.

> [!NOTE]
> You can view the dependencies list [here](https://github.com/cherrblyria/midnight-bloom/blob/main/dependency.txt).

> [!WARNING]
> Some configs contain hardcoded `/home/cherr/` paths — search for and replace with `/home/yourusername` after stowing, or they won't resolve on your machine.
>
> Known files: `yuri/.config/environment.d/session.conf`, `yuri/.config/btop/btop.conf`, `yuri/.config/qt5ct/qt5ct.conf`, `yuri/.config/qt6ct/qt6ct.conf`.

---

<h3>Archived thing</h3>

[Hyprland](https://hypr.land/)'s stuff is unmaintained as I moved to [MangoWM](https://mangowm.github.io/), and archive in `hyprland` branch.
