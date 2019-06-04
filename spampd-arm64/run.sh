#! /bin/bash

sa-update -D

if [ -z ${LISTENING_PORT} ]; then
	LISTENING_PORT="10025"
fi
if [ -z ${RELAYHOST} ]; then
	RELAYHOST="localhost:10026"
fi

/usr/sbin/spampd --nodetach --host=0.0.0.0:${LISTENING_PORT} --relayhost=${RELAYHOST} --user debian-spamd
