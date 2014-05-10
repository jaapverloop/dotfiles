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

alias ls="ls -G"
alias tmux="tmux -2"

# Pythonz
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# virtualenvwrapper
if [[ `id -u` != '0' && -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
    export VIRTUALENV_USE_DISTRIBUTE=1
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export PIP_RESPECT_VIRTUALENV=true
fi
