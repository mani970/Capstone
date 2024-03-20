#!/bin/bash

if [ "$1" == "dev" ]; then
  echo "Pushing Docker image to dev repo in Docker Hub..."
  docker-compose push
elif [ "$1" == "prod" ]; then
  echo "Pushing Docker image to prod repo in Docker Hub..."
  docker-compose push
fi
