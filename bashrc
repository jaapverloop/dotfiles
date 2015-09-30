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

if [[ -f $HOME/.fzf.bash ]]; then
    source $HOME/.fzf.bash
fi

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

if [[ -f $HOME/.dotfiles/sexy-bash-prompt/.bash_prompt ]]; then
    PROMPT_USER_COLOR="$(tput setaf 197)"
    PROMPT_PREPOSITION_COLOR="$(tput setaf 255)"
    PROMPT_DEVICE_COLOR="$(tput setaf 202)"
    PROMPT_DIR_COLOR="$(tput setaf 35)"
    PROMPT_GIT_STATUS_COLOR="$(tput setaf 24)"
    PROMPT_GIT_PROGRESS_COLOR="$(tput setaf 30)"
    PROMPT_SYMBOL_COLOR="$(tput setaf 255)"
    PROMPT_SYNCED_SYMBOL=""
    PROMPT_DIRTY_SYNCED_SYMBOL="*"
    PROMPT_UNPUSHED_SYMBOL="↑"
    PROMPT_DIRTY_UNPUSHED_SYMBOL="*↑"
    PROMPT_UNPULLED_SYMBOL="↓"
    PROMPT_DIRTY_UNPULLED_SYMBOL="*↓"
    PROMPT_UNPUSHED_UNPULLED_SYMBOL="*↑↓"
    PROMPT_DIRTY_UNPUSHED_UNPULLED_SYMBOL="*↑↓"
    PROMPT_SYMBOL="➜"
    source $HOME/.dotfiles/sexy-bash-prompt/.bash_prompt
fi
