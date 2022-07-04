#!/bin/zsh

ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/pryrc ~/.pryrc

mkdir -p ~/.zsh
cp zsh/git.zsh ~/.zsh/

cp gitconfig ~/.gitconfig.local
cat << ZSH_CONFIG >> ~/.gitconfig
[include]
    path = ~/.gitconfig.local
ZSH_CONFIG

SCRIPTPATH="${0:a:h}"

echo "== Update git submodules =="
git -C "$SCRIPTPATH" submodule update --init

echo "== Install packages =="

if [ $SPIN ]; then
  sudo apt install -y ripgrep
  sudo apt install -y hub
  sudo apt install -y vim-gtk3 # for clipboard support
  sudo apt install -y silversearcher-ag
else
  brew install ripgrep
  brew install hub
  brew install the_silver_searcher
fi

# Allow modules to hook into install
for file in "$SCRIPTPATH"/modules/*/install.sh; do
  source "$file"
done
