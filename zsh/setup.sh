alias vim=nvim
alias vimdiff='nvim -d'

export CSCOPE_EDITOR=vim

function zsh_setup()
{
  HISTFILE="$HOME/.zsh_history"

  HISTSIZE=10000000
  SAVEHIST=10000000

  # required for disallowing tmux to rename windows
  export DISABLE_AUTO_TITLE="true"

  unsetopt share_history
  setopt no_share_history

  export FZF_COMPLETION_TRIGGER='**'
  if command -v rg > /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
  fi
}

export PATH=$HOME/.local/bin:$HOME/.local/usr/bin/:$PATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export CCACHE_DIR=${HOME}/.ccache

if [ "$SHELL" = "/usr/bin/zsh" ]; then
  zsh_setup
fi

source ${HOME}/git-repos/dotfiles/zsh/docker.sh

tmux start-server
tmux new-session -A -s main
