# Variables
EDITOR=nvim
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
GPG_TTY=$(tty)
HISTDUP=erase
HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8
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
setopt AUTO_PUSHD
setopt CHASE_LINKS
setopt COMPLETE_IN_WORD
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY_TIME
setopt LIST_AMBIGUOUS
setopt NO_BEEP
setopt NO_HUP
setopt NOTIFY
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PROMPT_SUBST

# Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' verbose yes

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
FZF_CTRL_T_COMMAND="fd ${FZF_FD_OPTS}"
FZF_ALT_C_COMMAND="fd --type d ${FZF_FD_OPTS}"

_fzf_compgen_path() {
    eval "fd ${FZF_FD_OPTS} . \"${1}\""
}

_fzf_compgen_dir() {
    eval "fd --type d ${FZF_FD_OPTS} . \"${1}\""
}

source <(fzf --zsh)

# Key bindings
bindkey -v
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^K' kill-whole-line
bindkey '^L' clear-screen
bindkey '^X' edit-command-line
bindkey "^B" backward-word
bindkey "^F" forward-word

# Aliases
alias ls='ls -G'
alias ll='ls -l'
alias vim='nvim'
alias lzd='lazydocker'
alias lzg='lazygit'
alias fzp='fzf --style full --preview "bat --color=always --style=numbers --line-range=:500 {}"'

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
