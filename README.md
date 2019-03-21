Docker Image for MongoDB AWS S3 backups based on [Alpine Linux](http://www.alpinelinux.org), [mongodump](https://docs.mongodb.com/manual/reference/program/mongodump/) and [awscli](https://github.com/aws/aws-cli)

## Use

### Environment variables

- `MONGO_URI` - MongoDB URI, e.g. `mongodb://username:password@host:port/db`
- `S3_BUCKET` - S3 bucket name where backups will be stored.
- `S3_PATH` - Path in your bucket where backups will be stored.

## IAM Policy

IAM Policy you need to add to IAM user.
