#!/bin/sh

echo "" > /var/log/docsrv/docsrv.log
echo "" > /var/log/docsrv/caddy.log
chmod 666 /var/log/docsrv/*

/usr/bin/supervisord
