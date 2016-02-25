#!/bin/bash
#loadcapes: load capes at startup

grep -v '(^#|^$)' /etc/capes.list | while read cape; do
	echo "$cape" > /sys/devices/bone_capemgr.9/slots
done
exit 0
