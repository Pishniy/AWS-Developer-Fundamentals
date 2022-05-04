#/bin/bash

S3_BUCKET_NAME="aws-developer-fundamentals-bucket"
SIMPLE_FILE_VERSION="45.3.2"

function createSimpleFile() {
    echo "Version_$1" > simple_small_file.txt
}

createSimpleFile $SIMPLE_FILE_VERSION




aws s3 mb s3://$S3_BUCKET_NAME
aws s3api put-bucket-versioning --bucket $S3_BUCKET_NAME --versioning-configuration Status=Enabled
aws s3 cp simple_small_file.txt s3://$S3_BUCKET_NAME