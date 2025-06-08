# Dotfiles Setup Guide

A comprehensive setup guide for Linux development environment configuration.

## 📦 Core Package Installation

### Essential Development Tools
```bash
sudo apt update && sudo apt install -y \
    neovim \
    tmux \
    vim \
    git \
    curl \
    python3-pip \
    ipython3
```

### System Utilities
```bash
sudo apt install -y \
    pavucontrol \
    dtrx \
    powertop \
    fish
```

### Applications
```bash
# Web Browser
sudo apt install brave-browser-nightly

# File Transfer
sudo snap install localsend

# Bluetooth Manager
sudo apt install blueman

# Audio Visualizer
sudo apt install cava
```

### Wayland/Hyprland Tools
```bash
sudo apt install -y \
    grim \
    slurp \
    wl-clipboard \
    dunst \
    swappy
```

## 🎨 Fonts & Visual Setup

### JetBrains Mono Font Family
1. **JetBrains Mono Regular**: Download from [JetBrains](https://www.jetbrains.com/lp/mono/)
2. **JetBrains Mono Nerd Font**: Download from [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
3. Copy all necessary font files from the `fonts` assets directory

### Installation Steps
```bash
# Create fonts directory if it doesn't exist
mkdir -p ~/.local/share/fonts

# Copy font files to the fonts directory
cp -r fonts/* ~/.local/share/fonts/

# Refresh font cache
fc-cache -fv
```

## 🖼️ Wallpapers

Beautiful wallpaper collection available at:
```bash
git clone https://github.com/dharmx/walls.git
```

## 🛠️ Troubleshooting

### Sandbox Issues (Cursor, Obsidian)
If you encounter sandbox-related errors with applications like Cursor or Obsidian:

```bash
sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0
```

**Note**: This command temporarily disables AppArmor restrictions. Consider the security implications before applying this fix.

## 🐟 Shell Configuration

This setup uses Fish shell for enhanced command-line experience. After installation, set it as your default shell:

```bash
chsh -s /usr/bin/fish
```

## 📝 Additional Notes

- Ensure all packages are updated regularly: `sudo apt update && sudo apt upgrade`
- Some applications may require additional configuration files from this dotfiles repository
- Check individual application documentation for advanced configuration options

---

**System Compatibility**: Tested on Ubuntu/Debian-based distributions with Wayland display server.
