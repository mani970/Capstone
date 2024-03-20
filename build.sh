#!/bin/bash

# Build the Docker image
docker build -t webpage:v1 .

# Log in to Docker Hub
echo "$DOCKERHUB_PASSWORD" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin

# Push the Docker image to Docker Hub
docker tag webpage:v1 mani970/dev:latest
docker push mani970/dev:latest

# Checkout the dev branch
git checkout dev

# Push the Docker image to the dev repository in Docker Hub
docker tag webpage:v1 mani970/prod:latest
docker push mani970/prod:latest

# Checkout the master branch
git checkout master

# Push the Docker image to the prod repository in Docker Hub
docker tag webpage:v1 mani970/prod:latest
docker push mani970/prod:latest
