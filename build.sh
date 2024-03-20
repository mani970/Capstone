#!/bin/bash

# Build the Docker image
docker build -t webpage:v1 .

# Log in to Docker Hub
echo "${DOCKERHUB_TOKEN}" | docker login -u "${DOCKERHUB_USERNAME}" --password-stdin

# Push the Docker image to Docker Hub
docker tag webpage:v1 mani970/dev:v1
docker push mani970/dev:v1

