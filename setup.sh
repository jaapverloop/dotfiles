#!/usr/bin/env bash

SCRIPTPATH=$(cd "$(dirname "${0}")"; echo $(pwd))

# load submodules
git submodule init
git submodule update

# setup base16-shell
rm -rf ~/.base16-shell
ln -s $SCRIPTPATH/base16-shell ~/.base16-shell

# setup prezto
rm -rf ~/.zprezto
rm -rf ~/.zpreztorc
ln -s $SCRIPTPATH/prezto ~/.zprezto
ln -s $SCRIPTPATH/zpreztorc ~/.zpreztorc

# setup zsh
rm ~/.zshrc
ln -s $SCRIPTPATH/zshrc ~/.zshrc

# setup vim
rm -rf ~/.vim
rm ~/.vimrc
ln -s $SCRIPTPATH/vim ~/.vim
ln -s $SCRIPTPATH/vimrc ~/.vimrc
vim +PluginInstall +qall &> /dev/null &

# setup git
rm ~/.gitconfig
rm ~/.gitignore
ln -s $SCRIPTPATH/gitconfig ~/.gitconfig
ln -s $SCRIPTPATH/gitignore ~/.gitignore

# setup tmux
rm ~/.tmux.conf
ln -s $SCRIPTPATH/tmux.conf ~/.tmux.conf
