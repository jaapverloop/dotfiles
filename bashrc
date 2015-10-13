export VISUAL=vim
export EDITOR=vim
export LANG=en_US.UTF-8
export HISTCONTROL=ignoreboth
export HISTSIZE=1024
export HISTFILESIZE=1024
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

set -o vi
shopt -s histappend
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
