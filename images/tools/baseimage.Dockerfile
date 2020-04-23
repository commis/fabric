# Copyright Greg Haskins All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
FROM hyperledger/fabric-baseimage:amd64-0.4.18
RUN npm install -g npm@latest
RUN apt-get update && apt-get install --assume-yes -y apt-utils
RUN apt-get install -y jq

# Install fabric-ca dependencies

RUN rm -rf /var/cache/apt
