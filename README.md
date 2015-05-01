# The packaging information for consul in XiVO

This repository contains the packaging information for [consul](www.consul.io).

To get a new version of consul in the XiVO repository, set the desired version
in the `VERSION` file, update the `SHA256SUM` files and increment the version in
the changelog file.

The check sum can be retrieved from the [consul download page](https://consul.io/downloads.html).

[Jenkins](jenkins.xivo.io) will then retrieve and build the new version.
