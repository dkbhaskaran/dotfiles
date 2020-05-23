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

  docker run -d -it --name=docker-${count} --network=host --device=/dev/kfd --device=/dev/dri --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --ipc=host -v $HOME/dockerx:/dockerx -v /ccache:/ccache $1
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

export PATH=$HOME/.local/bin:/snap/clangd/123/bin/:$PATH
LS_COLORS="rs=0:di=01;94:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
export LS_COLORS
# PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;94m\]\w\[\033[00m\]\$ "
# export DK_ROOT=~/git/dk/lnx
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export PATH="/usr/lib/ccache:${HOME}/.local/bin:${HOME}/.local/usr/bin:$PATH"
export CCACHE_DIR=${HOME}/.ccache

if [ -e /usr/bin/tmux ]; then
  run_tmux
fi

if [ "$SHELL" = "/usr/bin/zsh" ]; then
  zsh_setup
fi
