#!/bin/bash
DAY=`echo $(date +%F)`
WEEK=`echo $(date +%F_%V)`
MONTH=`echo $(date +%F_%m)`
FILE_LIST_WEEK=`ls /root/backups/weekly/`
FILE_LIST_MONTH=`ls /root/backups/monthly/`
ROUTE_DAILY="/root/backups/daily/"
ROUTE_WEEK="/root/backups/weekly/"
ROUTE_MONTH="/root/backups/monthly/"

rm $ROUTE_DAILY*
mysqldump EvilCorp > ${ROUTE_DAILY}backup.sql
tar -czvf ${ROUTE_DAILY}backup_$DAY.tar.gz ${ROUTE_DAILY}backup.sql
rm ${ROUTE_DAILY}backup.sql

for FILE_NAME_WEEK in $FILE_LIST_WEEK
do
if [ $FILE_NAME_WEEK != "backup_${WEEK}" ]
then
rm $ROUTE_WEEK*
mysqldump EvilCorp > ${ROUTE_WEEK}backup.sql
tar -czvf ${ROUTE_WEEK}backup_$WEEK.tar.gz ${ROUTE_WEEK}backup.sql
rm ${ROUTE_WEEK}backup.sql
fi
done


for FILE_NAME_MONTH in $FILE_LIST_MONTH
do
if [ $FILE_NAME_MONTH != "backup_${MONTH}" ]
then
rm $ROUTE_MONTH*
mysqldump EvilCorp > ${ROUTE_MONTH}backup.sql
tar -czvf ${ROUTE_MONTH}backup_$MONTH.tar.gz ${ROUTE_MONTH}backup.sql
rm ${ROUTE_MONTH}backup.sql
fi
done

