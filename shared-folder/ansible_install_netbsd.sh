#!/bin/sh

if ! command -v ansible; then
   /usr/pkg/bin/pkgin -y install ansible
fi
