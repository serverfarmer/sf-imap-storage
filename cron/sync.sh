#!/bin/sh
. /opt/farm/ext/storage-utils/functions.sync

script="imap-storage"
lock $script

log="/var/log/sync/$script.log"
echo "### BEGIN `date +'%Y-%m-%d %H:%M:%S'` ###\n" >>$log

chown root:adm $log
chmod 0640 $log

for S in `cat /etc/local/.config/imap.accounts`; do
	host=`echo $S |cut -d':' -f 1`
	port=`echo $S |cut -d':' -f 2`
	accounts=`echo $S |cut -d':' -f 3 |sed s/,/\ /g`

	key=`/opt/farm/ext/keys/get-ssh-dedicated-key.sh $host root`
	if [ "`ssh -p $port -i $key root@$host \"LANG=en_US.UTF-8 ls -d /srv/imap/* 2>/dev/null\"`" != "" ]; then

		dirs=""
		for A in $accounts; do
			dirs="$dirs root@$host:/srv/imap/$A"
		done

		rsync -e "ssh -p $port -i $key" -avz --delete $dirs /srv/imap |grep -v "/Maildir" |grep -v "log.bz2" >>$log
	fi
done

echo "\n### END `date +'%Y-%m-%d %H:%M:%S'` ###\n\n" >>$log
