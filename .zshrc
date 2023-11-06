# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"

# Options
setopt hist_ignore_dups
setopt hist_expire_dups_first

# General
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
SAVEHIST=99999

# Plugins
plugins=(
    zsh-autosuggestions
    globalias
)

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Powerlevel9k
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

source $ZSH/oh-my-zsh.sh

alias cpa="clippaste"
alias diff="diff --color=auto"
alias exag="exa -ahlT -L=1  -s=extension --git --group-directories-first"
alias fdir='find . -type d -name'
alias ffil='find . -type f -name'
alias grep="grep --color=auto"
alias jupn="jupyter notebook"
alias ncdu="ncdu --color=dark -x"
alias pacai="pacaur -S"
alias pacas="pacaur -Ss"
alias paci="sudo pacman -S"
alias pacq="pacman -Qi"
alias pacr="sudo pacman -R"
alias pacs="pacman -Ss"
alias pacu="sudo pacman -Syu"
alias pp="prettyping --nolegend"
alias sysd="sudo systemctl disable"
alias syse="sudo systemctl enable"
alias sysr="sudo systemctl restart"
alias syss="systemctl status"
alias systa="sudo systemctl start"
alias systo="sudo systemctl stop"
alias tmux="tmux -u"
alias tmuxm="tmux new-session \; split-window -h \; split-window -v \; attach"
alias trii="trizen -S --noedit"
alias tris="trizen -Ss --noedit"
alias triu="trizen -Syu --noedit"
alias vimrc="vim ~/.vimrc"
alias yayi="yay -S"
alias yayu="yay -Syu"
alias ytdl="youtube-dl"
alias zshrc="vim ~/.zshrc"
# Config alias
alias py="python"
alias wstorm="open -a /Applications/WebStorm.app"
alias preview="ag -i -S . | fzf --preview 'cat {}' --info inline -i -e | pbcopy"
alias filepreview="ag -l -i -S . | fzf --preview 'cat {}' --info inline -i -e | pbcopy"
alias ls="ls -G"
alias gcc="g++ -std=c++17"
alias cheat="curl cheat.sh/"
alias weather="curl wttr.in/hochiminh"
# alias brow='arch --x86_64 /usr/local/Homebrew/bin/brew'
# alias brew='arch -x86_64 brew'
alias gorun='go run main.go'
alias jsrun='node main.js < input.txt'
alias cpprun='cp main.cpp < input.txt'
alias chromeinsecure='open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security'

# Commands
export EDITOR=vim 
export GREP_COLOR="1;32"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias: "
export PATH=$HOME/.node_modules/bin:$PATH
export PATH=$HOME/Applications/bin:$PATH
export PATH="/usr/local/bin:$PATH"
# export PATH="/opt/homebrew/bin:$PATH"
# export PATH="/usr/local/homebrew/bin:$PATH"
# export PATH="/usr/local/homebrew/sbin:$PATH"
export PATH=/opt/homebrew/bin:$PATH
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/lib/node_modules:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-11.0.15.jdk/Contents/Home"
export FZF_DEFAULT_COMMAND=""
export PATH=$PATH:/usr/local/mongodb/bin  
export PATH="$PATH:/Users/nltbao/flutter 2/bin"
export PATH=$PATH:/Users/nltbao/ffmpeg
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/Users/nltbao/.local/bin/fig:$PATH"
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:"$PATH"
export PATH=$(go env GOPATH)/bin:$PATH

# config androi studio
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export PATH="${HOME}/Library/Android/sdk/tools:${HOME}/Library/Android/sdk/platform-tools:${PATH}"

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
cplusplus(){
    if [ "$#" -ne 1 ]; then
        echo "Usage: cp <file.cpp>"
    else
        name=$(echo $1 | cut -f 1 -d '.')
        g++ --std=c++17 -Wshadow -Wall -O2 -Wno-unused-result $1 -o name; ./name
    fi
}


# Auto start Tmux
if [ "$TMUX" = "" ]; then tmux; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/nltbao/Downloads/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/nltbao/Downloads/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/nltbao/Downloads/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/nltbao/Downloads/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$HOME/.local/bin:$PATH"
