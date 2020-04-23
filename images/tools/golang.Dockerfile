# Copyright Greg Haskins All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#

ARG GO_VER
ARG ALPINE_VER
FROM golang:${GO_VER}-alpine${ALPINE_VER}

RUN apk add --no-cache tzdata musl-dev bash jq git make g++ gcc \
	libtool libltdl;
