#!/bin/bash

SQL_SCRIPT=/root/glance.sql
mysql -uroot -p$MYSQL_ROOT_PASSWORD -h $MYSQL_HOST <$SQL_SCRIPT

su -s /bin/sh -c "glance-manage db_sync" glance

glance-registry &
sleep 5
glance-api
