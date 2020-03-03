#!/bin/bash
MYSQL_PASSWORD="123456"
DATE=$(date +%d-%m-%Y)
BACKUP_DIR="/home/naser/data/backup"
ROTATE=5

mkdir -p $BACKUP_DIR/$DATE
mysqldump -u backup_admin -p$MYSQL_PASSWORD --all-databases | gzip > "$BACKUP_DIR/$DATE/dbs-$DATE.sql.gz"
find $BACKUP_DIR/ -mtime +$ROTATE -exec rm -rf {} \;
#find $BACKUP_DIR/ -mmin +6 -exec rm -rf {} \;
