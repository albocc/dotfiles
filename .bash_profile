# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:/sbin:$HOME/.local/bin:$HOME/bin

export PATH

# Mount music from NAS
if ! mount | grep NAS > /dev/null
then
	mount Musik/NAS
fi

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd 2> $HOME/.config/mpd/log

# Start window manager
if [ $(tty) == "/dev/tty1" ]; then
	read -p "Which window manager? [s]way/[i]3? " windowmgr
	if [ "$windowmgr" == "s" ]; then
		# Wayland + Sway:
		export XKB_DEFAULT_LAYOUT="de,de"
		export XKB_DEFAULT_VARIANT=",nodeadkeys"
		export XKB_DEFAULT_OPTIONS="grp:alt_space_toggle,"

		if test -z "${XDG_RUNTIME_DIR}"; then
			export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
			if ! test -d "${XDG_RUNTIME_DIR}"; then
				mkdir "${XDG_RUNTIME_DIR}"
				chmod 0700 "${XDG_RUNTIME_DIR}"
			fi
		fi
		exec sway
	else
		# Xorg + i3
		exec startx -- -nolisten tcp
	fi
fi

