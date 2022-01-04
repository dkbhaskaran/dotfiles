#!/bin/bash

set -e

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -) --unattended"

mkdir -p ~/.local
cd ${HOME}
git clone https://github.com/dkbhaskaran/dotfiles.git .local/dotfiles

ZSH_CUSTOM=${HOME}/.oh-my-zsh/custom
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

cd ${HOME}
#install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
cd ~/.fzf/
./install --all


export DOTFILES=${HOME}/.local/dotfiles
echo "source ${DOTFILES}/zsh/setup.sh" >> ~/.zshrc

cd ${HOME}/.oh-my-zsh
git apply ${DOTFILES}/zsh/themes.patch
sed -i "s/ZSH_THEME=.*/ZSH_THEME=\"agnoster\"/g" ${HOME}/.zshrc
sed -i "s/plugins=(git)/plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)/g" ${HOME}/.zshrc

cd ~/.local
wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
dpkg -x ripgrep_13.0.0_amd64.deb .
rm -f ripgrep_13.0.0_amd64.deb

cd ~/.local
# Nightly builds' link is not consistent.
# wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
wget https://github.com/neovim/neovim/releases/download/v0.6.1/nvim-linux64.tar.gz
tar -xf nvim-linux64.tar.gz --strip-components 1

cd ~/.local
wget http://archive.ubuntu.com/ubuntu/pool/universe/u/universal-ctags/universal-ctags_0+git20200824-1_amd64.deb
dpkg -x universal-ctags_0+git20200824-1_amd64.deb .

mkdir -p ${HOME}/.config/nvim
git clone https://github.com/gmarik/vundle.git ${DOTFILES}/vim/bundle/vundle

ln -s ${DOTFILES}/vim/vimrc ${HOME}/.config/nvim/init.vim
ln -s ${DOTFILES}/vim ${HOME}/.vim

mkdir ${HOME}/.vim/backup
mkdir ${HOME}/.vim/swp

~/.local/bin/nvim +PluginInstall +qall
~/.local/bin/nvim +UpdateRemotePlugins +qall

cd ${HOME}
ln -s ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf  # tmux setup
ln -s ${DOTFILES}/git/gitconfig ~/.gitconfig   # git
ln -s ${DOTFILES}/gdb/gdbinit ~/.gdbinit

echo "Changing shell to zsh"
chsh $USER -s $(which zsh)

# clean up
# rm -rf .local/ .oh-my-zsh/ .zshrc .fzf .config/nvim .tmux.conf .gitconfig .gdbinit
