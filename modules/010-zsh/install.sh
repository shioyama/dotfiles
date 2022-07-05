#!/bin/zsh

MYDIR="${0:a:h}"
DOTZSH="${HOME}/.zsh"

zshrc="${HOME}"/.zshrc

if [ ! -L $zshrc ] && [ ! -f $zshrc ]
then
  echo "== Link zshrc =="
  ln -sf "${MYDIR}/zshrc" $zshrc
else
  echo "== zshrc already exists =="
fi

mkdir -p $DOTZSH
cp "${MYDIR}/git.zsh" $DOTZSH
