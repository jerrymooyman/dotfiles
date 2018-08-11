# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/jmooyman/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="kphoen"
#ZSH_THEME="powerline"
ZSH_THEME="bullet-train"
#ZSH_THEME="kphoen"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
#plugins=(git)
plugins=(git colored-man colorize github brew osx zsh-syntax-highlighting vi-mode node npm docker docker-compose thefuck themes)


# Add env.sh
#source ~/Projects/config/env.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# personal paths
export REPOS=${HOME}/repos

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LANG=en_AU.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#export EDITOR='vim'
export EDITOR='nvim'
# else
#   export EDITOR='mvim'
# fi

# notes stuff
#n() { $EDITOR ~/notes/"$*".txt }
#nls() { ls -c ~/notes/ | grep "$*" }

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="${HOME}/.ssh/id_rsa"
#ssh-add -K ${SSH_KEY_PATH}

# JAVA settings
export JAVA_HOME=/Library/Java/Home

# Android settings
export ANDROID_HOME=${HOME}/Library/Android/sdk
export ANDROID_TOOLS=${ANDROID_HOME}/tools
export ANDROID_TOOLS_BIN=${ANDROID_TOOLS}/bin
export ANDROID_PLATFORM_TOOLS=${ANDROID_HOME}/platform-tools
export ANDROID_PLATFORM_TOOLS_BIN=${ANDROID_PLATFORM_TOOLS}/bin
#export PATH=${PATH}:${ANDROID_HOME}/tools
#export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:${ANDROID_TOOLS}:${ANDROID_PLATFORM_TOOLS}:${ANDROID_TOOLS_BIN}:${ANDROID_PLATFORM_TOOLS_BIN}
export PATH=${PATH}:${ANDROID_HOME}/ndk-bundle
export ANDROID_NDK=${ANDROID_HOME}/ndk-bundle

# go-lang
export GOPATH=${HOME}/go
export PATH=${PATH}:${GOPATH}/bin


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

#alias emacs=e
#alias emacsclient=ec

alias mc=". /usr/local/Cellar/midnight-commander/4.8.19/libexec/mc/mc-wrapper.sh"

alias esl="eslint **/*.js --quiet"

# react native
alias rn="react-native"
alias rns="rn start"
alias rni="rn run-ios"
alias rna="rn run-android"


alias vi="nvim"
alias vim="nvim"
alias magit="vim -c MagitOnly"


alias evrc="vi ~/.config/nvim/init.vim"
alias rc=". ~/.zshrc"
alias erc="vi ~/.zshrc"
# alias rc=". ~/.zshrc"
# alias vrc="vi ~/.zshrc"

# ssh stuff
alias sssh="ssh-add -K ${SSH_KEY_PATH}"


# python
#alias python="python3"

# llvm stuff
#export PATH="/usr/local/opt/llvm/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
#export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/llvm/include/c++/v1/"
#DONT ENABLE THESE
#export CC="clang"
#export CXX="$(CC)++"

# emscripten
#export LLVM_ROOT=/usr/local/opt/emscripten/libexec/llvm/bin

# android 
alias lemu="${ANDROID_TOOLS}/emulator -avd Nexus_5_API_23 -netdelay none -netspeed full -no-audio -no-window &"

# docker
alias dcd="docker-compose down"
alias dcu="docker-compose up"
alias dcr="dcd && dcu"
alias di="docker images"
alias dp="docker ps"
# convenience
alias dlc="docker ps -aq"
alias dsarc="docker stop $(docker ps -aq)"
alias drac="docker rm $(docker ps -aq)"
alias drai="docker rmi $(docker images -q)"
alias docker_restart="osascript -e 'quit app \"Docker\"' && open -a Docker"

alias dminit="ssh-add ~/docker-machine.pem && ~/setup_docker_machine.sh"
alias dmcu='eval $(docker-machine env default) && eval $(aws ecr get-login --region ap-southeast-2 --no-include-email --profile rescd) && DOCKER_HOST_IP=$(docker-machine ip default) docker-compose up -d'

# aws 
alias lecr="eval $(aws ecr get-login --no-include-email --region ap-southeast-2 --profile rescd)"

# git
alias gcw="git commit -m 'WORK IN PROGRESS'"
alias gac="gaa && gcw --no-verify"

# intellij
alias ij="/usr/local/bin/idea"

alias gw="./gradlew"

# kotlin/native
export KOTLINNATIVEPATH=${REPOS}/public/kotlin-native
export PATH=${PATH}:${KOTLINNATIVEPATH}/dist/bin

# to make npm installs faster
export JOBS=max

# thefuck utility
eval $(thefuck --alias crap)

# exercism stuff
#if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
#    . ~/.config/exercism/exercism_completion.zsh
#fi

# add an alias if there is not already an alias
# # NB once per boot, when the alias is not present you will be prompted for your user password
ifconfig | grep -q 10.200.10.1 || sudo ifconfig lo0 alias 10.200.10.1
  
export DOCKER_HOST_IP=10.200.10.1

# prefer homebrew installed programs over system-provided programs
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

source $ZSH/oh-my-zsh.sh

# haskell stuff
#export PATH="$HOME/.cabal/bin:$PATH"
#alias ghc="stack ghc"
#alias ghci="stack ghc repl"
#export PATH="/usr/local/opt/ghc@8.0/bin:$PATH"
#export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/sqlite/bin:$PATH"

# JUnit
export JUNIT_HOME="$HOME/junit"
export CLASSPATH=$CLASSPATH:$JUNIT_HOME/junit.jar

# access logs on a remote docker container
export WORKSPACE="$HOME/repos/work"
function dmtail {
    project_name=$(basename `pwd`)
    docker-machine ssh $1 tail -f $WORKSPACE/$project_name/$2
}

# search using fzf (fuzzy)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# find inspection dbs
alias findinspectiondbs="find . -name "inspections.db" -exec ls -lh {} \;"

