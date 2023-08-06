#!/bin/bash

set -e

rm -rf dist
npm run build
cp src/*.png dist/
terraform apply --auto-approve
aws s3 sync dist s3://designkod.se/ --exclude "*.map"
aws cloudfront create-invalidation --distribution-id E2AE8XCF1HCG31 --paths "/*" --no-cli-pager
