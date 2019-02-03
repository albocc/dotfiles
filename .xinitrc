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

# Turn the middle click of the trackpad into a left click
xinput --set-button-map $(xinput | grep TouchPad | awk '{print $6}' | tr -d 'id=') 1 1 3 4 5 6 7

# Turn numlock on
numlockx on

# Activate xautolock
xautolock -time 14 -locker "slock && xset dpms force off" -notify 15 -notifier "notify-send 'System will be locked automatically in 15 seconds...'" &

# Set wallpaper
nitrogen --restore

# Start statusbar for dwm
~/.config/dwm/status-bar/status-bar.sh &

#exec i3
exec dwm

