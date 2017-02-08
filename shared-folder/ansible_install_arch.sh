#!/bin/sh

/usr/bin/pacman -Syy
if ! command -v ansible; then
   /usr/bin/pacman -S --verbose --noconfirm ansible
fi
