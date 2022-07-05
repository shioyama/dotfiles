#!/bin/zsh

THISDIR="${0:a:h}"

cp "$THISDIR/gitconfig" "$HOME/.gitconfig.local"
cat << ZSH_CONFIG >> "${HOME}/.gitconfig"
[include]
    path = ~/.gitconfig.local
ZSH_CONFIG

