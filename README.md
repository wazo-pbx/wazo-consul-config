# The packaging information for consul in XiVO

This repository contains the packaging information for [consul](www.consul.io).

To get a new version of consul in the XiVO repository, set the desired version
in the `VERSION` file, update the `SHA256SUM_${ARCH}` files and increment the version in
the changelog file.

The check sum can be retrieved from the [consul download page](https://consul.io/downloads.html).

[Jenkins](jenkins.xivo.io) will then retrieve and build the new version.

## Install

This package is automatically installed on a XiVO version 15.09 or higher.

To install on Debian 8 (jessie):

```sh
sudo sh -c "echo 'deb http://mirror.xivo.io/debian/ xivo-dev main' > /etc/apt/sources.list.d/xivo.list"
sudo sh -c "wget http://mirror.xivo.io/xivo_current.key -O - | apt-key add -"
sudo apt-get update
sudo apt-get install consul
```

See the [documentation](http://documentation.xivo.io/en/latest/system/consul.html) to use consul with your own configuration.
