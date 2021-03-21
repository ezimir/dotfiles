
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
setopt append_history hist_ignore_all_dups
setopt autocd extendedglob nomatch notify
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

RUN_CD_TITLE=0
RUN_PROMPT=0

EMULATOR=$(ps -h -o comm -p `ps -h -o ppid -p $$`)
if [[ $EMULATOR == (guake|kitty) ]];
then
    # fix ctrl-arrow keys
    bindkey ";5C" forward-word
    bindkey ";5D" backward-word

    RUN_CD_TITLE=1 # enable to use in precmd below
fi

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
if [ `cat /proc/sys/kernel/hostname` != "thinkbox" ]; then
    PROMPT='%F{white}[%*] %F{cyan}%n %F{red}@ %F{cyan}%M%F{white}:%F{green}%~ %F{white}$(vc_info)%F{default}%# '
    #        HH:MM:SS ^           ^     full hostname ^                    ^            ^                    ^
    #                   $USERNAME ^                      current directory ^            ^                    ^
    #                                                                       branch name ^   shell privileges ^

    RPROMPT='%F{22}%?%F{default}'
    #         ^ last exit code
else
    PROMPT="%F{cyan}λ%F{default} "
    #                ^ branch, if available

    RPROMPT='%F{22}%? %F{white}$(vc_info)[%*]%F{default}'
    #              ^ last exit code
    #                              ^ HH:MM:SS

    RUN_PROMPT=1
fi

# prepare variables for lambda prompt
LAST_CWD=`pwd`
FIRST=0
if [ "$LAST_CWD" = "$HOME" ]; then
    FIRST=1
fi

# register empty command
EMPTY=1
accept-line-empty () {
    if [ ${#${(z)BUFFER}} -eq 0 ]; then
        EMPTY=0
    fi
    zle accept-line
}

zle -N accept-line-empty
bindkey '^M' accept-line-empty

precmd () {
    # update window title
    # when directory changes
    if [ "$RUN_CD_TITLE" -eq 1 ]; then
        print -Pn "\e]0;%~\a"
    fi

    # print extra info line (before PROMPT)
    if [ "$RUN_PROMPT" -eq 1 ]; then
        CUR_CWD=`pwd`
        # only printed if changed
        # or if first is different than $HOME
        # or if previous command was empty
        if [ "$CUR_CWD" != "$LAST_CWD" ] || [ "$FIRST" -eq "0" ] || [ "$EMPTY" -eq "0" ]; then
            print -rP "%F{green}%~"
            #                   ^ current directory
            LAST_CWD=$CUR_CWD
            FIRST=1
            EMPTY=1
        fi
    fi
}
preexec () {
    # update window title
    # when process starts
    if [ "$RUN_CD_TITLE" -eq 1 ]; then
        print -Pn "\e]0;${~1:gs/%/%%}\a"
    fi
}

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

# shortcut for django's manage.py
alias django="python manage.py"

# opening vim
alias vimh='function VimHelp() { vim -c ":help $1 | :only" };VimHelp'
alias mvimh='function VimHelp() { mvim -c ":help $1 | :only" };VimHelp'
alias vimt='vim --remote-tab-silent'
alias mvimt='mvim --remote-tab-silent'
alias gvim="x-terminal-emulator --title vim --start-as maximized vim"

# generate 5 word password
function WordPasswordToClipboard()
{
    shuf -n 5 /usr/share/dict/words | cut -f1 -d"'" | tr '[:upper:]' '[:lower:]' | paste -sd "-" - | xclip -selection c
    echo 'Password copied to clipboard. Use Ctrl-v to paste it.'
}
alias pass5=WordPasswordToClipboard

# enable fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
export FZF_DEFAULT_COMMAND="ag -U -p ~/.ignore -g ''"
export FZF_DEFAULT_OPTS="
--preview-window right:60%
--preview '([[ -f {} ]] && (batcat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || (echo {} | fold -w $(expr $(tput cols) \/ 100 \* 60)) 2> /dev/null | head -200'
--bind '?:toggle-preview'"
export FZF_ALC_C_COMMAND="ag /"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# completion for kitty
if [[ $EMULATOR == kitty ]]; then
    kitty + complete setup zsh | source /dev/stdin
fi

# enable automatic direnv
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

# enable ssh-agent and auto add keys
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

# force vim as editor
export EDITOR=vim
