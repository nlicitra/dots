# Path to your oh-my-zsh installation.
export ZSH=/Users/nick/.oh-my-zsh

# Default editor to NeoVim
export EDITOR=nvim

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git coffee python zsh-syntax-highlighting safe-paste)

# User configuration

export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Docker STUFF
alias dm-up="docker-machine start default; eval '$(docker-machine env default)'"
alias dm-stop="docker-machine stop default"

dm_status="$(docker-machine status)"
if [ "$dm_status" = "Running" ]; then
    eval "$(docker-machine env default)"
fi

# NVM - Node Version Manager
export NVM_DIR="/Users/nick/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Use custom installed version of vim from /usr/local/bin
# alias vim='/usr/local/bin/nvim'

alias spa='docker-compose run --service-ports builder gulp --env=production --debug=true'

function tmspa {
    if [ "$1" = "upp" ]; then
        if [ "$2" = "prod" ]; then
            docker-compose run --service-ports builder yarn dev-server --env=production --debug=true
        else
            docker-compose run --service-ports builder yarn dev-server --env=$2 --debug=false
        fi
    fi
    if [ "$1" = "up" ]; then
        if [ "$2" = "prod" ]; then
            docker-compose run --service-ports builder gulp --env=production --debug=true
        else
            docker-compose run --service-ports builder gulp --env=$2 --debug=false
        fi
    fi
    if [ "$1" = "test" ]; then
        if [ -z "$2" ]; then
            docker-compose run builder yarn test
        else
            if [ "$2" = "integration" ]; then
                docker-compose run builder yarn integration_tests
            fi
            if [ "$2" = "unit" ]; then
                docker-compose run builder yarn unit_tests
            fi
        fi
    fi
    if [ "$1" = "run" ]; then
        shift
        docker-compose run builder $@
    fi
    if [ "$1" = "search" ]; then
        grep -r "$2" ~/Documents/web/Trackmaven/trackmaven-spa/app/client
    fi
}

# tmux & tmuxinator
# source ~/.bin/tmuxinator.zsh
