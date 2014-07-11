#!/bin/sh

#Add Mongo password
echo "db = db.getSiblingDB('uptime');db.addUser('root','${1}')" > init-mongo.js
mongo ${MONGODB_PORT_28017_TCP_ADDR} init-mongo.js

sed "s/MONGO_SERVER/${MONGODB_PORT_27017_TCP_ADDR}/g" config/config_template.yaml | sed "s/MONGO_PASSWORD/${1}/g" > config/default.yaml
nodejs app