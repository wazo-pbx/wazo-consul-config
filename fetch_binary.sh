#!/bin/bash
# Copyright (C) 2015 Avencall
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>

set -e

ARCH=${DEB_BUILD_ARCH}
if [ "${DEB_BUILD_ARCH}" = "i386" ]
then
    ARCH=386
fi
if [ "${DEB_BUILD_ARCH}" = "armhf" ]
then
    ARCH=arm
fi

VERSION=$(cat VERSION)
FILENAME=consul_${VERSION}_linux_${ARCH}.zip
URL="https://releases.hashicorp.com/consul/${VERSION}/${FILENAME}"
URL_SHA256="https://releases.hashicorp.com/consul/${VERSION}/consul_${VERSION}_SHA256SUMS"

rm -rf tmp
mkdir tmp
cd tmp

wget -nv -O "${FILENAME}" "${URL}"
curl -s ${URL_SHA256} | awk "/linux_${ARCH}/" > consul_${VERSION}_SHA256SUMS
if ! sha256sum --status -c consul_${VERSION}_SHA256SUMS ; then
    echo "sha256sum did not match" >&2
    exit 1
fi

unzip "${FILENAME}"
