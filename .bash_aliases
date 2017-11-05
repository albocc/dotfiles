#!/usr/bin/env bash

# Faster navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# List all files with colorized output as list with humand-readable sizes
# -F appends indicator (one of */=>@|) to entries
alias ll="ls -lahF --color"

# Make pacman always run with sudo, so you don't forget it next time ;-)
alias pacman='sudo pacman'

# Create alias to give pacman an autoremove command
alias pacman_autoremove='sudo pacman -Rsn $(pacman -Qqdt)'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Some useful functions
# chmod all files in the passed folder and subfolders with mode passed as argument
fchmod () { find $2 -type f -exec chmod $1 {} + ;}
# chmod all folders in the passed folder and subfolders with mode passed as argument
dchmod () { find $2 -type d -exec chmod $1 {} + ;}
