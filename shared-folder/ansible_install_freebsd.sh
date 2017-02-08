#!/bin/sh

export PATH=/usr/sbib:/usr/local/sbin

if ! command -v ansible; then
   pkg install -y ansible
fi
