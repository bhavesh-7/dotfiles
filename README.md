# Dotfiles

This repository contains my personal dotfiles for various applications and configurations. It is designed to be easily installed using GNU Stow.

## Table of Contents

- [Installation](#installation)
- [Directories](#directories)
- [Notes](#notes)

## Installation

1. **Clone the Repository**

   Clone this repository to your home directory:

   ```bash
   git clone https://github.com/bhavesh-7/dotfiles.git ~/dotfiles
   ```

2. **Install GNU Stow**

   Ensure that you have GNU Stow installed on your system. You can typically install it using your package manager:

   - **For Ubuntu/Debian:**
     ```bash
     sudo apt install stow
     ```

   - **For Fedora:**
     ```bash
     sudo dnf install stow
     ```

   - **For Arch Linux:**
     ```bash
     sudo pacman -S stow
     ```

3. **Navigate to the Dotfiles Directory**

   Change into the dotfiles directory:

   ```bash
   cd ~/dotfiles
   ```

4. **Stow Your Desired Configuration**

   Use Stow to symlink the desired configuration directory into your home directory. Replace `DIR_NAME` with the name of the directory you wish to stow (e.g., `bash`, `git`, etc.):

   ```bash
   stow DIR_NAME
   ```

   For example, to stow your bash configuration, run:

   ```bash
   stow bash
   ```
   If you wish to remove a stowed configuration, you can use the `-D` flag with Stow:

   ```bash
   stow -D DIR_NAME
   ```


## Directories

- **bash/** - Bash configuration files
- **zsh/** - Zsh configuration files
- **kitty/** - Kitty terminal configuration files
- **nvim/** - Neovim configuration files
- **ranger/** - Ranger file manager configuration files
- **tmux/** - Tmux configuration files
- **scripts/** - Personal scripts and configurations

## Notes

- **Backup Warning**: Stow will create symlinks in your home directory. Existing configuration files will be overwritten, so back up important files before stowing.
- **Configuration Customization**: You may need to edit configuration files after stowing to adjust paths or settings for your environment.
- **Shell Compatibility**: These configurations are primarily for Zsh, but can be adapted for other shells if needed.
- **Personalization**: These configurations are tailored to my personal preferences - feel free to modify them for your workflow.
- **Support**: If you have questions or suggestions, feel free to open an issue or pull request.

These dotfiles are provided as-is without any warranty. Use them at your own risk.
