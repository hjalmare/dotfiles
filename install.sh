#!/bin/bash

sudo apt-get install stow

##install vundle if missing
if [ ! -f apps/vim/.vim/bundle/Vundle.vim/changelog.md ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.dotfiles/apps/vim/.vim/bundle/Vundle.vim
fi

#Clojure
stow -t ~ -d ~/.dotfiles/apps/ clojure

#Rust
sudo apt-get install rust

#I3
stow -t ~ -d ~/.dotfiles/apps/ i3

#Vim
stow --no-folding -t ~ -d ~/.dotfiles/apps/ vim
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.py #--racer-completer
