#!/bin/bash

# Build Docker image using docker-compose
docker-compose build

# Run the container
docker-compose up -d
