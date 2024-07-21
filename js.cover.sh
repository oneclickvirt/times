#!/bin/bash
set -e

docker build -f js.cover.dockerfile -t js.cover.alist-org.times .
docker create --name js.cover.alist-org.times js.cover.alist-org.times
docker cp js.cover.alist-org.times:/go/src/github.com/alist-org/times/profile.cov .
docker rm -v js.cover.alist-org.times