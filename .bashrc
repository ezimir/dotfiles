
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# reset locale
export LC_ALL='C'
export LANG=en_US.UTF-8

# version control information
vc_info() {
    local HG=$(hg branch 2> /dev/null)
    local GIT=$(git name-rev --name-only HEAD 2> /dev/null)
    local BRANCH=$HG$GIT
    if [ $BRANCH ]; then
        echo "[$BRANCH]"
    fi
}

# customize prompt information
export PS1='[\t] \e[0;36m\u \e[0;37m@ \e[0;31m\h\e[m:\e[0;32m\w\e[0;37m$(vc_info) \\$\[$(tput sgr0)\]\e[m '
