#!/bin/bash

#set -ex

SCRIPT_DIR=$(cd $(dirname $(readlink -f "$0")) && pwd)

GO_VER=1.14.1
ALPINE_VER=3.11
DOCKER_IMAGES="Dockerfile.golang-golang.local"

build_dockerImage() {
    for str in ${DOCKER_IMAGES}; do
        dockerFile=${str%-*}
        imageName=${str#*-}
        # echo "docker file [${dockerFile}] - image [${imageName}]"
        target=$(docker images | grep "${imageName}" | awk '{print $3}')
        if [ "$target" = "" ]; then
            echo "Building docker image for ${imageName}"
            docker build --build-arg GO_VER=${GO_VER} --build-arg ALPINE_VER=${ALPINE_VER} \
                -t fabric-${imageName} -f "${SCRIPT_DIR}/${dockerFile}" "${SCRIPT_DIR}"
        fi
    done
}

# main function
if [ $# == 2 ]; then
    GO_VER=$1
    ALPINE_VER=$2
fi
build_dockerImage
