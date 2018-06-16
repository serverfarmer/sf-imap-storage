#!/bin/sh

/opt/farm/scripts/setup/extension.sh sf-backup
/opt/farm/scripts/setup/extension.sh sf-storage-utils

mkdir -p /srv/imap /var/log/sync

if ! grep -q /opt/farm/ext/imap-storage/cron /etc/crontab; then
	echo "14 1 * * * root /opt/farm/ext/imap-storage/cron/sync.sh" >>/etc/crontab
	echo "32 9 * * 6 root /opt/farm/ext/imap-storage/cron/backup.sh" >>/etc/crontab
fi
