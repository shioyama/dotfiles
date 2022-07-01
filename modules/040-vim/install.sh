#!/usr/bin/env zsh

MYDIR="${0:a:h}"

vimrc="${HOME}"/.vimrc

if [ ! -L $vimrc ] && [ ! -f $vimrc ]
then
  echo "== Link vimrc =="
  ln -s "${MYDIR}/vimrc" $vimrc
else
  echo "== vimrc already exists =="
fi

echo "== Copy vim files =="

mkdir -p ~/.vim/colors
cp grb256.vim ~/.vim/colors/
cp ir_black.vim ~/.vim/colors/

echo "== Install VIM Plug =="

DOTVIM="${HOME}/.vim"
PLUGGED="${DOTVIM}/plugged"
AUTOLOAD="${DOTVIM}/autoload"

mkdir -p "${PLUGGED}" "${AUTOLOAD}"

plug="$MYDIR"/../../submodules/vim-plug/plug.vim
ln -s "$MYDIR"/../../submodules/vim-plug/plug.vim "$AUTOLOAD"

echo "== Install VIM plugins =="
vim -S "$MYDIR"/snapshot.vim +qall >/dev/null 2>&1
