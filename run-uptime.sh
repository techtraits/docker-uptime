#!/bin/sh

# Copy custom config
if [ -d /tmp/uptime/config ];
then
	echo "Copying custom config"
	rm -rf /opt/uptime/config
	cp -r /tmp/uptime/config /opt/uptime/config	
fi

# Add Mongo password
echo "db = db.getSiblingDB('uptime');db.addUser('root','${1}')" > init-mongo.js
mongo ${MONGODB_PORT_28017_TCP_ADDR} init-mongo.js

sed "s/MONGO_SERVER/${MONGODB_PORT_27017_TCP_ADDR}/g" config/config_template.yaml | sed "s/MONGO_PASSWORD/${1}/g" > config/default.yaml


# Run custom initilization script if it exists
if [ -f /tmp/uptime/init-uptime.sh ];
then
   echo "Running /tmp/uptime/init-uptime.sh"
   chmod +x /tmp/uptime/init-uptime.sh
   /tmp/uptime/init-uptime.sh
fi

nodejs app