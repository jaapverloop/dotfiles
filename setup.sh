#!/usr/bin/env bash

SCRIPTPATH=$(cd "$(dirname "${0}")"; echo $(pwd))

pushd $SCRIPTPATH

# load submodules
git submodule init
git submodule update

# setup zsh
rm -rf ~/.antigen
rm ~/.zshrc
ln -s `pwd`/antigen ~/.antigen
ln -s `pwd`/zshrc ~/.zshrc

# setup vim
rm -rf ~/.vim
rm ~/.vimrc
ln -s `pwd`/vim ~/.vim
ln -s `pwd`/vimrc ~/.vimrc
vim +BundleInstall +qall &> /dev/null &

# setup git
rm ~/.gitconfig
rm ~/.gitignore
ln -s `pwd`/gitconfig ~/.gitconfig
ln -s `pwd`/gitignore ~/.gitignore

# setup tmux
rm ~/.tmux.conf
ln -s `pwd`/tmux.conf ~/.tmux.conf

popd
