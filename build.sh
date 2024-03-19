#!/bin/bash

# Build the Docker image
docker build -t webpage:v1 .

# Push the Docker image to the Docker Hub dev repository
docker push mani970/dev/webpage:v1
