#!/bin/sh
set -e
BACKUP_NAME="mongodump_$(date -u +%Y-%m-%d_%H-%M-%S).gz"

[ -z "${MONGO_URI}" ] && { echo "Please specify MONGO_URI" > /dev/stderr; exit 1;}

echo "Backing up ${MONGO_URI}"

mongodump -v --uri ${MONGO_URI} --archive=./tmp/${BACKUP_NAME} --gzip

echo "Backup up FINISHED"
