SCRIPTPATH=$(cd "$(dirname "${0}")"; echo $(pwd))

source $SCRIPTPATH/.base16-shell/base16-summerfruit.dark.sh
source $SCRIPTPATH/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle brew
antigen bundle git
antigen bundle jump
antigen bundle pip
antigen bundle sublime
antigen bundle tmux
antigen bundle vagrant
antigen bundle vi-mode
antigen bundle vundle
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme ys
antigen apply

bindkey "^R" history-incremental-search-backward

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

alias ls="ls -G"
alias tmux="tmux -2"

# nvm
if [[ -f $(brew --prefix nvm)/nvm.sh ]]; then
    export NVM_DIR="$HOME/.nvm"
    source $(brew --prefix nvm)/nvm.sh
fi

# pythonz
if [[ -f $HOME/.pythonz/etc/bashrc ]]; then
    source $HOME/.pythonz/etc/bashrc
fi

# virtualenvwrapper
if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Development
    source /usr/local/bin/virtualenvwrapper.sh
fi
