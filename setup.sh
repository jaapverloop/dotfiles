#!/usr/bin/env bash

SCRIPTPATH=$(cd "$(dirname "${0}")"; echo $(pwd))

# load submodules
git submodule init
git submodule update

# setup base16-shell
rm -rf ~/.base16-shell
ln -s $SCRIPTPATH/base16-shell ~/.base16-shell

# setup antigen
rm -rf ~/.antigen
ln -s $SCRIPTPATH/antigen ~/.antigen

# setup zsh
rm ~/.zshrc
ln -s $SCRIPTPATH/zshrc ~/.zshrc

# setup vim
rm -rf ~/.vim
rm ~/.vimrc
ln -s $SCRIPTPATH/vim ~/.vim
ln -s $SCRIPTPATH/vimrc ~/.vimrc
vim +BundleInstall +qall &> /dev/null &

# setup git
rm ~/.gitconfig
rm ~/.gitignore
ln -s $SCRIPTPATH/gitconfig ~/.gitconfig
ln -s $SCRIPTPATH/gitignore ~/.gitignore

# setup tmux
rm ~/.tmux.conf
ln -s $SCRIPTPATH/tmux.conf ~/.tmux.conf
