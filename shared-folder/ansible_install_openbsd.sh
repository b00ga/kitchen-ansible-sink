#!/bin/sh

if ! command -v ansible; then
   /usr/sbin/pkg_add -v ansible
fi
