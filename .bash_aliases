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