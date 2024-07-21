#!/bin/bash
set -e

docker build -f linux.cover.dockerfile -t linux.cover.alist-org.times .
docker create --name linux.cover.alist-org.times linux.cover.alist-org.times
docker cp linux.cover.alist-org.times:/go/src/github.com/alist-org/times/profile.cov .
docker rm -v linux.cover.alist-org.times