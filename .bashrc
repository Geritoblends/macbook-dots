#!/bin/bash

if [ -d "$HOME/.bashrc.d" ]; then
    for file in "$HOME"/.bashrc.d/*.sh; do
        [ -r "$file" ] && source "$file"
    done
fi
