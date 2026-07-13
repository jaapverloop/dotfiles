#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

ROOTDIR="$(cd "$(dirname "${0}")"; echo "$(pwd)")"
FLAKE="${ROOTDIR}#default"

if ! command -v darwin-rebuild >/dev/null 2>&1; then
    echo "darwin-rebuild not found — bootstrapping..."
    sudo nix run nix-darwin -- switch --flake "${FLAKE}"
    echo "Bootstrap complete, but darwin-rebuild isn't on your PATH yet."
    echo "Open a new terminal, then run this script again to finish."
    exit 0
fi

sudo darwin-rebuild switch --flake "${FLAKE}"

CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
config_dirs=(bat delta ghostty git nvim oh-my-posh tmux yazi)
config_files=(.editorconfig .hushlogin)

mkdir -p "${CONFIG_HOME}"
for d in "${config_dirs[@]}"; do ln -sfn "${ROOTDIR}/${d}" "${CONFIG_HOME}/${d}"; done
for f in "${config_files[@]}"; do ln -sfn "${ROOTDIR}/${f}" "${HOME}/${f}"; done
