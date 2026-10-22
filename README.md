<div align="center">

# 🌿 Dotfiles

**Clean, aesthetic macOS workspace featuring Oxocarbon Dark, AeroSpace, Kitty, and Tmux.**


</div>

---

## 💻 Stack & Aesthetics

- **OS:** macOS 27 (Tahoe, Apple Silicon)
- **Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty/)
- **Theme:** Oxocarbon (`#161616` background, `#dde1e6` foreground)
- **Font:** `CaskaydiaCove NF`
- **Multiplexer:** [tmux](https://github.com/tmux/tmux) with [TPM](https://github.com/tmux-plugins/tpm)
- **Tiling WM:** [AeroSpace](https://github.com/nikitabobko/AeroSpace)
- **Window Borders:** [JankyBorders](https://github.com/FelixKratz/JankyBorders)
- **Shell:** [Fish Shell](https://fishshell.com/)

---

## ✨ Highlights

### 1. Seamless Oxocarbon Titlebar
- `macos_titlebar_color background`: Titlebar blends seamlessly into Kitty's `#161616` solid background.
- Eliminates the contrasting `#3a3a3c` grey system bar and corner clipping notches.
- `background_opacity 1.0`: Eliminates screenshot tearing and transparent alpha bugs on macOS.

### 2. Dynamic Centered Window Title in Kitty
On modern macOS, AppKit locks window titles to the left side next to traffic lights for transparent/custom titlebars. Kitty's core also collapses consecutive standard whitespace (`re.sub(r'\s+', ' ')`).

This setup solves it cleanly:
- Uses **Unicode Braille Pattern Blank (`⠀` / `\u2800`)**, which bypasses Kitty's whitespace sanitizer and renders as invisible monospace spacing.
- **Inside tmux:** Automatically recalculates window width (`#{client_width}`) and centers the title string in real time on window resize:
  ```tmux
  set -g set-titles on
  set -g set-titles-string "#{R:⠀,#{e|-:#{e|/:#{e|*:#{client_width},3},7},10}}tmux ~"
  ```
- **Outside tmux (Fish):** Handled via `~/.config/fish/functions/fish_title.fish` dynamically using `$COLUMNS`.

---

## 🚀 Installation & Symlinks

Clone this repository to `~/dotfiles`:

```bash
git clone https://github.com/David4rr/dotfiles.git ~/dotfiles
```

### Symlink Configurations:

```bash
# Kitty
mkdir -p ~/.config/kitty
ln -sf ~/dotfiles/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

# Tmux
mkdir -p ~/.config/tmux
ln -sf ~/dotfiles/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf

# Fish
mkdir -p ~/.config/fish/functions
ln -sf ~/dotfiles/.config/fish/functions/fish_title.fish ~/.config/fish/functions/fish_title.fish

# AeroSpace
ln -sf ~/dotfiles/.aerospace.toml ~/.aerospace.toml

# JankyBorders
mkdir -p ~/.config/borders
ln -sf ~/dotfiles/.config/borders/bordersrc ~/.config/borders/bordersrc
```

---

## 📜 License

MIT © [David Arrozaqi](https://github.com/David4rr)
