#!/bin/sh

/usr/bin/emerge-webrsync
/usr/bin/emerge --sync
if ! command -v ansible; then
   # Ansible wants equery tool provided by app-portage/gentoolkit
   /usr/bin/emerge -v app-portage/gentoolkit
   /usr/bin/emerge -v ansible
fi
