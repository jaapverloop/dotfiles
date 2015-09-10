#!/usr/bin/env bash

SCRIPTPATH=$(cd "$(dirname "${0}")"; echo $(pwd))

# create symlink to this repo
rm -rf ~/.dotfiles
ln -s $SCRIPTPATH ~/.dotfiles

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
vim +PlugInstall +qall &> /dev/null &

# setup git
rm ~/.gitconfig
rm ~/.gitignore
ln -s $SCRIPTPATH/gitconfig ~/.gitconfig
ln -s $SCRIPTPATH/gitignore ~/.gitignore

# setup tmux
rm ~/.tmux.conf
ln -s $SCRIPTPATH/tmux.conf ~/.tmux.conf
