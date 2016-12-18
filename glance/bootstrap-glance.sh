#!/bin/bash

SQL_SCRIPT=/root/glance.sql
mysql -uroot -padmin123 -h mysql <$SQL_SCRIPT

su -s /bin/sh -c "glance-manage db_sync" glance

glance-registry &
sleep 5
glance-api
