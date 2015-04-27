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

BASE_URL="https://dl.bintray.com/mitchellh/consul"
VERSION=$(cat VERSION)
FILENAME=${VERSION}_linux_386.zip
URL=${BASE_URL}/${FILENAME}

wget -nc $URL
sha256sum --status -c <(grep linux_386 ${VERSION}_SHA256SUMS)
ret_code=$?
if [[ $ret_code != 0 ]]; then
    >&2 echo "sha256sum did not match"
    echo "Check that the SHA256SUMS file matches the VERSION you are downloading"
    exit $ret_code
fi

echo "Done"
