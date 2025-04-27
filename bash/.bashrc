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
export RANGER_LOAD_DEFAULT_RC=FALSE
export TERMINAL=kitty

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
  fzf
)
# Plugins from ~/.oh-my-bash/plugins dir
plugins=(
  git
  bashmarks
)
source "$OSH"/oh-my-bash.sh
export PATH=$PATH:/home/bhavesh/.local/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval "$(thefuck --alias)"

# pnpm
export PNPM_HOME="/home/bhavesh/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end




eval "$(zoxide init bash)"
eval "$(starship init bash)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bhavesh/Applications/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bhavesh/Applications/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/bhavesh/Applications/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/bhavesh/Applications/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

