#!/bin/bash

# may require 
# podman login registry.redhat.io
# you must also set PRIMARY_ETH

#set -x
PRIMARY_ETH=ens1u1
DIRECTORY=$(dirname $(realpath -s $0))
NAMESPACE=coolstore

SERVICE=catalog
CONTEXT=catalog-go
cd $DIRECTORY/$CONTEXT
podman build -t $NAMESPACE/$CONTEXT .
podman rm -f $NAMESPACE-$SERVICE || :
podman run -d --name $NAMESPACE-$SERVICE -p 9080:8090 $NAMESPACE/$CONTEXT

SERVICE=inventory
CONTEXT=inventory-quarkus
cd $DIRECTORY/$CONTEXT
podman build -t $NAMESPACE/$CONTEXT .
podman rm -f $NAMESPACE-$SERVICE || :
podman run -d --name $NAMESPACE-$SERVICE -p 9081:8080 $NAMESPACE/$CONTEXT

IP_ADDRESS=$(ip -4 addr | grep $PRIMARY_ETH | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
SERVICE=gateway
CONTEXT=gateway-dotnet
cd $DIRECTORY/$CONTEXT
podman build -t $NAMESPACE/$CONTEXT .
podman rm -f $NAMESPACE-$SERVICE || :
podman run -d --name $NAMESPACE-$SERVICE \
    -e COMPONENT_CATALOG_HOST=$IP_ADDRESS \
    -e COMPONENT_CATALOG_PORT=9080 \
    -e COMPONENT_INVENTORY_HOST=$IP_ADDRESS \
    -e COMPONENT_INVENTORY_PORT=9081 \
    -p 9082:8085 \
    $NAMESPACE/$CONTEXT

