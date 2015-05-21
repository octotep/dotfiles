#!/bin/bash

## Configure the tmux plugin manager (straight from tpm wiki)
tmux start-server
tmux new-session -d
~/.tmux/plugins/tpm/scripts/install_plugins.sh
tmux kill-server
