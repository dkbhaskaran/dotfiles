export CSCOPE_EDITOR=vim

function zsh_setup()
{
  HISTFILE="$HOME/.zsh_history"
  HISTSIZE=10000000
  SAVEHIST=10000000

  # required for disallowing tmux to rename windows
  export DISABLE_AUTO_TITLE="true"

  setopt NULL_GLOB
  # ctrl-u behvior
  bindkey \^U backward-kill-line
  bindkey "^[[C" forward-word
  bindkey "^[[D" backward-word

  unsetopt share_history
  setopt no_share_history
}

function run_tmux() {
  if [ -z "$TMUX" ]; then
    det_sess_cnt=$(tmux ls | grep -v attached | wc -l)
    # Are there any detached sessions exisiting ?
    if [ $det_sess_cnt -gt 0 ]; then
      tmux -f ~/.tmux.conf -u -2 attach-session -d
    else
      count=0
      while true; do
        tmux has-session -t "$count "
        if [ $? -ne 0 ]; then
          break
        fi
        count=$((count+1))
      done

      tmux -f ~/.tmux.conf -u -2 new -s "$count "
    fi
  fi
}

function drun() {
  count=$(docker ps | wc -l)
  count=$((count-1))

  docker run -d -it --name=docker-${count} --network=host --device=/dev/kfd \
    --device=/dev/dri --group-add video --cap-add=SYS_PTRACE --security-opt \
    seccomp=unconfined --ipc=host -v $HOME/dockerx:/home/dbhaskar/dockerx \
    -v /ccache:/ccache $1
}

function dexec() {
  docker exec -it $1 $SHELL
}

function drm() {
  for id in $*; do
    docker stop $id
    docker rm $id
  done
}

function get_prompt() {
  pmt=`cat /proc/1/cgroup | grep 'docker/' | tail -1 | sed 's/^.*\///' | cut -c 1-8`
  if [ "$pmt" = "" ]; then
    pmt=`hostname`
  fi

  echo $pmt
}

export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
alias vim=nvim
export TZ="/usr/share/zoneinfo/Asia/Calcutta"

export PATH=$HOME/.local/bin:$HOME/.local/bin/arcanist/bin:/snap/bin/:$PATH
# export DK_ROOT=~/git/dk/lnx
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

if command -v rg > /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
fi

export PATH="/usr/lib/ccache:${HOME}/.local/bin:${HOME}/.local/usr/bin:$PATH"
export TERM=screen-256color
export CCACHE_DIR=${HOME}/.ccache

if [ -e /usr/bin/tmux ]; then
  run_tmux
fi

if [ "$SHELL" = "/usr/bin/zsh" ]; then
  zsh_setup
fi
