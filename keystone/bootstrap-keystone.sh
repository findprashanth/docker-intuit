#!/bin/bash

set -x
SQL_SCRIPT=${SQL_SCRIPT:-/root/keystone.sql}
mysql -uroot -p$MYSQL_ROOT_PASSWORD -h mysql <$SQL_SCRIPT
keystone-manage db_sync
uwsgi --http 0.0.0.0:5000 --wsgi-file $(which keystone-wsgi-public) &
uwsgi --http 0.0.0.0:35357 --wsgi-file $(which keystone-wsgi-admin)
