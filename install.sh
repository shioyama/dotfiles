#!/bin/zsh

if ! command -v rg &> /dev/null; then
  sudo apt install -y ripgrep
  sudo apt install -y hub
  sudo apt install -y vim-gtk3 # for clipboard support
  sudo apt install -y silversearcher-ag
fi

eval "$(hub alias -s)"

ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/pryrc ~/.pryrc

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
plugins=(
  'junegunn/fzf'
  '4cd621e877cb3a8e44b12ba3a7ce58709862922f'
  'junegunn/fzf.vim'
  'a88311b222eb9f90fa9fa72292e61d15c6767866'
  'tpope/vim-fugitive'
  '32b0d6266361614a6a07cfe850750e900cd50575'
  'tpope/vim-commentary'
  '349340debb34f6302931f0eb7139b2c11dfdf427'
  'tpope/vim-eunuch'
  'dbbbf853fc523d312f61b4bbdf2e13297645dcde'
  'vim-scripts/matchit.zip'
  'ced6c409c9beeb0b4142d21906606bd194411d1d'
  'rking/ag.vim'
  '4a0dd6e190f446e5a016b44fdaa2feafc582918e'
  'tpope/vim-repeat'
  '24afe922e6a05891756ecf331f39a1f6743d3d5a'
  'tpope/vim-surround'
  'f51a26d3710629d031806305b6c8727189cd1935'
  'tpope/vim-unimpaired'
  '4afbe5ebf32ad85341b4c02b0e1d8ca96a64c561'
  'tpope/vim-rake'
  '34ece18ac8f2d3641473c3f834275c2c1e072977'
  'tpope/vim-rails'
  'e2c72b5cfb6a4e07e70806198c1ff491a6077fa8'
  'tpope/vim-bundler'
  '40efd19c0a4447ff2f142d3d89735ac3d637a355'
  'tpope/vim-dispatch'
  '250ea269e206445d10700b299afd3eb993e939ad'
  'tpope/vim-endwise'
  '4289889a2622f9bc7c594a6dd79763781f63dfb5'
  'tpope/vim-abolish'
  '3f0c8faadf0c5b68bcf40785c1c42e3731bfa522'
  'thoughtbot/vim-rspec'
  '52a72592b6128f4ef1557bc6e2e3eb014d8b2d38'
  'shioyama/vim-to-github'
  '290d7414e5f48040b25fba538c0d94de482e3b7a'
  'itchyny/lightline.vim'
  '8a712365f9708044667589d9fffd87a4825d29f6'
)

for plugin commit in ${(@k)plugins};
do
  name="${plugin#*/}"
  mkdir ~/.vim/pack/vendor/start/$name
  cd ~/.vim/pack/vendor/start/$name
  git init
  git remote add origin https://github.com/$plugin.git
  git fetch --depth 1 origin $commit
  git checkout FETCH_HEAD
done

~/.vim/pack/vendor/start/fzf/install --all
