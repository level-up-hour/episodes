#!/bin/bash

# may require 
# podman login registry.redhat.io
set -x
DIRECTORY=$(dirname $(realpath -s $0))
NAMESPACE=coolstore
BACKEND_POD=coolstore-backend

podman pod rm -f $BACKEND_POD || :
podman pod create --name $BACKEND_POD \
    -p 9080:8085

SERVICE=catalog
CONTEXT=catalog-go
cd $DIRECTORY/$CONTEXT
podman run --pod $BACKEND_POD -d --name $NAMESPACE-$SERVICE $NAMESPACE/$CONTEXT

SERVICE=inventory
CONTEXT=inventory-quarkus
cd $DIRECTORY/$CONTEXT
podman build -t $NAMESPACE/$CONTEXT .
podman run --pod $BACKEND_POD -d --name $NAMESPACE-$SERVICE $NAMESPACE/$CONTEXT

SERVICE=gateway
CONTEXT=gateway-dotnet
cd $DIRECTORY/$CONTEXT
podman build -t $NAMESPACE/$CONTEXT .
podman run --pod $BACKEND_POD -d --name $NAMESPACE-$SERVICE \
    -e COMPONENT_CATALOG_HOST=localhost \
    -e COMPONENT_CATALOG_PORT=8090 \
    -e COMPONENT_INVENTORY_HOST=localhost \
    -e COMPONENT_INVENTORY_PORT=8080 \
    $NAMESPACE/$CONTEXT

