#!/bin/sh -eux

mkdir -p /usr/local/bin
ln -s /usr/pkg/bin/sudo /usr/local/bin/sudo

# Update pkgin db to latest. Currently only supporting NetBSD7
/usr/bin/sed -i -e 's/^http/#http/' /usr/pkg/etc/pkgin/repositories.conf
#echo 'http://ftp.netbsd.org/pub/pkgsrc/packages/NetBSD/$arch/7.0_current/All' >> /usr/pkg/etc/pkgin/repositories.conf
echo 'http://cdn.netbsd.org/pub/pkgsrc/packages/NetBSD/$arch/7.0_current/All/' >> /usr/pkg/etc/pkgin/repositories.conf
/usr/pkg/bin/pkgin update

/usr/pkg/bin/pkgin -y install curl mozilla-rootcerts
ln -s /usr/pkg/bin/curl /usr/local/bin/curl

# Make sure cert db is up-to-date (doesn't exist if we just installed this as a dependency)
/usr/pkg/sbin/mozilla-rootcerts install
