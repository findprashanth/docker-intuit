#!/bin/bash

set -x
SQL_SCRIPT=${SQL_SCRIPT:-/root/keystone.sql}
mysql -uroot -padmin123 -h mysql <$SQL_SCRIPT
keystone-manage db_sync
/usr/bin/keystone-all --config-file=/etc/keystone/keystone.conf --log-file=/var/log/keystone/keystone.log &
