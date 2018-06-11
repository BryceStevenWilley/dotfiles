# Old prompt
# PS1="[\t  \u@\h:\w] "

# sets the prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\] \[\033[1;35m\]\t\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] '
case `id -u` in
	0) PS1="${PS1}# ";;
	*) PS1="${PS1}$ ";;
esac

# Sets the editor for use in matlab
export EDITOR=vim

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

shopt -s histappend  
PROMPT_COMMAND='history -a'

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
