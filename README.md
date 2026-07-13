# Dotfiles

This repository contains my personal dotfiles.

> [!NOTE]
> Tailered for a machine running macOS.

## Prerequisites

Install the Command Line Tools. This runs in a separate window; wait for it to
finish before continuing.

```sh
xcode-select --install
```

Install Nix.

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm
```

Open a new terminal so `nix` is on your `PATH`.

## Installation

Open a terminal, navigate to the folder where you want to clone this repository,
and clone it:

```sh
git clone https://github.com/jaapverloop/dotfiles.git
cd dotfiles
```

Alternatively, if `git` is not installed yet, download the repository as a ZIP
from [GitHub](https://github.com/jaapverloop/dotfiles) and extract it.

Build the system with the following command and follow the instructions:

```sh
./rebuild.sh
```

## Update

Open a terminal, navigate to the folder where this repository is cloned, and
execute the following commands:

```sh
git pull
./rebuild.sh
```

## Catppuccin themes

This repository uses the Catppuccin theme. To update the theme files, open a
terminal, navigate to the folder where this repository is cloned and execute the
following command.

```sh
./update-theme.sh
```

## GPG Signing

* Here you can find instuctions to setup [GPG Signing].
* Below you can find instructions to extend the expiration date of a key.

1. List keys

```bash
gpg --list-keys
```

2. Edit key

```bash
gpg --edit-key :ID
```

1. Extend the expiration date in the gpg> prompt

```bash
# 1. type action
expire
# 2. extend with one year
1y
# 3. save the key
save
```

4. Export key

```bash
gpg --armor --export :ID | pbcopy
```

## License

MIT, see **LICENSE** for more details.

[GPG Signing]: https://gist.github.com/troyfontaine/18c9146295168ee9ca2b30c00bd1b41e
