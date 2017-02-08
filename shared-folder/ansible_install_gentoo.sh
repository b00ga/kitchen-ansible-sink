#!/bin/sh

#/usr/bin/emerge --sync
/usr/bin/emerge-webrsync
MAKEOPTS="-j4" /usr/bin/emerge -uDU --with-bdeps=y --jobs=4 @world
if ! command -v ansible; then
   /usr/bin/emerge -v dev-python/packaging
   /usr/bin/emerge -v ansible
fi
echo "dev-vcs/git  -perl -gpg -webdav" > /etc/portage/package.use/git
/usr/bin/emerge -v eix
/usr/bin/eix-update
