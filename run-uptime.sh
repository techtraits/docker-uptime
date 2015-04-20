#!/bin/sh

# Copy custom config
if [ -d /tmp/uptime/config ];
then
	echo "Copying custom config"
	rm -rf /opt/uptime/config
	cp -r /tmp/uptime/config /opt/uptime/config	
fi

# Run custom initilization script if it exists
if [ -f /tmp/uptime/init-uptime.sh ];
then
   echo "Running /tmp/uptime/init-uptime.sh"
   chmod +x /tmp/uptime/init-uptime.sh
   /tmp/uptime/init-uptime.sh
fi

nodejs app
