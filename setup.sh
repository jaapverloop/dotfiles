#!/usr/bin/env bash

SCRIPTPATH=$(cd "$(dirname "${0}")"; echo $(pwd))

# create symlink to this repo
rm -rf ~/.dotfiles
ln -s $SCRIPTPATH ~/.dotfiles

# setup bash
rm ~/.bashrc
rm ~/.bash_profile
rm ~/.inputrc
ln -s $SCRIPTPATH/bashrc ~/.bashrc
ln -s $SCRIPTPATH/bash_profile ~/.bash_profile
ln -s $SCRIPTPATH/inputrc ~/.inputrc

# setup vim
rm -rf ~/.vim
rm ~/.vimrc
ln -s $SCRIPTPATH/vim ~/.vim
ln -s $SCRIPTPATH/vimrc ~/.vimrc

# setup git
rm ~/.gitconfig
rm ~/.gitignore
ln -s $SCRIPTPATH/gitconfig ~/.gitconfig
ln -s $SCRIPTPATH/gitignore ~/.gitignore

# setup tmux
rm ~/.tmux.conf
ln -s $SCRIPTPATH/tmux.conf ~/.tmux.conf

# setup editorconfig
rm ~/.editorconfig
ln -s $SCRIPTPATH/editorconfig ~/.editorconfig
