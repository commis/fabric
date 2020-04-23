#!/bin/bash

DOCKER_IMAGE_LOCAL='fabric-baseimage.local'
target=$(docker images | grep "${DOCKER_IMAGE_LOCAL}" | awk '{print $3}')
if [ "$target" = "" ]; then
    echo "Building docker ${DOCKER_IMAGE_LOCAL} image"
    docker build -t ${DOCKER_IMAGE_LOCAL}:latest -f ./baseimage.Dockerfile .
fi

DOCKER_IMAGE_LOCAL='fabric-baseos.local'
target=$(docker images | grep "${DOCKER_IMAGE_LOCAL}" | awk '{print $3}')
if [ "$target" = "" ]; then
    echo "Building docker ${DOCKER_IMAGE_LOCAL} image"
    docker build -t ${DOCKER_IMAGE_LOCAL}:latest -f ./baseos.Dockerfile .
fi
