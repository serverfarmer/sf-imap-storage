#!/bin/sh

if grep -q /opt/sf-imap-storage/cron /etc/crontab; then
	sed -i -e "/\/opt\/sf-imap-storage\/cron/d" /etc/crontab
fi
