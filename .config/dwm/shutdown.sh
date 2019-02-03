#!/bin/bash

declare -A ACTIONS
ACTIONS+=([lock]="slock")
ACTIONS+=([logout]="pkill dwm")
ACTIONS+=([halt]="sudo /sbin/shutdown -P now")
ACTIONS+=([standby]="sudo /usr/local/sbin/mysleep")
ACTIONS+=([hibernate]="sudo /usr/local/sbin/myhibernate")
ACTIONS+=([reboot]="sudo /sbin/shutdown -r now")

SELECTED_ACTION=$(dmenu -l 10 <<< $(printf '%s\n' ${!ACTIONS[*]}))

${ACTIONS[$SELECTED_ACTION]}

