#!/bin/zsh

ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/pryrc ~/.pryrc

SCRIPTPATH="${0:a:h}"

echo "== Update git submodules =="
git -C "$SCRIPTPATH" submodule update --init

echo "== Install packages =="

if [ $SPIN ]; then
  sudo apt install -y ripgrep
  sudo apt install -y hub
  sudo apt install -y neovim
  sudo apt install -y silversearcher-ag
  sudo apt install -y bat
else
  brew install ripgrep
  brew install hub
  brew install the_silver_searcher
  brew install bat
fi

# Allow modules to hook into install
for file in "$SCRIPTPATH"/modules/*/install.sh; do
  source "$file"
done
