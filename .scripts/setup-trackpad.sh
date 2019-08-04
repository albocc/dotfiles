#!/bin/bash

# Commands
XINPUT='/usr/bin/xinput'
GAWK='/usr/bin/gawk'

# Device info
DEVICE='SynPS/2 Synaptics TouchPad'

TAPPING_ENABLE_CODE=$($XINPUT --list-props "$DEVICE" | $GAWK 'match($0, /Tapping Enabled \((.*)\)/, mat) {print mat[1]}')
NATURAL_SCROLL_ENABLE_CODE=$($XINPUT --list-props "$DEVICE"  | $GAWK 'match($0, /Natural Scrolling Enabled \((.*)\)/, mat) {print mat[1]}')
BUTTON_MAP_MIDDLE_TO_LEFT_CLICK='1 1 3 4 5 6 7'

$XINPUT set-prop "$DEVICE" $TAPPING_ENABLE_CODE 1
$XINPUT set-prop "$DEVICE" $NATURAL_SCROLL_ENABLE_CODE 1
$XINPUT --set-button-map "$DEVICE" $BUTTON_MAP_MIDDLE_TO_LEFT_CLICK # intentionally without quotes to expand spaces

