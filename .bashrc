
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# reset locale
export LC_ALL='C'
export LANG=en_US.UTF-8

# append to the history file, don't overwrite it
shopt -s histappend

# version control information
vc_info() {
    local HG=$(hg branch 2> /dev/null)
    local GIT=$(git name-rev --name-only HEAD 2> /dev/null)
    local BRANCH=$HG$GIT
    if [ $BRANCH ]; then
        echo "[$BRANCH]"
    fi
}

# output color cache
CYAN="\[\e[0;36m\]"
WHITE="\[\e[0;37m\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
DEFAULT="\[\e[m\]"

# customize prompt information
export PS1="[\t] $CYAN\u $WHITE@ $RED\h$DEFAULT:$GREEN\w$WHITE"'$(vc_info) '"\\$\[$(tput sgr0)\]$DEFAULT "

