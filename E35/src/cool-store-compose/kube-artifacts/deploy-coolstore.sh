#!/bin/bash
COMPONENTS=( catalog inventory gateway web)
NAMESPACE_ROOT=coolstore-microservices

display_usage() {
    echo -e "\nPlease provide an EXTENSION to \"uniquify\" your namespace and a SERVER_NAME for the ingress.\n$0 EXTENSION SERVER_NAME (OS Options: $OS_OPTIONS) \n"
    echo -e "\nUsage:\n$0 EXTENSION SERVER_NAME \n"
}

# if two arguments not supplied, display usage
if [  $# != 2 ]; then
    echo "Please provide both arguments"
    display_usage
    exit 1
fi

# check whether user had supplied -h or --help . If yes display usage
if [[ ( $# == "--help") ||  $# == "-h" ]]; then
    display_usage
    exit 0
fi

EXTENSION=$1
NAMESPACE=$NAMESPACE_ROOT$EXTENSION

echo Creating $NAMESPACE
# create a namespace to contain the cool-store
kubectl create namespace $NAMESPACE

KUSTOMIZED_YAML=$(mktemp -d /tmp/$NAMESPACE-yaml.XXXXXX)
echo files to use being created in $KUSTOMIZED_YAML
for i in "${COMPONENTS[@]}"
do
    cp -R $i $KUSTOMIZED_YAML/
    if [ $i == 'web' ]; then
        sed -e "s/REPLACE_WITH_YOUR_OWN_HOST/$2/g" $i/$i-coolstore-ingress.yaml > $KUSTOMIZED_YAML/$i/$i-coolstore-ingress.yaml
    fi
    kubectl apply -f $KUSTOMIZED_YAML/$i -n $NAMESPACE
done
