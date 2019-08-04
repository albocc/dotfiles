#!/bin/bash

# Determine the Analog card
CARD=$(/usr/bin/aplay -l | /usr/bin/awk 'match($0, /\w* ([0-9]):.* ([0-9]):.*Analog/, ary) {print ary[1]}')

case $1 in
	'mute') amixer -c $CARD -q sset Master toggle && pkill -RTMIN+1 i3blocks ;;  # right click, mute/unmute
	'up') amixer -c $CARD -q sset Master 5%+ && pkill -RTMIN+1 i3blocks ;; # scroll up, increase
	'down') amixer -c $CARD -q sset Master 5%- && pkill -RTMIN+1 i3blocks ;; # scroll down, decrease
esac

