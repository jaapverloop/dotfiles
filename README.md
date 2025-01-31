# Dotfiles

This repository contains my personal dotfiles.

> [!NOTE]
> Tailered for a machine running macOS.

## Installation

Open a terminal, navigate to the folder where you want to clone this repository,
and execute the following commands:

```sh
git clone https://github.com/jaapverloop/dotfiles.git
cd dotfiles
bash setup.sh
```

## Update

Open a terminal, navigate to the folder where this repository is cloned, and
execute the following commands:

```sh
cd dotfiles
git pull
bash setup.sh
```

## Font

This repository uses the CaskaydiaCove Nerd Font. To install this font, open a
terminal and execute the following command and select the font.

```sh
oh-my-post font install
```

## Catppuccin themes

This repository uses the Catppuccin theme. To update the theme files, open a
terminal, navigate to the folder where this repository is cloned and execute the
following commands.

```sh
cd dotfiles
curl -Lo alacritty/catppuccin-mocha.toml https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml
curl -Lo bat/themes/catppuchin-mocha.tmTheme https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
curl -Lo delta/themes/catppuccin.gitconfig https://github.com/catppuccin/delta/raw/main/catppuccin.gitconfig
```

## GPG Signing

* Here you can find instuctions to setup [GPG Signing].

## License

MIT, see **LICENSE** for more details.

[GPG Signing]: https://gist.github.com/troyfontaine/18c9146295168ee9ca2b30c00bd1b41e
