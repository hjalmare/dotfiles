#!/bin/bash

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
