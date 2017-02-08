#!/bin/sh -eux

/usr/bin/eselect python set python2.7

mkdir -p /var/tmp/portage
/bin/mount -t tmpfs -o "size=4G,uid=portage,gid=portage,mode=775,noatime" tmpfs /var/tmp/portage
