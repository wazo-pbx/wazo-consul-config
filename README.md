# The packaging information for consul in Wazo

This repository contains the packaging information for [consul](www.consul.io).

To get a new version of consul in the Wazo repository, set the desired version
in the `VERSION` file and increment the version in the changelog file.

The check sum can be retrieved from the [consul download page](https://consul.io/downloads.html).

[Jenkins](jenkins.wazo.community) will then retrieve and build the new version.

## Install

This package is automatically installed on a Wazo version 15.09 or higher.

To install on Debian 8 (jessie):

```sh
sudo sh -c "echo 'deb http://mirror.wazo.community/debian/ wazo-dev main' > /etc/apt/sources.list.d/wazo.list"
sudo sh -c "wget http://mirror.wazo.community/wazo_current.key -O - | apt-key add -"
sudo apt-get update
sudo apt-get install consul
```

See the [documentation](http://documentation.wazo.community/en/latest/system/consul.html) to use consul with your own configuration.

## Building Locally

To build on a test environment before submitting a change to production the following procedure can be used.

```sh
make -f debian/rules get-orig-source
tar -xvf ../xivo-consul-packaging_*.orig.zip  --strip 1
dpkg-buildpackage -us -uc
```
The `.deb` will be located in the parent directory.
