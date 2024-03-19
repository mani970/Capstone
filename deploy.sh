#!/bin/bash

# Pull the Docker image from the Docker Hub dev repository
docker pull mani970/dev/webpage:v1

# Run the Docker container using docker-compose
docker-compose up -d
