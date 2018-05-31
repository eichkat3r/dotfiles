#!/bin/bash

# install dependencies
pacman -Sy i3 rofi vim autojump rxvt-unicode firefox

# install home config files
cp -i -r home/* ~/