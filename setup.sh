#!/usr/bin/env bash

set -o errexit
set -o nounset

START=$(date +%s)
ROOTDIR="$(cd "$(dirname "${0}")"; echo $(pwd))"

# install xcode
xcode-select --install

# install brew
if [[ $(command -v brew) == "" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# disable brew analytics
brew analytics off

# add other repositories to brew
brew tap shivammathur/php
brew tap shivammathur/extensions

# install packages with brew
brew install \
    bat \
    composer \
    curl \
    fd \
    fzf \
    git \
    git-delta \
    gnupg \
    gpg2 \
    htop \
    jesseduffield/lazydocker/lazydocker \
    jesseduffield/lazygit/lazygit \
    mariadb \
    neovim \
    ngrok \
    nnn \
    node \
    node-sass \
    oh-my-posh \
    pinentry-mac \
    python@3.9 \
    rar \
    redis \
    ripgrep \
    shivammathur/extensions/xdebug@7.4 \
    shivammathur/extensions/xdebug@8.1 \
    shivammathur/extensions/xdebug@8.2 \
    shivammathur/php/php@7.4 \
    shivammathur/php/php@8.1 \
    shivammathur/php/php@8.2 \
    sqlite \
    tmux \
    tokei \
    zellij \
    zoxide \
    zsh

# install apps with brew
brew install --cask \
    alacritty \
    boostnote \
    bruno \
    displaylink \
    docker \
    dropbox \
    figma \
    firefox \
    flux \
    fork \
    google-chrome \
    imageoptim \
    keeweb \
    microsoft-outlook \
    microsoft-teams \
    postman \
    raycast \
    sequel-ace \
    signal \
    slack \
    spotify \
    sublime-text \
    telegram \
    transmit \
    visual-studio-code \
    vlc \
    webtorrent \
    whatsapp

pushd ${HOME}
    # setup zsh
    rm -f .zshrc
    ln -s ${ROOTDIR}/zshrc .zshrc

    # setup nvim
    rm -rf .config/nvim
    mkdir -p .config
    ln -s ${ROOTDIR}/nvim .config/nvim

    # setup git
    rm -f .gitconfig
    rm -f .gitignore
    ln -s ${ROOTDIR}/gitconfig .gitconfig
    ln -s ${ROOTDIR}/gitignore .gitignore

    # setup alacritty
    rm -rf .config/alacritty
    mkdir -p .config
    ln -s ${ROOTDIR}/alacritty .config/alacritty

    # setup zellij
    rm -rf .config/zellij
    mkdir -p .config
    ln -s ${ROOTDIR}/zellij .config/zellij

    # setup bat
    rm -rf .config/bat
    mkdir -p .config
    ln -s ${ROOTDIR}/bat .config/bat

    # setup tmux
    rm -f .tmux.conf
    ln -s ${ROOTDIR}/tmux.conf .tmux.conf

    # custom oh-my-posh theme
    ln -s ${ROOTDIR}/prompt.omp.json .prompt.omp.json

    # turn off the login banner
    touch .hushlogin

    # setup other commandline tools in .bin folder
    python3 -m venv .venv

    source .venv/bin/activate

    pip install --upgrade pip
    pip install Fabric3
    pip install ansible
    pip install Sphinx
    pip install sphinx-rtd-theme

    deactivate

    mkdir -p .bin

    pushd .bin
        composer global require psy/psysh
        composer global require friendsofphp/php-cs-fixer

        mkdir -p repos

        pushd repos
            git clone https://github.com/zsh-users/zsh-autosuggestions.git || true
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git || true
        popd

        ln -sf ${HOME}/.venv/bin/fab
        ln -sf ${HOME}/.venv/bin/ansible-vault
        ln -sf ${HOME}/.venv/bin/sphinx-build
        ln -sf ${HOME}/.venv/bin/sphinx-quickstart
        ln -sf ${HOME}/.composer/vendor/bin/psysh
        ln -sf ${HOME}/.composer/vendor/bin/php-cs-fixer
    popd
popd

DONE=$(date +%s)
DIFF=$((${DONE} - ${START}))

echo
echo "Done, time established: ${DIFF} seconds"
echo
