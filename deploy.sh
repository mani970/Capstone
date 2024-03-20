#!/bin/bash

# Log in to Docker Hub
echo "$DOCKERHUB_PASSWORD" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin

# Push the Docker image to Docker Hub
docker tag webpage:v1 "$DOCKERHUB_USERNAME"/"$DOCKERHUB_REPO_NAME":latest
docker push "$DOCKERHUB_USERNAME"/"$DOCKERHUB_REPO_NAME":latest
