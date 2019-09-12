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

export PATH="/home/$USER/.scripts:$PATH"

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
    catkin() { command time -f %E -o /tmp/time_tracking.txt catkin "$@"; pluck; \
               write_times.py record /tmp/time_tracking.txt /media/$USER/LANYARD_BLU/tracking/meditation.txt temp;}
    #if [ -e /media/$USER/LANYARD_BLU ]; then write_times.py; fi; }
fi


# Automatically source extra files depending on which computer you're on.
case "$HOSTNAME" in
    'brycew-Precision-Tower-5810')
        . $HOME/.bash_work
        ;;
    'brycew-desktop')
        . $HOME/.bash_home
        ;;
    'demo2-Precision-7920-Tower')
        . $HOME/.bash_demo
        ;;
esac
