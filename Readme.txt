#!/bin/bash

# Install putty powerline fonts using
# https://medium.com/@slmeng/how-to-install-powerline-fonts-in-windows-b2eedecace58

cd $HOME
# setup zsh
# ------------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# TMUX setup
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp <current_git_repo>/tmux.conf.local .tmux.conf.local

# VIM setup
# ------------

mkdir $HOME/.vim
cd $HOME/.vim/

mkdir backup
mkdir bundle
mkdir swp

cd bundle

git clone https://github.com/chrisbra/Colorizer
git clone https://github.com/morhetz/gruvbox.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/jacoborus/tender.vim.git
git clone https://github.com/bling/vim-airline.git
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/octol/vim-cpp-enhanced-highlight.git
git clone https://github.com/sickill/vim-monokai.git
git clone https://github.com/christoomey/vim-tmux-navigator
git clone https://github.com/gmarik/vundle.git
git clone https://github.com/pseewald/nerdtree-tagbar-combined.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/ntpeters/vim-better-whitespace.git
git clone https://github.com/junegunn/fzf.vim.git
git clone https://github.com/junegunn/fzf.git
cd fzf; ./install; cd -

git clone https://github.com/ycm-core/YouCompleteMe.git
cd YouCompleteMe; git submodule update --init --recursive; sh install.sh; cd -

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts; ./install.py --clangd-completer ; cd -

ln -s <current_git_repo>/vimrc ~/vim/vimrc

