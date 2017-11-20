#!/usr/bin/env bash

# Faster navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# List all files with colorized output as list with humand-readable sizes
# -F appends indicator (one of */=>@|) to entries
alias ll="ls -lahF --color"

# Since I am using OpenRC masterrace, make the command easier to remember
alias service='sudo rc-service'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Burn CDs (add image.iso name after `burncd`)
alias burncd='sudo cdrecord -v -dao -eject dev=/dev/sr0'

# Some useful functions
# chmod all files in the passed folder and subfolders with mode passed as argument
fchmod () { find $2 -type f -exec chmod $1 {} + ;}
# chmod all folders in the passed folder and subfolders with mode passed as argument
dchmod () { find $2 -type d -exec chmod $1 {} + ;}
