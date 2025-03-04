# Variables
export EDITOR=nvim
export GPG_TTY=$(tty)
export HISTDUP=erase
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=5000
export LANG=en_US.UTF-8
export LC_ALL=$LANG
export PATH="$HOME/.config/bin"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/bin"
export PATH="$PATH:/sbin"
export SAVEHIST=$HISTSIZE
export VISUAL=$EDITOR

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
autoload -Uz compinit && compinit
zmodload zsh/complist
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select=2

# Setup Oh My Posh (prompt theme engine)
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.json)"
fi

# Make it possible to change a command in Neovim
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

# Setup fzf (command-line fuzzy-finder)
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --style full --border top'
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

# Setup Zoxide (a smarter cd command)
eval "$(zoxide init zsh)"

# Aliases
alias cd='z'
alias lf='ls --long --all'
alias la='ll --all'
alias ll='ls --long --no-permissions --no-user --no-time --no-filesize'
alias ls='eza --color=always --icons=always --group-directories-first'
alias lzd='lazydocker'
alias lzg='lazygit'
alias vim='nvim'

# Shell wrapper which automatically moves into the directory when exiting yazi.
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
