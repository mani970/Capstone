#!/bin/bash

function deploy() {
  # Login to Docker Hub using Docker token
  docker login -u Docker -p ${{secrets.DOCKERTOKEN}}

  # Tag Docker image
  TAG=${v1}
  docker tag webpage:v1 mani970/dev/webpage:${TAG}

  # Push Docker image
  docker push mani970/webpage:${TAG}
}
