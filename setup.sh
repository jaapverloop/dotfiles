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
    glow \
    gnupg \
    gpg2 \
    htop \
    hunk \
    jesseduffield/lazydocker/lazydocker \
    jesseduffield/lazygit/lazygit \
    jq \
    mariadb \
    neovim \
    ngrok \
    node \
    node-sass \
    oh-my-posh \
    pass \
    phpantom-lsp \
    pkgconf \
    pinentry-mac \
    psysh \
    python@3.14 \
    redis \
    ripgrep \
    shivammathur/extensions/xdebug@8.5 \
    shivammathur/php/php@8.5 \
    sqlite \
    tlrc \
    tmux \
    tokei \
    tree-sitter-cli \
    yazi \
    zellij \
    zoxide \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting

# Install apps with brew
brew install --cask \
    boostnote \
    claude-code \
    displaylink \
    docker-desktop \
    dropbox \
    figma \
    firefox \
    flux \
    font-caskaydia-cove-nerd-font \
    fork \
    ghostty \
    google-chrome \
    keeweb \
    microsoft-outlook \
    microsoft-teams \
    postman \
    phpstorm \
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
        pip install fabric
        pip install invoke
        pip install python-dotenv
        pip install Sphinx
        pip install sphinx-rtd-theme

        deactivate
    popd

    pushd .config/bin
        ln -sf ${HOME}/.config/python-tools/bin/ansible-vault
        ln -sf ${HOME}/.config/python-tools/bin/fab
        ln -sf ${HOME}/.config/python-tools/bin/sphinx-build
        ln -sf ${HOME}/.config/python-tools/bin/sphinx-quickstart
    popd
popd

DONE=$(date +%s)
DIFF=$((${DONE} - ${START}))

echo
echo "Done, time established: ${DIFF} seconds"
echo
