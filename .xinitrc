#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Turn off screen blanking and set timeout to 15 min
xset s off && xset dpms 900 900 900

# Set up the trackpad
~/.scripts/setup-trackpad.sh

# Turn numlock on
numlockx on

# Activate xautolock
xautolock -time 29 -locker "i3lock" -notify 60 -notifier "notify-send 'System will be locked automatically in 1 minute...'" &

# Set wallpaper
nitrogen --restore

# Start statusbar for dwm
#~/.config/dwm/status-bar/status-bar.sh &

# Start Compton as compositor (also avoids tearing?)
compton &

# Subscribe to systemd-events for locking the screen
xss-lock -l ~/.scripts/transfer-sleep-lock-generic-delay.sh &

# Swap escape and caps lock
setxkbmap -option caps:swapescape

exec i3
#exec dwm
#exec xmonad

