#!/bin/bash

DIRECTORY=`dirname $0`
CONTEXT_FOLDER=catalog-go

cd ${CONTEXT_FOLDER}
podman build -t catalog-coolstore -f Dockerfile .
podman run -d -p 8080:9080 catalog-coolstore

