# Plugin manager
if [[ -f $HOME/.bin/zgen/zgen.zsh ]]; then
    source $HOME/.bin/zgen/zgen.zsh

    if ! zgen saved; then
      echo "Creating a zgen save"
      zgen load rupa/z
      zgen load olivierverdier/zsh-git-prompt
      zgen load zsh-users/zsh-syntax-highlighting
      zgen load zsh-users/zsh-history-substring-search
      zgen load zsh-users/zsh-completions
      zgen save
    fi
fi

# Globals
export SHELL=`which zsh`
export VISUAL=vim
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1024
export SAVEHIST=1024
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Options
setopt APPEND_HISTORY
setopt AUTO_CD
setopt AUTO_PUSHD
setopt COMPLETE_IN_WORD
setopt EXTENDED_HISTORY
setopt HASH_LIST_ALL
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt NOBEEP
setopt NOCHECK_JOBS
setopt NOHIST_BEEP
setopt NOHUP
setopt NOLIST_BEEP
setopt NONOMATCH
setopt NOTIFY
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt SHARE_HISTORY

# Key bindings
bindkey -v
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Aliases
alias ls='ls -G'
alias ll='ls -l'
alias tmux='tmux -2'

if [[ -f $HOME/.bin/nvm/nvm.sh ]]; then
    source $HOME/.bin/nvm/nvm.sh
fi

if [[ -f $HOME/.pythonz/etc/bashrc ]]; then
    source $HOME/.pythonz/etc/bashrc
fi

if [[ -f $HOME/.local/venvs/virtualenvwrapper/bin/virtualenvwrapper.sh ]]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Development
    export VIRTUALENVWRAPPER_PYTHON=$HOME/.local/venvs/virtualenvwrapper/bin/python
    source $HOME/.local/venvs/virtualenvwrapper/bin/virtualenvwrapper.sh
fi

termcolors() {
    for code in $(seq -w 0 255); do
        for attr in 0 1; do
            printf "%s-%03s %b●%b\n" "${attr}" "${code}" "\e[${attr};38;05;${code}m" "\e[m";
        done;
    done | column -c $((COLUMNS*2))
}

git_super_status() {
    precmd_update_git_vars
    if [ -n "$__CURRENT_GIT_STATUS" ]; then
        if [ "$GIT_CHANGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] && [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_UNTRACKED" -eq "0" ]; then
            STATUS="%F{13}($GIT_BRANCH)%f %F{2}●%f "
        else
            STATUS="%F{13}($GIT_BRANCH)%f %F{1}●%f "
        fi
        echo "$STATUS"
    fi
}

precmd() {
    PROMPT="%B%F{2}➜%b  %B%F{14}%~%b%f $(git_super_status)"
}
