
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi



# mercurial utility functions
hg_branch() {
    hg branch 2> /dev/null
}
hg_ps1() {
    if [ $(hg_branch) ]; then
        echo "[$(hg_branch)]"
    fi
}

# customize prompt information
export PS1='[\t] \e[0;36m\u \e[0;37m@ \e[0;31m\h\e[m:\e[0;32m\w\e[0;37m$(hg_ps1) \\$\[$(tput sgr0)\]\e[m '
