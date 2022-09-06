#!/usr/bin/env zsh

THISDIR="${0:a:h}"
DOTVIM="${HOME}/.config/nvim"

vimrc="${DOTVIM}"/init.vim

if [ ! -L $vimrc ] && [ ! -f $vimrc ]
then
  echo "== Link vimrc =="
  ln -s "${THISDIR}"/vimrc $vimrc
else
  echo "== vimrc already exists =="
fi

echo "== Copy vim files =="

mkdir -p "$DOTVIM"/colors
ln -s "$THISDIR"/grb256.vim "$DOTVIM"/colors
ln -s "$THISDIR"/ir_black.vim "$DOTVIM"/colors

echo "== Install VIM Plug =="

PLUGGED="${DOTVIM}/plugged"
AUTOLOAD="${DOTVIM}/autoload"

mkdir -p "${PLUGGED}" "${AUTOLOAD}"

ln -s "$THISDIR"/../../submodules/vim-plug/plug.vim "$AUTOLOAD"

ln -s "$THISDIR"/plugins.vim "$DOTVIM"

echo "== Install VIM plugins =="
nvim -u "$THISDIR"/plugins.vim -S "$THISDIR"/snapshot.vim +qall
