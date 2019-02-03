#!/usr/bin/env bash

# Faster navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# List all files with colorized output as list with humand-readable sizes
# -F appends indicator (one of */=>@|) to entries
alias ll="ls -lahF --color=auto"

# Add color to grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"

# Since I am using OpenRC masterrace, make the command easier to remember
alias service='sudo rc-service'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Burn CDs (add image.iso name after `burncd`)
alias burncd='sudo cdrecord -v -dao -eject dev=/dev/sr0'
burndvd () { growisofs -Z /dev/sr0=$1 ;}

# Burn files to CD
burnfiles2cd () { mkisofs -r "$1" | sudo cdrecord -v -dao fs=16m speed=48 tsize=`mkisofs -r -quiet -print-size "$1"`s - ;}

# Concatenate PDFs
concatpdf () { gs -q -sPAPERSIZE=a4 -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$1 ${@:2} ;}

# Some useful functions
# chmod all files in the passed folder and subfolders with mode passed as argument
fchmod () { find $2 -type f -exec chmod $1 {} + ;}
# chmod all folders in the passed folder and subfolders with mode passed as argument
dchmod () { find $2 -type d -exec chmod $1 {} + ;}

# Flash images
flashimage () { sudo dd if="$1" of="$2" bs=8M oflag=sync status=progress ;}

# Extract pages from a PDF
extractpagesfrompdf() { gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
   -dFirstPage=${1} \
   -dLastPage=${2} \
   -sOutputFile=${3%.pdf}_p${1}-p${2}.pdf \
   ${3}
}

# Open file using a fuzzy finder
se() { FILE=$(du ${1:-.} | awk '{print $2}' | fzy); if [ $FILE ]; then $EDITOR $FILE; fi; unset FILE; }

