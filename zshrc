# Variables
EDITOR=nvim
GPG_TTY=$(tty)
HISTDUP=erase
HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
LANG=en_US.UTF-8
LC_ALL=$LANG
PATH="$HOME/.bin"
PATH="$PATH:/opt/homebrew/bin"
PATH="$PATH:/usr/local/bin"
PATH="$PATH:/usr/bin"
PATH="$PATH:/bin"
PATH="$PATH:/usr/sbin"
PATH="$PATH:/sbin"
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
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Completion
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select=2
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' verbose yes
zmodload zsh/complist
compinit

# Use Oh My Posh as prompt
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.prompt.omp.json)"
fi

# Make it possible to change a command in an editor
autoload -U edit-command-line
zle -N edit-command-line

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

# Set up fzf
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--style full --height 60% --margin 2,4 --padding 1 --border'
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude \".git\""
export FZF_CTRL_T_OPTS="--preview 'bat --number --color=always --line-range :500 {}'"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND} --type f"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
export FZF_ALT_C_COMMAND="${FZF_DEFAULT_COMMAND} --type d"

_fzf_compgen_path() {
    eval "${FZF_CTRL_T_COMMAND} . \"${1}\""
}

_fzf_compgen_dir() {
    eval "${FZF_ALT_C_COMMAND} . \"${1}\""
}

# Set up Zoxide
eval "$(zoxide init zsh)"

# Aliases
alias cd='z'
alias la='ll --all'
alias ll='ls --long'
alias ls='eza --color=always --icons=always --no-permissions --no-user --no-time --no-filesize'
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
