# I use gh/ohmybash/oh-my-bash for my bash customisation.

# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
export OSH='/home/bhavesh/.oh-my-bash'
OSH_THEME="font"

# Default Setters
export EDITOR="nvim"
export VISUAL="nvim"

# Let OMB use SUDO
OMB_USE_SUDO=true

# Completions from ~/.oh-my-bash/completions dir
completions=(
  git
  composer
  ssh
)

# Aliases form ~/.oh-my-bash/aliases dir
aliases=(
  general
  primitive
)

# Plugins from ~/.oh-my-bash/plugins dir
plugins=(
  git
  bashmarks
)

source "$OSH"/oh-my-bash.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
