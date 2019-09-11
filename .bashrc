# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If on an ubuntu system, this will give us the distribution info
if [ -f /etc/lsb-release ]; then
  . /etc/lsb-release
fi

color_prompt='yes'

if [ "$color_prompt" = 'yes' ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\] \[\033[1;35m\]\t\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\t:\w\'
fi
#unset color_prompt force_color_prompt

# sets the prompt
case `id -u` in
	  0) PS1="${PS1}# ";;
	  *) PS1="${PS1}$ ";;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# General bash things that I want on every machine
if [ -f ~/.bash_misc ]; then
    . ~/.bash_misc
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Automatically source ROS commands based on current operating system
if [ -d /opt/ros/ ]; then
    case "$DISTRIB_CODENAME" in
        'xenial')
            source /opt/ros/kinetic/setup.bash
            ;;
        'bionic')
            source /opt/ros/melodic/setup.bash
            ;;
    esac
    catkin() { command catkin "$@"; pluck & }
fi


# Automatically source extra files depending on which computer you're on.
case "$HOSTNAME" in
    'brycew-Precision-Tower-5810')
        . $HOME/.bash_work
        ;;
    'brycew-desktop')
        . $HOME/.bash_home
        ;;
esac


# Aliasing
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

# Building
alias m='make -j8'
alias cbr='catkin build --cmake-args -DCMAKE_BUILD_TYPE=Release'
alias cbd='catkin build --cmake-args -DCMAKE_BUILD_TYPE=Debug'
function cbpr() { catkin build "$@" --cmake-args -DCMAKE_BUILD_TYPE=Release; }
function cbpd() { catkin build "$@" --cmake-args -DCMAKE_BUILD_TYPE=Debug; }


