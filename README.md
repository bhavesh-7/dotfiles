# Dotfiles

This repository contains my personal dotfiles for various applications and configurations. It is designed to be easily installed using GNU Stow.

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
- **kitty/** - Kitty terminal configuration files
- **nvim/** - Neovim configuration files
- **ranger/** - Ranger file manager configuration files
- **tmux/** - Tmux configuration files
- **personal/** - Personal scripts and configurations

## Notes

- Stow will create symlinks for the specified configuration directory in your home directory. If you have existing configuration files, they will be overwritten. Ensure to back up any important files before stowing.
- Ensure to check and edit any configuration files as needed after stowing, as they may contain paths or settings specific to your previous environment.
- If you are using a different shell (e.g., Zsh), you can still use these dotfiles by manually copying the files to your home directory or creating symlinks.
- These configurations are self-explanatory and can be easily modified to suit your preferences.
- These configurations are tailored to my personal preferences and may not suit your workflow. Feel free to modify them as needed.
- If you have any questions or suggestions, feel free to open an issue or pull request.
- The 'Scripts' directory contains scripts and configurations for my setup. You can ignore this directory if you wish.

These dotfiles are provided as-is without any warranty. Use them at your own risk.
