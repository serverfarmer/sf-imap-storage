#!/bin/sh
. /opt/farm/ext/backup/functions

TMP="`/opt/farm/config/get-local-backup-directory.sh`"
DEST="$TMP/custom"

for D in `ls /srv/imap`; do
	backup_directory $TMP $DEST /srv/imap/$D imap_$D.tar
done
