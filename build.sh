#!/bin/sh

# use docker v1.13
source .env
docker build --squash --compress -t "${USER_NAME}/open-jtalk:latest" ./dockerfiles/open_jtalk
docker build --squash --compress -t "${USER_NAME}/htsvoice:latest" ./dockerfiles/htsvoice
docker build --squash --compress -t "${USER_NAME}/dictionary:latest" ./dockerfiles/dictionary
