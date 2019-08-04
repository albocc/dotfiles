#!/bin/bash

# The primary device is hard-coded for now
PRIMARY_DEVICE='eDP'

# Get all (dis)connected devices
CONNECTED_DEVICES=( $(xrandr | grep ' connected' | awk '{print $1}') )
DISCONNECTED_DEVICES=( $(xrandr | grep 'disconnected' | awk '{print $1}') )

echo ""
echo "=== Display manager ==="
echo ""
echo "Primary port: $PRIMARY_DEVICE"
echo ""

echo "Connected ports:"
for dev in "${CONNECTED_DEVICES[@]}"; do
	echo " + $dev"
done

echo ""

echo "Disconnected ports:"
for dev in "${DISCONNECTED_DEVICES[@]}"; do
	echo " - $dev"
done

echo ""

# Prepare arguments for xrandr. First add the primary device
XRANDR_ARGS="--output $PRIMARY_DEVICE --auto --primary "

# Then add all connected devices to the right of the previous one
for i in "${!CONNECTED_DEVICES[@]}"; do
	CONNECTED_DEVICE=${CONNECTED_DEVICES[$i]}
	if [ "$CONNECTED_DEVICE" == "$PRIMARY_DEVICE" ]; then
		continue;
	fi

	if [ $i -gt 0 ]; then 
		LAST_PORT=${CONNECTED_DEVICES[$((i-1))]}
	else
		LAST_PORT=$PRIMARY_DEVICE
	fi
	XRANDR_ARGS+="--output $CONNECTED_DEVICE --auto --right-of $LAST_PORT "
done

# Lastly, turn off all ports that are disconnected.
# This is necessary to remove any screens that have been disconnected
for i in "${!DISCONNECTED_DEVICES[@]}"; do
	DISCONNECTED_DEVICE=${DISCONNECTED_DEVICES[$i]}
	if [ "$DISCONNECTED_DEVICE" == "$PRIMARY_DEVICE" ]; then
		continue;
	fi

	XRANDR_ARGS+="--output $DISCONNECTED_DEVICE --off "
done <<< "$DISCONNECTED_DEVICES"

echo "xrandr $XRANDR_ARGS"

xrandr $XRANDR_ARGS

