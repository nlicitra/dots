# If you come from bash you might have to change your $PATH.
export PATH=$PATH:$HOME/.local/bin/

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="nlicitra"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases for your health
alias skyvpn='sudo openvpn --config ~/.vpn/skyword/client.ovpn' 
alias ku='kubectl'
alias pip='pip3'
alias clock='tty-clock -sbct -C 1'

# FZF override to respect .gitignore when deciding what to exclude
#export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Modifying /etc/default/keyboard is a better solution but
# keeping this here in case that is not an option
#setxkbmap -option caps:ctrl_modifier
