
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

# Ignore compiled files on vi/vim completion
zstyle ':completion:*:*:(vi|vim|mvim|mvimt):*:*files' ignored-patterns '*.(a|dylib|so|o|pyc)'

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install


# enable shared history
setopt inc_append_history
setopt share_history

# enable Ctrl-D to logout
setopt NOIGNORE_EOF

# enable  Ctrl-R for history search
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

# enable colors
autoload -U colors && colors
export CLICOLOR=1

# version control information
vc_info() {
    local HG=$(hg branch 2> /dev/null)
    local GIT=$(git name-rev --name-only HEAD 2> /dev/null)
    local BRANCH=$HG$GIT
    if [ $BRANCH ]; then
        echo "[$BRANCH] "
    fi
}

# evaluate prompt
setopt PROMPT_SUBST

# customize prompt information
PROMPT='%F{white}[%*] %F{cyan}%n %F{red}@ %F{cyan}%M%F{white}:%F{green}%~ %F{white}$(vc_info)%F{default}%# '
#        HH:MM:SS ^           ^     full hostname ^                    ^            ^                      ^
#                   $USERNAME ^                      current directory ^            ^                      ^
#                                                                       branch name ^     shell privileges ^
RPROMPT='%F{22}%?%F{default}'
#         ^ last exit code

