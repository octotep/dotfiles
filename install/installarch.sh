#!/bin/bash

## Update and install necessary packages
pacman -Syu
pacman -S zsh tmux

## Install tmux plugin manager
./installtmux.sh
