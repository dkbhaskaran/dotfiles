#!/bin/bash

set -e

mkdir -p ~/.local

install_vim() {
  cd ~/.local

  wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.tar.gz
  tar -xf nvim-linux64.tar.gz --strip-components 1

  #mkdir -p ${HOME}/.config/nvim
  #git clone https://github.com/gmarik/vundle.git ${DOTFILES}/vim/bundle/vundle

  #ln -s ${DOTFILES}/vim/vimrc ${HOME}/.config/nvim/init.vim
  #ln -s ${DOTFILES}/vim ${HOME}/.vim

  #mkdir ${HOME}/.vim/backup
  #mkdir ${HOME}/.vim/swp

  #~/.local/bin/nvim +PluginInstall +qall
  #~/.local/bin/nvim +UpdateRemotePlugins +qall
  git clone https://github.com/dkbhaskaran/AstroNvim.git ~/.config/nvim
  
  rm -f nvim-linux64.tar.gz
}

install_ripgrep() {
  cd ~/.local

  wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
  tar -xf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
  mkdir -p ~/.local/bin
  mv ripgrep-13.0.0-x86_64-unknown-linux-musl/rg ~/.local/bin
  rm -rf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz ripgrep-13.0.0-x86_64-unknown-linux-musl
}

install_debian() {
  cd ~/.local
  wget http://archive.ubuntu.com/ubuntu/pool/universe/u/universal-ctags/universal-ctags_0+git20200824-1_amd64.deb
  dpkg -x universal-ctags_0+git20200824-1_amd64.deb .
  rm -f ripgrep_13.0.0_amd64.deb universal-ctags_0+git20200824-1_amd64.deb
}

install_redhat() {
  cd ~/.local
  wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
  tar -xf libevent-2.1.8-stable.tar.gz
  cd libevent-2.1.8-stable
  ./configure --prefix=$HOME/.local
  make -j install

  wget https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz
  tar -xf tmux-2.8.tar.gz
  cd tmux-2.8
  PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig  LDFLAGS="-L/$HOME/.local/lib -Wl,-rpath=$HOME/.local/lib" ./configure --prefix=$HOME/.local
  make -j install
}

if [ -f /etc/redhat-release ]; then
  install_redhat
fi

if [ -f /etc/lsb-release ]; then
  install_debian
fi

cd ${HOME}
git clone https://github.com/dkbhaskaran/dotfiles.git .local/dotfiles

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -) --unattended"

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

cd ${HOME}
ln -s ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf  # tmux setup
ln -s ${DOTFILES}/git/gitconfig ~/.gitconfig   # git
ln -s ${DOTFILES}/gdb/gdbinit ~/.gdbinit

install_vim
install_ripgrep

echo "Changing shell to zsh"
chsh $USER -s $(which zsh)

# clean up
# rm -rf .local/ .oh-my-zsh/ .zshrc .fzf .config/nvim .tmux.conf .gitconfig .gdbinit
