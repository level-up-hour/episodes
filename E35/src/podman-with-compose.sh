#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ansible-playbook -i "localhost," -c local $DIR/podman-with-compose.yaml -K
