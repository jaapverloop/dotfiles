source ~/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle brew
antigen bundle git
antigen bundle pip
antigen bundle sublime
antigen bundle tmux
antigen bundle vagrant
antigen bundle vi-mode
antigen bundle vundle
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme ys
antigen apply

export PATH="/usr/local/bin:/usr/local/sbin:${PATH}"
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

alias ls="ls -G"
alias tmux="tmux -2"

# Pythonz
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# virtualenvwrapper
if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Development
    source /usr/local/bin/virtualenvwrapper.sh
fi

