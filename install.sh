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

git clone --depth 1 https://github.com/junegunn/fzf.vim.git ~/.vim/pack/vendor/start/fzf.vim
git clone --depth 1 https://github.com/tpope/vim-fugitive.git ~/.vim/pack/vendor/start/vim-fugitive
git clone --depth 1 https://github.com/vim-ruby/vim-ruby.git ~/.vim/pack/vendor/start/vim-ruby
git clone --depth 1 https://github.com/tpope/vim-commentary.git ~/.vim/pack/vendor/start/vim-commentary
git clone --depth 1 https://github.com/tpope/vim-eunuch.git ~/.vim/pack/vendor/start/vim-eunuch
git clone --depth 1 https://github.com/vim-scripts/matchit.zip.git ~/.vim/pack/vendor/start/matchit.zip
git clone --depth 1 https://github.com/rking/ag.vim.git ~/.vim/pack/vendor/start/ag.vim
git clone --depth 1 https://github.com/tpope/vim-repeat.git ~/.vim/pack/vendor/start/vim-repeat
git clone --depth 1 https://github.com/tpope/vim-surround.git ~/.vim/pack/vendor/start/vim-surround
git clone --depth 1 https://github.com/tpope/vim-unimpaired.git ~/.vim/pack/vendor/start/vim-unimpaired
git clone --depth 1 https://github.com/tpope/vim-rake.git ~/.vim/pack/vendor/start/vim-rake
git clone --depth 1 https://github.com/tpope/vim-rails.git ~/.vim/pack/vendor/start/vim-rails
git clone --depth 1 https://github.com/tpope/vim-bundler.git ~/.vim/pack/vendor/start/vim-bundler
git clone --depth 1 https://github.com/tpope/vim-dispatch.git ~/.vim/pack/vendor/start/vim-dispatch
git clone --depth 1 https://github.com/tpope/vim-endwise.git ~/.vim/pack/vendor/start/vim-endwise
git clone --depth 1 https://github.com/tpope/vim-abolish.git ~/.vim/pack/vendor/start/vim-abolish
git clone --depth 1 https://github.com/thoughtbot/vim-rspec.git ~/.vim/pack/vendor/start/vim-rspec
git clone --depth 1 https://github.com/shioyama/vim-to-github.git ~/.vim/pack/vendor/start/to-github
git clone --depth 1 https://github.com/vim-scripts/ruby.vim.git ~/.vim/pack/vendor/start/ruby.vim
git clone --depth 1 https://github.com/itchyny/lightline.vim ~/.vim/pack/vendor/start/lightline.vim
