#!/bin/bash
set -e

# Build the Docker image
docker build -t webpage:v1 .

# Log in to Docker Hub
echo "$DOCKERHUB" | docker login -u "$DOCKERHUB" --password-stdin

# Push the Docker image to the dev repository
docker tag webpage:v1 mani970/dev:v1
docker push mani970/dev:v1

# Push the Docker image to the prod repository
docker tag webpage:v1 mani970/prod:v1
docker push mani970/prod:v1
