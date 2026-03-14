# dotfiles

Personal config files for Linux. Covers Neovim, tmux, Conky and terminal setup.

## Contents

| File/Dir | Description |
|---|---|
| `.config/nvim/` | Neovim configuration (Lua) |
| `.tmux.conf` | tmux config with TPM and onedark theme |
| `.conkyrc` | Conky system monitor config |

## Terminal setup

These dotfiles assume **Terminator** as terminal emulator and **tmux** as multiplexer, with the [tmux-onedark-theme](https://github.com/odedlaz/tmux-onedark-theme) plugin. Two things need to be configured for the theme to render correctly.

### 1. True Color in Terminator

Terminator doesn't enable true color by default. Edit `~/.config/terminator/config` and add the `environment` line inside `[[default]]`:

```ini
[profiles]
  [[default]]
    environment = COLORTERM=truecolor
```

Restart Terminator and verify with:

```bash
echo $COLORTERM   # should print: truecolor
```

### 2. Nerd Fonts

The theme uses Powerline/Nerd Font symbols for the status bar separators. Without the right font they render as garbage characters.

Install JetBrainsMono Nerd Font:

```bash
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
fc-cache -fv
```

Then set the font in Terminator: right click → Preferences → Profiles → General → Font → **JetBrainsMono Nerd Font Mono** (the `Mono` variant).

Verify the symbols render correctly:

```bash
echo "\ue0b0 \ue0b2"   # should show two arrow shapes
```

### tmux config

The `.tmux.conf` uses [TPM](https://github.com/tmux-plugins/tpm) to manage plugins. On a fresh install, after cloning run:

```bash
# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Reload config and install plugins
tmux source-file ~/.tmux.conf
# then inside tmux: prefix + I
```
