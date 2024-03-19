#!/bin/bash

# Build the Docker image
docker build -t ${DOCKER_REGISTRY} .

# Push the Docker image to the Docker Hub dev repository
docker push ${DOCKER_REGISTRY}
