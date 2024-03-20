#!/bin/bash

echo "Logging in to Docker Hub"

docker login --username $DOCKERHUB_USERNAME --password $DOCKERHUB_TOKEN

echo "Deploying Docker image to Docker Hub"

docker push mani970/dev:webpage:v1
