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

## Directories

- **bash/** - Bash configuration files
- **git/** - Git configuration files (Not added yet)
- **nvim/** - Neovim configuration files
- (Will add some other configs later)

## Notes

- Ensure to check and edit any configuration files as needed after stowing, as they may contain paths or settings specific to your previous environment.






To be continued.....
