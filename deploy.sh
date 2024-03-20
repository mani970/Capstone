#!/bin/bash
set -e

# Check if the branch is dev or master
if [ "$BRANCH" == "dev" ]; then
    # Push the Docker image to the dev repository
    docker tag webpage:v1 mani970/dev:v1
    docker push mani970/dev:v1
elif [ "$BRANCH" == "master" ]; then
    # Push the Docker image to the prod repository
    docker tag webpage:v1 mani970/prod:v1
    docker push mani970/prod:v1
else
    echo "It is Invalid branch: $BRANCH"
    exit 1
fi
