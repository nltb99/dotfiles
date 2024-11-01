# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"

# Settings
setopt HIST_IGNORE_DUPS  # Ignore duplicates in history
setopt HIST_IGNORE_SPACE  # Ignore commands with leading spaces
setopt HIST_REDUCE_BLANKS  # Reduce unnecessary blanks in history commands
setopt hist_expire_dups_first
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# General
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
HISTFILE=~/.zsh_history  # Set the location of the history file
SAVEHIST=9999999 # Save the last n commands to the history file

# Plugins
plugins=(
    zsh-autosuggestions
    globalias
)

####################### Powerlevel9k #######################

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_MODE="nerdfont-complete"

# Prompt
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs anaconda)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{014}‚ï≠"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}‚ï∞%K{black}%F{blue} ÔÑµ ÔÅî%f%F{black}%kÓÇ∞%f"

# Segment
DEFAULT_USER="$USER"
POWERLEVEL9K_CONTEXT_TEMPLATE="\uf489 %n@$(hostname -f)"
POWERLEVEL9K_BATTERY_LOW_THRESHOLD="30"
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE_ALWAYS=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VI_COMMAND_MODE_STRING="\ue62b"
POWERLEVEL9K_VI_INSERT_MODE_STRING="\ue62b"
POWERLEVEL9K_TIME_FORMAT="%D{%a,%l:%M %P}"
POWERLEVEL9K_PYTHON_ICON="\ue235"
VIRTUAL_ENV_DISABLE_PROMPT=1
POWERLEVEL9K_SHOW_CHANGESET=false

#Colour
POWERLEVEL9K_COLOR_SCHEME="dark"
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="yellow"
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="black"
POWERLEVEL9K_BATTERY_CHARGED="green"
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="green"
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="black"
POWERLEVEL9K_BATTERY_CHARGING="orange1"
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="orange1"
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="black"
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="cyan"
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="black"
POWERLEVEL9K_BATTERY_LOW_BACKGROUND="red"
POWERLEVEL9K_BATTERY_LOW_COLOR="red"
POWERLEVEL9K_BATTERY_LOW_FOREGROUND="black"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="green"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="purple"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND="purple"
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_FOREGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="blue"
POWERLEVEL9K_DIR_ETC_BACKGROUND="red"
POWERLEVEL9K_DIR_HOME_BACKGROUND="blue"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="blue"
POWERLEVEL9K_DIR_NOT_WRITABLE_BACKGROUND="red"
POWERLEVEL9K_HISTORY_BACKGROUND="green"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="green"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="yellow"
POWERLEVEL9K_OS_ICON_FOREGROUND="darkcyan"
POWERLEVEL9K_RAM_BACKGROUND="yellow"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="red"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="black"
POWERLEVEL9K_STATUS_OK_BACKGROUND="green"
POWERLEVEL9K_STATUS_OK_FOREGROUND="black"
POWERLEVEL9K_TIME_BACKGROUND="darkcyan"
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="blue"
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND="black"
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="black"
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND="white"

####################### Alias #######################

GLOBALIAS_FILTER_VALUES=('ls' 'grep')

alias preview="ag -i -S . | fzf --preview 'cat {}' --info inline -i -e | pbcopy"
alias filepreview="ag -l -i -S . | fzf --preview 'cat {}' --info inline -i -e | pbcopy"
alias gcc="g++ -std=c++17"
alias cheat="curl cheat.sh/"
alias weather="curl wttr.in/hochiminh"
alias chromeinsecure='open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security'

# Coding challenge
alias gorun='go run main.go'
alias jsrun='node main.js < input.txt'
alias cpprun='cp main.cpp < input.txt'
alias pyrun='python main.py < input.txt'

# Python
alias py="python"
alias pypath='export PYTHONPATH=$(pwd)'
alias pppp='source /Users/nltbao/Desktop/nvim/scripts/pppp.sh'
alias p2p2='poetry env use /Users/nltbao/.pyenv/shims/python'

# Github
alias ghsync='/Users/nltbao/Desktop/nvim/scripts/sync.sh'
alias cdecrypt='/Users/nltbao/Desktop/nvim/scripts/c_decrypt.sh $1'
alias cpurgequeue='/Users/nltbao/Desktop/nvim/scripts/rabbitmq/purge_all_queue.sh'

# Tmux kill all sessions & windows except current session
# alias tkill='tmux ls | grep -v '\''(attached)'\'' | awk '\''{print $1}'\'' | xargs -I {} tmux kill-session -t {} && tmux kill-window -a'
alias tkill='for session in $(tmux list-sessions | grep -v '\''(attached)'\'' | awk '\''{print $1}'\'' | cut -d: -f1); do tmux kill-session -t "$session"; done'

# Kill all pseudo-terminal
alias pskill='ps -eo pid,tty | grep ttys | awk '\''{print $1}'\'' | xargs sudo kill -9'

# Kill all celery
alias ckill='ps aux | grep '\''celery'\'' | grep -v '\''grep'\'' | awk '\''{print $2}'\'' | xargs kill -9'

# Yabai: enable fullscreen-zoom for every app that is not currently in fullscreen-zoom mode 
alias yafull='for window_id in $(yabai -m query --windows | ag -B 31 '\'\"'has-fullscreen-zoom":false,'"'"' | ag '\'\"'id"'\'' | cut -d ":" -f2 | cut -d "," -f1); do yabai -m window "$window_id" --toggle zoom-fullscreen; done'

# Gcloud CLI
alias gcloud='/Users/nltbao/Documents/libs/google-cloud-sdk/bin/gcloud'

# Docker Compose
alias dockerup='docker-compose -f /Users/nltbao/Desktop/nvim/scripts/redis_rabbitmq_mongo.yaml up -d'
alias dockerdown='docker-compose -f /Users/nltbao/Desktop/nvim/scripts/redis_rabbitmq_mongo.yaml down'

# Kubernetes
alias k='kubectl'

####################### ENV variable #######################

export EDITOR=vim 
export GREP_COLOR="1;32"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias: "
export PATH=$HOME/.node_modules/bin:$PATH
export PATH=$HOME/Applications/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/lib/node_modules:$PATH"
export PATH=$PATH:/usr/local/mongodb/bin  
export PATH="$PATH:/Users/nltbao/flutter 2/bin"
export PATH=$PATH:/Users/nltbao/ffmpeg
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:"$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-11.0.15.jdk/Contents/Home"
export FZF_DEFAULT_COMMAND=""

# Go
export PATH=$(go env GOPATH)/bin:$PATH
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib -L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include -I/opt/homebrew/opt/libpq/include"

# Celery
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$HOME/.local/bin:$PATH"

####################### OS Specification #######################

# https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX

elif [[ "$OSTYPE" == "cygwin" ]]; then
    # Mac cygwin

elif [[ "$OSTYPE" == "msys" ]]; then
    # Window

elif [[ "$OSTYPE" == "win32" ]]; then
    # I'm not sure this can happen.

elif [[ "$OSTYPE" == "freebsd"* ]]; then
    # ...
    
else
    echo 'Unknown OS!'
fi

# CPP
# cplusplus(){
#     if [ "$#" -ne 1 ]; then
#         echo "Usage: cp <file.cpp>"
#     else
#         name=$(echo $1 | cut -f 1 -d '.')
#         g++ --std=c++17 -Wshadow -Wall -O2 -Wno-unused-result $1 -o name; ./name
#     fi
# }

####################### Initialize #######################

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# tmux
if [ "$TMUX" = "" ]; then tmux; fi

# poetry
# fpath+=~/.zfunc
# autoload -Uz compinit && compinit

# To increase the number of open files
ulimit -n 65536
