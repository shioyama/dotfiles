#!/bin/zsh

THISDIR="${0:a:h}"

files=(".zshrc")

for file in "${files[@]}"; do
  source="$THISDIR/$file"
  link="$HOME/$file"

  echo "== Link $file =="

  if [ -f "$link" -a ! "$(readlink "$link")" -ef "$source" ]; then
    mv "$link" "${link}_orig"
  fi

  ln -s -f "$source" "$link"
done
