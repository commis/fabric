# Copyright Greg Haskins All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
FROM hyperledger/fabric-baseos:amd64-0.4.18

# Install fabric-ca dependencies
RUN apt-get update && apt-get install -y netcat
RUN rm -rf /var/cache/apt
