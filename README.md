# Dotfiles

This repository contains my personal dotfiles.


## Installation

Open a terminal and execute the following commands:

```sh
git clone https://github.com/jaapverloop/dotfiles.git
cd dotfiles
xcode-select --install
sudo softwareupdate --install-rosetta
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/bin/bash setup.sh
```


## Update

Open a terminal and execute the following commands:

```sh
cd dotfiles
git pull
/bin/bash setup.sh
```


## Note

I use the iTerm2 terminal with the [One Dark] color scheme.


## License

MIT, see **LICENSE** for more details.


[One Dark]: https://github.com/joshdick/onedark.vim/blob/main/term/One%20Dark.itermcolors

