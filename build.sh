#!/bin/bash

if [ "$1" == "build-and-run" ]; then
    docker build -t webpage:v1 .
    docker-compose up -d
fi
