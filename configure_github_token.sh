#!/bin/bash

# bash configure_github_token.sh [container] [access-token]
CONTAINER=$1

TOKEN="\"https://$2:@github.com/\""

docker exec $CONTAINER bash -c "git config --global url.${TOKEN}.insteadOf \"https://github.com/\""
