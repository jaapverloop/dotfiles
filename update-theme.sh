#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

ROOTDIR="$(cd "$(dirname "${0}")"; echo "$(pwd)")"

cd "${ROOTDIR}"

# Update Catppuccin theme files
mkdir -p {bat,delta,ghostty}/themes
curl -Lo bat/themes/catppuccin-mocha.tmTheme https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
curl -Lo delta/themes/catppuccin.gitconfig https://github.com/catppuccin/delta/raw/main/catppuccin.gitconfig
curl -Lo ghostty/themes/catppuccin-mocha.conf https://github.com/catppuccin/ghostty/raw/main/themes/catppuccin-mocha.conf
curl -Lo yazi/theme.toml https://github.com/catppuccin/yazi/raw/main/themes/macchiato/catppuccin-macchiato-blue.toml
sed -i '' 's#~/.config/yazi/Catppuccin-macchiato.tmTheme#~/.config/bat/themes/catppuccin-mocha.tmTheme#' yazi/theme.toml

# Add warp cursor
curl -Lo ghostty/cursor_warp.glsl https://github.com/sahaj-b/ghostty-cursor-shaders/raw/main/cursor_warp.glsl
