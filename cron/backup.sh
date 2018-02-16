#!/bin/sh
. /opt/farm/scripts/functions.custom
. /opt/farm/ext/backup/functions

TMP="`local_backup_directory`"
DEST="$TMP/custom"

for D in `ls /srv/imap`; do
	backup_directory $TMP $DEST /srv/imap/$D imap_$D.tar
done
