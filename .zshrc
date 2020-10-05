# If you come from bash you might have to change your $PATH.
export PATH=$PATH:$HOME/.local/bin/

ZSH_DISABLE_COMPFIX=true

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

# Load custom env variables
[ -s "$HOME/.env" ] && source "$HOME/.env"

# Aliases for your health
alias ku='kubectl'
alias pip='pip3'
alias clock='tty-clock -sbct -C 1'

# FZF override to respect .gitignore when deciding what to exclude
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules -g ""'

# Modifying /etc/default/keyboard is a better solution but
# keeping this here in case that is not an option
#setxkbmap -option caps:ctrl_modifier

# zsh completion
fpath=($fpath "$HOME/.zsh/completion")

# pyenv
export PATH="/Users/nolicitra/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Updating vim alias
alias vim='/usr/local/bin/vim'

# asdf version manager
source $(brew --prefix asdf)/asdf.sh
