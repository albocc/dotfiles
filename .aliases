#!/usr/bin/env bash

# Faster navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# List all files with colorized output as list with humand-readable sizes
# -F appends indicator (one of */=>@|) to entries
alias ll="ls -lahF --color"
# Always use color output for 'ls'
alias ls="command ls --color"

# Always enable colorized 'grep' output
# Note: 'GREP_OPTIONS="--color=auto"' is deprecated
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Make apt-get always run with sudo, so you don't forget it next time ;-)
alias apt='sudo apt'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Some useful functions
# chmod all files in the passed folder and subfolders with mode passed as argument
fchmod () { find $2 -type f -exec chmod $1 {} + ;}
# chmod all folders in the passed folder and subfolders with mode passed as argument
dchmod () { find $2 -type d -exec chmod $1 {} + ;}
