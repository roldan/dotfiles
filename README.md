# dotfiles

Personal config files for Linux. Covers Neovim, Kitty, tmux, Conky and terminal setup.

## Contents

| File/Dir | Description |
|---|---|
| `.config/nvim/` | Neovim configuration (Lua) |
| `.config/kitty/` | Kitty terminal config |
| `.tmux.conf` | tmux config with TPM and onedark theme |
| `.conkyrc` | Conky system monitor config |

## Neovim

The Neovim setup uses `lazy.nvim` and includes:

- `pyright` for Python LSP/navigation
- `ruff` for linting
- `nvim-cmp` for autocomplete
- `telescope.nvim` for file/text search

Useful mappings:

- `<C-p>`: find files
- `<leader>fg`: live grep
- `gd` / `gD`: go to definition / declaration
- `Ctrl+click`: go to definition
- `Ctrl+o` / `Ctrl+i`: back / forward in jump history
- `<leader>df`: show the full diagnostic popup


## Terminal setup

These dotfiles include **Kitty** and **tmux** with the [tmux-onedark-theme](https://github.com/odedlaz/tmux-onedark-theme) plugin. Kitty uses a Nerd Font so the status bar symbols render correctly.

Install JetBrainsMono Nerd Font:

```bash
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
fc-cache -fv
```

Kitty is configured to use `JetBrainsMono Nerd Font Mono` in `.config/kitty/kitty.conf`.

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
