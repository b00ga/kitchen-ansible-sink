#!/bin/sh

if ! command -v ansible; then
   CFLAGS="-I/usr/include/gmp -I/usr/lib/libffi-3.0.13/include" pip install ansible
fi
