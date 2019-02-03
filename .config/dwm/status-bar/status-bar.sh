#!/bin/bash

SCRIPTS="$HOME/.config/dwm/status-bar/scripts"

mpd() {
	echo -n "♫ "
	${SCRIPTS}/mpd
}

volume() {
	${SCRIPTS}/volume
}

wifi() {
	echo -n "📶 "
	BLOCK_INSTANCE=wlp2s0 ${SCRIPTS}/wifi
}

openvpn() {
	echo -n "VPN: "
	${SCRIPTS}/openvpn
}

cpu_usage() {
	${SCRIPTS}/cpu_usage
}

loadavg() {
	${SCRIPTS}/loadavg
}

temperature() {
	${SCRIPTS}/temperature --chip k10temp-pci-00c3 -w 70 -c 80
}

fanspeed() {
	${SCRIPTS}/thinkpad-fanspeed
}

memory() {
	echo ""
}

battery() {
	echo -n "🔋 "
	${SCRIPTS}/battery
}

disk() {
	echo ""
}

datetime() {
	date '+%a. %d. %B %Y %R:%S'
}

ACTIVE_MODULES=(mpd volume wifi openvpn cpu_usage loadavg temperature fanspeed memory battery disk datetime)

while true; do
	STATUS_STRING=""
	for MODULE in ${ACTIVE_MODULES[@]}; do
		MODULE_OUTPUT=$($MODULE | head -n 1)
		if [ -n "$MODULE_OUTPUT" ]; then
			STATUS_STRING+="$MODULE_OUTPUT"
			# Unless this is the last module, add a delimiter
			if [ "$MODULE" != "${ACTIVE_MODULES[-1]}" ]; then
				STATUS_STRING+=" | "
			fi
		fi
	done
	xsetroot -name "$STATUS_STRING"
	sleep 5s
done

