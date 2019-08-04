#!/bin/sh

# General setup
INTERFACE_PATHS=(/etc/init.d/net.*)
INTERFACES_TO_IGNORE=('lo')

INTERFACES=(${INTERFACE_PATHS[@]#/etc/init.d/net.})

for IFACE in "${INTERFACES[@]}"; do
	if [[ "$IFACE" = 'lo' ]]; then
		echo "Skipping interface '$IFACE'" >&2
		continue;
	fi

	/sbin/rc-service net.${IFACE#/etc/init.d/net.} restart
done


