#!/bin/zsh

if ! command -v rg &> /dev/null; then
  sudo apt-get install -y ripgrep
fi

ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/zshrc ~/.zshrc

mkdir -p ~/.vim/pack/vendor/start
mkdir -p ~/.vim/colors
cp grb256.vim ~/.vim/colors/
cp ir_black.vim ~/.vim/colors/

mkdir -p ~/.zsh
cp zsh/git.zsh ~/.zsh/

cp gitconfig ~/.gitconfig.local
cat << ZSH_CONFIG >> ~/.gitconfig
[include]
    path = ~/.gitconfig.local
ZSH_CONFIG

# VIM PLUGINS
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.vim/pack/vendor/start/fzf
~/.vim/pack/vendor/start/fzf/install --all

plugins=(
  'junegunn/fzf.vim'
  'tpope/vim-fugitive'
  'vim-ruby/vim-ruby'
  'tpope/vim-commentary'
  'tpope/vim-eunuch'
  'vim-scripts/matchit.zip'
  'rking/ag.vim'
  'tpope/vim-repeat'
  'tpope/vim-surround'
  'tpope/vim-unimpaired'
  'tpope/vim-rake'
  'tpope/vim-rails'
  'tpope/vim-bundler'
  'tpope/vim-dispatch'
  'tpope/vim-endwise'
  'tpope/vim-abolish'
  'thoughtbot/vim-rspec'
  'shioyama/vim-to-github'
  'vim-scripts/ruby.vim'
  'itchyny/lightline.vim'
)

for plugin in $plugins;
do
  name="${plugin#*/}"
  git clone --depth 1 https://github.com/$plugin.git ~/.vim/pack/vendor/start/$name
done
