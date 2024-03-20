#!/bin/bash

# Login to Docker Hub
echo "${DOCKERHUB}" | docker login --username mani970 --password-stdin

# Push Docker image to the appropriate repository based on branch
if [ "$BRANCH_NAME" == "dev" ]; then
    docker-compose push dev
elif [ "$BRANCH_NAME" == "master" ]; then
    docker-compose push prod
fi
