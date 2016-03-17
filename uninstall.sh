#!/bin/sh

if grep -q /opt/farm/ext/imap-storage/cron /etc/crontab; then
	sed -i -e "/\/opt\/farm\/ext\/imap-storage\/cron/d" /etc/crontab
fi
