#!/bin/zsh

THISDIR="${0:a:h}"

zshrc="${HOME}"/.zshrc

if [ ! -L $zshrc ] && [ ! -f $zshrc ]
then
  echo "== Link zshrc =="
  ln -sf "${THISDIR}/.zshrc" $zshrc
else
  echo "== zshrc already exists =="
fi
