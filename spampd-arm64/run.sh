#! /bin/bash

sa-update

if [ -z ${RELAYHOST} ]; then
	RELAYHOST="localhost:10026"
fi

/usr/sbin/spampd --nodetach --host=0.0.0.0:10025 --relayhost=${RELAYHOST} --user debian-spamd
