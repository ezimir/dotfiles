
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi



# customize prompt information
export PS1='[\t] \e[0;36m\u \e[0;37m@ \e[0;31m\h\e[m:\e[0;32m\w \e[0;37m\\$\[$(tput sgr0)\]\e[m '
