#!/bin/sh
set -e
BACKUP_NAME="mongodump_$(date -u +%Y-%m-%d_%H-%M-%S).gz"

[ -z "${MONGO_URI}" ] && { echo "Please specify MONGO_URI" > /dev/stderr; exit 1;}
[ -z "${S3_BUCKET}" ] && { echo "Please specify S3_BUCKET" > /dev/stderr; exit 1;}
[ -z "${S3_PATH}" ] && { echo "Please specify S3_PATH" > /dev/stderr; exit 1;}

echo "Backing up ${MONGO_URI}"

mongodump -v --uri ${MONGO_URI} --archive --gzip | aws s3 cp - s3://${S3_BUCKET}/${S3_PATH}/${BACKUP_NAME}

echo "Backup up FINISHED"
