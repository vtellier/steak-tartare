#!/bin/bash

# Load up .env
set -o allexport
[[ -f .env ]] && source .env
set +o allexport

echo "Will override everything on s3 bucket '$S3_BUCKET'."

aws s3 sync ./public s3://$S3_BUCKET --delete --cache-control max-age=86400

aws s3 website s3://$S3_BUCKET --index-document index.html --error-document 404.html

