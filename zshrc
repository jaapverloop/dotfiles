source ~/.dotfiles/zsh-git-prompt/zshrc.sh
# Manage plugins with ZGEN
if [[ -f $HOME/.dotfiles/zgen/zgen.zsh ]]; then
    source $HOME/.dotfiles/zgen/zgen.zsh

    if ! zgen saved; then
      echo "Creating a zgen save"
      zgen load zsh-users/zsh-syntax-highlighting
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
            STATUS="%F{044}($GIT_BRANCH)%f %F{035}●%f "
        else
            STATUS="%F{044}($GIT_BRANCH)%f %F{160}●%f "
        fi
        echo "$STATUS"
    fi
}

precmd() {
    PROMPT="%B%F{035}➜%b  %B%F{039}%~%b%f $(git_super_status)"
}
