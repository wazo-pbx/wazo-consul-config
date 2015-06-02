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

URL="https://dl.bintray.com/mitchellh/consul/"
VERSION=$(cat VERSION)
FILENAME=${VERSION}_linux_${ARCH}.zip
FILES=([1]=0.5.2_linux_386.zip [2]=0.5.2_linux_amd64.zip)

rm -rf tmp
mkdir tmp
cd tmp

for index in 1 2
do
    echo "download ${FILES[index]} sur ${URL}${FILES[index]}"
    wget -nv -O "${FILES[index]}" "${URL}${FILES[index]}"
done

if ! sha256sum --status -c ../SHA256SUM ; then
    echo "sha256sum did not match" >&2
    exit 1
fi

unzip "${FILENAME}"
