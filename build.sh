#!/bin/bash

echo "Building Docker image webpage:v1"

docker build -t mani970/dev:webpage:v1 .

echo "Pushing Docker image to Docker Hub"

docker push mani970/dev:webpage:v1
