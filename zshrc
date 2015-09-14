# Manage plugins with ZGEN
if [[ -f $HOME/.dotfiles/zgen/zgen.zsh ]]; then
    source $HOME/.dotfiles/zgen/zgen.zsh

    if ! zgen saved; then
      echo "Creating a zgen save"
      zgen load zsh-users/zsh-syntax-highlighting
      zgen load mafredri/zsh-async
      zgen load sindresorhus/pure
      zgen save
    fi
fi

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export VISUAL=vim
export EDITOR=vim
export LANG=en_US.UTF-8
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# Aliases
alias ls='ls -G'
alias ll='ls -l'

# VIM bindings
bindkey -v

# History file
HISTFILE=~/.zsh_history
HISTSIZE=1024
SAVEHIST=1024

# ZSH options
# See http://zsh.sourceforge.net/Doc/Release/Options.html
setopt APPEND_HISTORY
setopt AUTO_CD
setopt AUTO_PUSHD
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt NOMATCH
setopt NOTIFY
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt SHARE_HISTORY
unsetopt BEEP
unsetopt CHECK_JOBS
unsetopt HIST_BEEP
unsetopt HUP
unsetopt LIST_BEEP

if [[ -f $HOME/.fzf.zsh ]]; then
    source $HOME/.fzf.zsh
fi

if [[ -f $HOME/.nvm/nvm.sh ]]; then
    source $HOME/.nvm/nvm.sh
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

# Print the 256 terminal colors (normal and bright)
termcolors() {
    for code in $(seq -w 0 255); do
        for attr in 0 1; do
            printf "%s-%03s %b●%b\n" "${attr}" "${code}" "\e[${attr};38;05;${code}m" "\e[m";
        done;
    done | column -c $((COLUMNS*2))
}
