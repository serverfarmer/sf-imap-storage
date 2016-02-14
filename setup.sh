#!/bin/sh

bash /opt/farm/scripts/setup/role.sh sf-backup

mkdir -p /srv/imap /var/log/sync

if ! grep -q /opt/sf-imap-storage/cron /etc/crontab; then
	echo "14 1 * * * root /opt/sf-imap-storage/cron/sync.sh" >>/etc/crontab
	echo "32 9 * * 6 root /opt/sf-imap-storage/cron/backup.sh" >>/etc/crontab
fi
