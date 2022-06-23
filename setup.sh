#!/usr/bin/env bash

set -o errexit
set -o nounset

START=$(date +%s)
ROOTDIR="$(cd "$(dirname "${0}")"; echo $(pwd))"

# install packages with brew
brew install \
    zsh \
    tmux \
    git \
    vim \
    curl \
    sqlite \
    mariadb \
    redis \
    mailhog \
    node \
    node-sass \
    python@3.9 \
    php@7.4 \
    php@8.0 \
    composer \
    gpg2 \
    gnupg \
    pinentry-mac

# install apps with brew
brew install --cask \
    alfred \
    boostnote \
    dbeaver-community \
    docker \
    dropbox \
    flux \
    fork \
    google-chrome \
    imageoptim \
    iterm2 \
    keeweb \
    microsoft-teams \
    postman \
    sequel-ace \
    sequel-pro \
    spectacle \
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

    # setup vim
    rm -rf .vim
    rm -f .vimrc
    ln -s ${ROOTDIR}/vim .vim
    ln -s ${ROOTDIR}/vimrc .vimrc

    # setup git
    rm -f .gitconfig
    rm -f .gitignore
    ln -s ${ROOTDIR}/gitconfig .gitconfig
    ln -s ${ROOTDIR}/gitignore .gitignore

    # setup tmux
    rm -f .tmux.conf
    ln -s ${ROOTDIR}/tmux.conf .tmux.conf

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

        git clone https://github.com/zsh-users/zsh-autosuggestions.git || true
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git || true
        git clone https://github.com/so-fancy/diff-so-fancy.git || true

        ln -sf ${HOME}/.venv/bin/fab
        ln -sf ${HOME}/.venv/bin/ansible-vault
        ln -sf ${HOME}/.venv/bin/sphinx-build
        ln -sf ${HOME}/.venv/bin/sphinx-quickstart
        ln -sf ${HOME}/.composer/vendor/bin/psysh
        ln -sf ${HOME}/.composer/vendor/bin/php-cs-fixer
        ln -sf ${HOME}/.bin/diff-so-fancy/diff-so-fancy diff
    popd
popd

DONE=$(date +%s)
DIFF=$((${DONE} - ${START}))

echo
echo "Done, time established: ${DIFF} seconds"
echo
