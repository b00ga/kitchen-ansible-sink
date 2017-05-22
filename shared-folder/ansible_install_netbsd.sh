#!/bin/sh

/usr/pkg/bin/pkgin -y update

if ! command -v ansible; then
   /usr/pkg/bin/pkgin -y install ansible
fi
