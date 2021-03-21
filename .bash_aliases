# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Often have to C-z and kill a process that refuses to die. I hate typing '%1'.
alias killl="kill %1"

# Alias the dotfile git setup
alias config='/usr/bin/git --git-dir=/home/brycew/.cfg/ --work-tree=/home/brycew'

# Play a plucked guitar string with no logging and volume of 0.5
alias pluck='play -V0 -q -n synth 2.0 pluck C5 vol 0.5'

alias rapidstatus='ls . | grep "rapid*" | xargs -I{} sh -c "(cd {}; echo "\""{}"\""; git rev-parse --abbrev-ref HEAD; echo)"';
 
# Will-style Aliasing
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias u='cd ..'
alias uu='cd ../../'
alias uuu='cd ../../../'
alias uuuu='cd ../../../../'
alias LS='ls'
alias sl='ls'
alias here='nautilus .'
alias here_rst='nautilus -q && nautilus &'
alias nanobash='nano ~/.bashrc'
alias src='source ~/.bashrc'
alias udev='sudo udevadm trigger'
alias python_pip='sudo /usr/bin/pip install'
# only useful if emacs is always open
#alias magit='emacsclient -n -e \(magit-status\)'

# Building
alias m='make -j8'
alias cbr='catkin build --cmake-args -DCMAKE_BUILD_TYPE=Release'
alias cbd='catkin build --cmake-args -DCMAKE_BUILD_TYPE=Debug'
function cbpr() { catkin build "$@" --cmake-args -DCMAKE_BUILD_TYPE=Release; }
function cbpd() { catkin build "$@" --cmake-args -DCMAKE_BUILD_TYPE=Debug; }
function cbt() { catkin build "$@" && catkin run_tests --no-deps "$@"; }

# $1: the folder to sync
function dpt_push_folder() {
  local fold=$1
  ls $fold | xargs -I_paper dptrp1 --addr 192.168.4.37 upload "$fold"/_paper Document/Academic/"$fold"/_paper
}

# $1: the folder to sync
function dpt_pull_folder() {
  local fold=$1
  ls $fold | xargs -I_paper dptrp1 --addr 192.168.4.37 download Document/Academic/"$fold"_paper "$fold"/_paper
}
