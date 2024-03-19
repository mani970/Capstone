#!/bin/bash

# Login to Docker Hub using GitHub Actions secret
echo "${{ secrets.DOCKERTOKEN }}" | docker login --username mani970 --password-stdin

# Build the Docker image
docker-compose build

# Tag the Docker image
docker tag mani970/webpage:v1 mani970/webpage:v1

# Push the Docker image to Docker Hub
docker push mani970/webpage:v1

# Run the Docker container
docker-compose up -d
