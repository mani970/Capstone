#!/bin/bash

function build-and-run() {
  # Build Docker image
  docker build -t webpage:v1 .

  # Run Docker container
  docker run -d -p 80:80 webpage:v1
}

# Call the function to build and run the Docker image
build-and-run
