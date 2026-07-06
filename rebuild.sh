#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

ROOTDIR="$(cd "$(dirname "${0}")"; echo "$(pwd)")"
FLAKE="${ROOTDIR}#default"

if command -v darwin-rebuild >/dev/null 2>&1; then
    sudo darwin-rebuild switch --flake "${FLAKE}"
else
    # First run: darwin-rebuild isn't on PATH yet, bootstrap it via nix.
    echo "darwin-rebuild not found — bootstrapping via 'nix run nix-darwin'..."
    sudo nix run nix-darwin -- switch --flake "${FLAKE}"
fi
