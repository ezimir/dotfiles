
# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original false
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/Users/martin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Allow completion on aliases
setopt complete_aliases

# Allow bash style comments (`#comment`)
setopt interactivecomments

# Ignore compiled files on vi/vim completion
zstyle ':completion:*:*:(vi|vim|mvim|mvimt):*:*files' ignored-patterns '*.(a|dylib|so|o|pyc)'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# enable type correction sugestions
setopt correct

# suggest package installation if command is not found
if [ -f /etc/zsh_command_not_found ]; then
    source /etc/zsh_command_not_found
fi

# enable shared history
setopt inc_append_history
setopt share_history

# enable Ctrl-D to logout
setopt NOIGNORE_EOF

# enable  Ctrl-R for history search
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

# fix keys for Guake terminal
EMULATOR=$(ps -o 'cmd=' -p `ps -o 'ppid=' -p $$`)
if [[ $EMULATOR =~ "guake" ]]; then
    bindkey ";5C" forward-word
    bindkey ";5D" backward-word

fi

# update window title
case $TERM in
  xterm*)
    # when directory changes
    precmd () {
        print -Pn "\e]0;%~\a"
    }
    # when process starts
    preexec () {
        print -Pn "\e]0;$1\a"
    }
    ;;
esac

# enable colors
autoload -U colors && colors
export CLICOLOR=1


# version control information
dir_exists() {
    local target_dir=${1:a}
    local target_path="$target_dir/$2"
    if [ -d "$target_path" ]; then
        echo "exists"
    else
        local parent_dir=$(dirname $target_dir)
        if [ $parent_dir != "/" ]; then
            dir_exists $parent_dir $2
        fi
    fi
}
vc_info() {
    local hgdir=$(dir_exists pwd .hg)
    local gitdir=$(dir_exists pwd .git)
    if [ $hgdir ]; then
        local branch=$(hg branch 2> /dev/null)
    elif [ $gitdir ]; then
        local branch=$(git branch 2> /dev/null | grep \* | cut -d ' ' -f2)
    fi
    if [ $branch ]; then
        echo "[$branch] "
    fi
}

# evaluate prompt
setopt PROMPT_SUBST

# customize prompt information
PROMPT='%F{white}[%*] %F{cyan}%n %F{red}@ %F{cyan}%M%F{white}:%F{green}%~ %F{white}$(vc_info)%F{default}%# '
#        HH:MM:SS ^           ^     full hostname ^                    ^            ^                    ^
#                   $USERNAME ^                      current directory ^            ^                    ^
#                                                                       branch name ^   shell privileges ^
RPROMPT='%F{22}%?%F{default}'
#         ^ last exit code

# colorize man output
man() {
    LESS_TERMCAP_mb=$'\e[1;31m' \
    LESS_TERMCAP_md=$'\e[1;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[1;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[1;32m' \
    command man "$@"
}

# colorize ls output and add shortcuts
alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .*'

# VIRTUALENV

venvwrap="virtualenvwrapper_lazy.sh"
/usr/bin/which -s $venvwrap
if [ $? -eq 0 ]; then
    venvwrap=`/usr/bin/which $venvwrap`
    source $venvwrap
fi

# ALIASES

# vim
alias vimh='function VimHelp() { vim -c ":help $1 | :only" };VimHelp'
alias mvimh='function VimHelp() { mvim -c ":help $1 | :only" };VimHelp'
alias vimt='vim --remote-tab-silent'
alias mvimt='mvim --remote-tab-silent'

alias django="python manage.py"

if command -v direnv 1>/dev/null 2>&1; then
  # evaluate local .envrc files via direnv
  eval "$(direnv hook zsh)"
fi

# enable pyenv
export PATH="/home/martin/.pyenv/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

