#!/usr/bin/env zsh

THISDIR="${0:a:h}"
DOTVIM="${HOME}/.vim"

vimrc="${HOME}"/.vimrc

if [ ! -L $vimrc ] && [ ! -f $vimrc ]
then
  echo "== Link vimrc =="
  ln -s "${THISDIR}/vimrc" $vimrc
else
  echo "== vimrc already exists =="
fi

echo "== Copy vim files =="

mkdir -p "$DOTVIM/colors"
cp "$THISDIR/grb256.vim" "$DOTVIM/colors/"
cp "$THISDIR/ir_black.vim" "$DOTVIM/colors/"

echo "== Install VIM Plug =="

PLUGGED="${DOTVIM}/plugged"
AUTOLOAD="${DOTVIM}/autoload"

mkdir -p "${PLUGGED}" "${AUTOLOAD}"

plug="$THISDIR"/../../submodules/vim-plug/plug.vim
ln -s "$THISDIR"/../../submodules/vim-plug/plug.vim "$AUTOLOAD"

echo "== Install VIM plugins =="
vim -S "$THISDIR"/snapshot.vim +qall >/dev/null 2>&1
