#!/usr/bin/env bash

set -o errexit
set -o nounset

START=$(date +%s)
ROOTDIR="$(cd "$(dirname "${0}")"; echo $(pwd))"

# Install xcode
xcode-select --install || true

# Install brew
if [[ $(command -v brew) == "" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Disable brew analytics
brew analytics off

# Add other repositories to brew
brew tap shivammathur/php
brew tap shivammathur/extensions

# Install packages with brew
brew install \
    bat \
    composer \
    curl \
    eza \
    fd \
    fzf \
    git \
    git-delta \
    git-lfs \
    gnupg \
    gpg2 \
    htop \
    jesseduffield/lazydocker/lazydocker \
    jesseduffield/lazygit/lazygit \
    jq \
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
    tlrc \
    tmux \
    tokei \
    zellij \
    zoxide \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting

# Install apps with brew
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
    font-caskaydia-cove-nerd-font \
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

CONFIG_DIRS=(
    alacritty
    bat
    delta
    git
    nvim
    oh-my-posh
    tmux
    zellij
)

pushd ${HOME}
    # Turn off the login banner
    touch .hushlogin

    # Link config file zsh
    rm -f .zshrc
    ln -s ${ROOTDIR}/zsh/zshrc .zshrc

    # Create config dirs
    mkdir -p .config/bin

    pushd .config
        # Link config dirs
        for CONFIG_DIR in "${CONFIG_DIRS[@]}"
        do
            rm -rf ${CONFIG_DIR}
            ln -s ${ROOTDIR}/${CONFIG_DIR} ${CONFIG_DIR}
        done

        # Install Python tools in a virtualenv
        python3 -m venv python-tools

        source python-tools/bin/activate

        pip install --upgrade pip
        pip install Fabric3
        pip install ansible
        pip install Sphinx
        pip install sphinx-rtd-theme

        deactivate
    popd

    # Install PHP tools
    composer global require psy/psysh
    composer global require friendsofphp/php-cs-fixer

    pushd .config/bin
        ln -sf ${HOME}/.config/python-tools/bin/fab
        ln -sf ${HOME}/.config/python-tools/bin/ansible-vault
        ln -sf ${HOME}/.config/python-tools/bin/sphinx-build
        ln -sf ${HOME}/.config/python-tools/bin/sphinx-quickstart
        ln -sf ${HOME}/.composer/vendor/bin/psysh
        ln -sf ${HOME}/.composer/vendor/bin/php-cs-fixer
    popd
popd

DONE=$(date +%s)
DIFF=$((${DONE} - ${START}))

echo
echo "Done, time established: ${DIFF} seconds"
echo
