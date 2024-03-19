#!/bin/bash

if [ "$1" == "dev" ]; then
    docker login -u mani970 -p ${secrets.DOKERTOKEN}
    docker tag webpage:v1 mani970/dev/webpage:v1
    docker push mani970/dev/webpage:v1
elif [ "$1" == "prod" ]; then
    docker login -u mani970 -p ${secrets.DOKERTOKEN}
    docker tag webpage:v1 mani970/prod/webpage:v1
    docker push mani970/prod/webpage:v1
fi
