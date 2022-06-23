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


## Notes

* I use the iTerm2 terminal with the [One Dark] color scheme.
* Instuctions to setup [GPG Signing].


## License

MIT, see **LICENSE** for more details.


[One Dark]: https://github.com/joshdick/onedark.vim/blob/main/term/One%20Dark.itermcolors
[GPG Signing]: https://gist.github.com/troyfontaine/18c9146295168ee9ca2b30c00bd1b41e
