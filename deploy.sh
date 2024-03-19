#!/bin/bash# Pull the Docker image from the Docker Hub dev repository
docker pull ${DOCKER_REGISTRY}

# Run the Docker container using docker-compose
docker-compose up -d
