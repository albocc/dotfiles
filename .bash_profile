# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd 2> $HOME/.config/mpd/log

# Start freaking X already
if ! pgrep -x "Xorg" > /dev/null
then
  exec startx
fi
