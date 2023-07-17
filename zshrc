# Globals
export SHELL=`which zsh`
export VISUAL=vim
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1024
export SAVEHIST=1024
export GOPATH="$HOME/Code/go"
export GPG_TTY=$(tty)
export PATH="$HOME/.bin:/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

# Options
setopt ALWAYS_TO_END
setopt APPEND_HISTORY
setopt AUTO_CD
setopt AUTO_LIST
setopt AUTO_PUSHD
setopt CHASE_LINKS
setopt COMPLETE_IN_WORD
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt LIST_AMBIGUOUS
setopt NO_BEEP
setopt NO_HUP
setopt NOTIFY
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PROMPT_SUBST
setopt SHARE_HISTORY

# Auto completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' verbose yes

# Key bindings
bindkey -v
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^K' kill-whole-line
bindkey '^L' clear-screen
bindkey "^N" history-search-forward
bindkey "^P" history-search-backward
bindkey "^R" history-incremental-search-backward
bindkey "^F" forward-word
bindkey "^B" backward-word

# Aliases
alias ls='ls -G'
alias ll='ls -l'

# Change command in editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X' edit-command-line

# Rerender prompt on vim mode toggle
function zle-line-init zle-keymap-select {
    set_prompt
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# https://github.com/zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGESTIONS_PATH=$HOME/.bin/repos/zsh-autosuggestions/zsh-autosuggestions.zsh
if [[ -a $ZSH_AUTOSUGGESTIONS_PATH ]]; then
    source $ZSH_AUTOSUGGESTIONS_PATH
fi

# https://github.com/zsh-users/zsh-syntax-highlighting
ZSH_SYNTAX_HIGHLIGHTING_PATH=$HOME/.bin/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if [[ -a $ZSH_SYNTAX_HIGHLIGHTING_PATH ]]; then
    source $ZSH_SYNTAX_HIGHLIGHTING_PATH
fi

# Setup custom prompt
function set_prompt {
    local ins_mode="%F{2}➜  %f"
    local cmd_mode="%F{8}➜  %f"
    local vim_info="${${KEYMAP/vicmd/${cmd_mode}}/(main|viins)/${ins_mode}}"
    local cwd_info="%B%F{6}%~%f%b"
    local git_info="$(git symbolic-ref --short HEAD 2> /dev/null || git rev-parse --short HEAD 2> /dev/null)"

    if [[ -n $git_info ]]; then
        if [[ -n $(git status --porcelain 2> /dev/null) ]]; then
            git_info=" %B%F{1}(${git_info})%f%b"
        else
            git_info=" %B%F{8}(${git_info})%f%b"
        fi
    fi

    PROMPT="${vim_info}${cwd_info}${git_info} "
}

function link_php74 {
    brew link php@7.4 --force --overwrite
}

function link_php81 {
    brew link php@8.1 --force --overwrite
    brew unlink php && brew link php
}

function link_php82 {
    brew link php@8.2 --force --overwrite
    brew unlink php && brew link php
}

set_prompt
