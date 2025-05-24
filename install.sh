#!/bin/bash

set -e
mkdir -p ~/.local

install_vim() {
  cd ~/.local

  # Should have done ppa based installation but its still a year behind.
  wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
  tar -xf nvim-linux-x86_64.tar.gz --strip-components 1

  git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

  mkdir ~/.config/nvim/lua/user
  cp ${DOTFILES}/vim/init.lua ~/.config/nvim/lua/user

  rm -f nvim-linux-x86_64.tar.gz
}

# oh-my-zsh installation and configurations
cd ${HOME}
git clone https://github.com/dkbhaskaran/dotfiles.git .local/dotfiles
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -) --unattended"

cd ${HOME}/.oh-my-zsh
sed -i "s/plugins=(git)/plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)/g" ${HOME}/.zshrc

ZSH_CUSTOM=${HOME}/.oh-my-zsh/custom
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

export DOTFILES=${HOME}/.local/dotfiles
echo "source ${DOTFILES}/zsh/setup.sh" >> ~/.zshrc

# nerd-fonts installations
cd ~/.local
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
./nerd-fonts/install.sh

# Install Tmux plugins manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# link the local configs
cd ${HOME}
ln -s ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf  # tmux setup
mkdir -p ~/.local/bin
ln -s ${DOTFILES}/tmux/showeditor ~/.local/bin/showeditor
ln -s ${DOTFILES}/tmux/editorcopymode ~/.local/bin/editorcopymode

ln -s ${DOTFILES}/git/gitconfig ~/.gitconfig   # git
ln -s ${DOTFILES}/gdb/gdbinit ~/.gdbinit

install_vim

echo "Changing shell to zsh"
chsh $USER -s $(which zsh)

# clean up
# rm -rf .local/ .oh-my-zsh/ .zshrc .config/nvim .tmux.conf .gitconfig .gdbinit
