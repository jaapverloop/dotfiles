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
    node \
    node-sass \
    oh-my-posh \
    pinentry-mac \
    python@3.9 \
    rar \
    redis \
    ripgrep \
    shivammathur/extensions/xdebug@8.4 \
    shivammathur/php/php@8.4 \
    sqlite \
    tlrc \
    tmux \
    tokei \
    yazi \
    zellij \
    zoxide \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting

# Install apps with brew
brew install --cask \
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
    ghostty \
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

# Install yazi theme
ya pack -a yazi-rs/flavors:catppuccin-mocha

CONFIG_FILES=(
    .editorconfig
    .hushlogin
    .zshrc
)

CONFIG_DIRS=(
    bat
    delta
    ghostty
    git
    nvim
    oh-my-posh
    tmux
    yazi
    zellij
)

pushd ${HOME}
    # Link config files
    for CONFIG_FILE in "${CONFIG_FILES[@]}"
    do
        rm -f ${CONFIG_FILE}
        ln -s ${ROOTDIR}/${CONFIG_FILE}
    done

    # Create config dirs
    mkdir -p .config/bin

    pushd .config
        # Link config dirs
        for CONFIG_DIR in "${CONFIG_DIRS[@]}"
        do
            rm -rf ${CONFIG_DIR}
            ln -s ${ROOTDIR}/${CONFIG_DIR}
        done

        # Install Python tools in a virtualenv
        python3 -m venv python-tools

        source python-tools/bin/activate

        pip install --upgrade pip
        pip install ansible
        pip install Fabric3
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
