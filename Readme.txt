#!/bin/bash

DOTFILES=${HOME}/dotfiles

# Install putty powerline fonts using
# https://medium.com/@slmeng/how-to-install-powerline-fonts-in-windows-b2eedecace58

cd ${HOME}
# setup zsh
# ------------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
cd ~/.fzf/
./install


echo "source ${DOTFILES}/zsh/setup.sh" >> ~/.zshrc
cp ${DOTFILES}/zsh/robbyrussell.zsh-theme ~/.oh-my-zsh/themes # for prompt

cd ${HOME}
ln -s ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf  # tmux setup
ln -s ${DOTFILES}/git/gitconfig ~/.gitconfig   # git 
ln -s ${DOTFILES}/gdb/gdbinit ~/.gdbinit


# nvim installation and configuration
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

sudo apt-get install python-dev python-pip python3-dev python3-pip

mkdir ${HOME}/.config/nvim
git clone https://github.com/gmarik/vundle.git ${DOTFILES}/vim/bundle/vundle

ln -s ${DOTFILES}/vim/vimrc ${HOME}/.config/nvim/init.vim
ln -s ${DOTFILES}/vim ${HOME}/.vim

nvim +PluginInstall +qall
nvim +UpdateRemotePlugins +qall

# coc.vim configuration
# install ccls
sudo apt install snapd
sudo snap install ccls --classic
# ensure ccls is in your path

cd ${DOTFILES}/vim/bundle/coc.nvim
git co remotes/origin/release
cp ${DOTFILES}/vim/coc-settings.json ~/.config/nvim/coc-settings.json
