# Variables
EDITOR=nvim
GPG_TTY=$(tty)
HISTDUP=erase
HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
LANG=en_US.UTF-8
LC_ALL=$LANG
PATH="$HOME/.bin"
PATH="$PATH:/bin"
PATH="$PATH:/opt/homebrew/bin"
PATH="$PATH:/sbin"
PATH="$PATH:/usr/bin"
PATH="$PATH:/usr/local/bin"
PATH="$PATH:/usr/sbin"
SAVEHIST=$HISTSIZE
VISUAL=nvim

# Export variables
export GPG_TTY
export LANG
export LC_ALL
export PATH

# Options
setopt ALWAYS_TO_END
setopt APPEND_HISTORY
setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_PARAM_SLASH
setopt AUTO_PUSHD
setopt CHASE_LINKS
setopt COMPLETE_IN_WORD
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt LIST_AMBIGUOUS
setopt NO_BEEP
setopt NO_HUP
setopt NOTIFY
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt SHAREHISTORY

# Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Completion
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select=2
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' verbose yes
zmodload zsh/complist
compinit

# Make it possible to change a command in an editor
autoload -U edit-command-line
zle -N edit-command-line

# Use Oh My Posh as prompt
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.prompt.omp.json)"
fi

# Set up fzf
FZF_FD_OPTS="--hidden --follow --exclude \".git\""
FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top'
FZF_DEFAULT_COMMAND="fd ${FZF_FD_OPTS}"
FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
FZF_ALT_C_COMMAND="fd ${FZF_FD_OPTS} --type d"

_fzf_compgen_path() {
    eval "fd ${FZF_FD_OPTS} . \"${1}\""
}

_fzf_compgen_dir() {
    eval "fd ${FZF_FD_OPTS} --type d . \"${1}\""
}

source <(fzf --zsh)

# Set up Zoxide
eval "$(zoxide init zsh)"

# Key bindings
bindkey -v
bindkey '^A' beginning-of-line
bindkey '^B' backward-word
bindkey '^E' end-of-line
bindkey '^F' forward-word
bindkey '^K' kill-whole-line
bindkey '^L' clear-screen
bindkey '^X' edit-command-line
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Aliases
alias cd='z'
alias fzp='fzf --style full --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias ll='ls -l'
alias ls='ls --color'
alias lzd='lazydocker'
alias lzg='lazygit'
alias vim='nvim'

# Util functions
function link_php74 {
    brew unlink php
    brew unlink php@7.4
    brew link php@7.4 --force --overwrite
}

function link_php81 {
    brew unlink php
    brew unlink php@8.1
    brew link php@8.1 --force --overwrite
}

function link_php82 {
    brew unlink php
    brew unlink php@8.2
    brew link php@8.2 --force --overwrite
}
