#!/bin/bash

DOTFILES=${HOME}/dotfiles

# Install putty powerline fonts using
# https://medium.com/@slmeng/how-to-install-powerline-fonts-in-windows-b2eedecace58

cd ${HOME}
# setup zsh
# ------------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Try this as well for autocompletions and highlighting
# https://gist.github.com/dogrocker/1efb8fd9427779c827058f873b94df95
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Update .zshrc to use the pugins like
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

cd ${HOME}
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
# sudo apt-get install software-properties-common
# sudo add-apt-repository ppa:neovim-ppa/stable
# sudo apt-get update
# sudo apt-get install neovim

#if you need to install locally
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod +x nvim.appimage

sudo apt-get install python-dev python-pip python3-dev python3-pip

mkdir -p ${HOME}/.config/nvim
git clone https://github.com/gmarik/vundle.git ${DOTFILES}/vim/bundle/vundle

ln -s ${DOTFILES}/vim/vimrc ${HOME}/.config/nvim/init.vim
ln -s ${DOTFILES}/vim ${HOME}/.vim

nvim +PluginInstall +qall
nvim +UpdateRemotePlugins +qall
