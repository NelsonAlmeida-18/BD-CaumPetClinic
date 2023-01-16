#!/bin/sh

if [ ! -d "./logs" ]; then
  mkdir -p "./logs"
fi

echo "BackupScript for CaumPetClinic executed @$(date +\%Y\%m\%d_\%H\%M)" >> "./logs/logs.txt"

database="CaumPetClinic"
filename="$3/$database-$(date +\%Y\%m\%d_\%H\%M).sql"
TZ=UTC mysqldump --user=$1 --password=$2 --host="localhost" $database > $filename
echo "mysqldump --user=\"$1\" --password=\"$2\" --host="localhost" $database > $filename"
echo "Successful backup at $(date +%Y%m%d_%H:%M) "