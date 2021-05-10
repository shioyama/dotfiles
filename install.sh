ln -sf ~/dotfiles/vimrc ~/.vimrc
mkdir -p ~/.vim/pack/vendor/start

# VIM PLUGINS
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
git clone --depth 1 https://github.com/junegunn/fzf.vim.git ~/.vim/pack/plugins/start/fzf.vim
git clone --depth 1 https://github.com/tpope/vim-fugitive.git ~/.vim/pack/plugins/start/vim-fugitive
git clone --depth 1 https://github.com/vim-ruby/vim-ruby.git ~/.vim/pack/plugins/start/vim-ruby
git clone --depth 1 https://github.com/tpope/vim-commentary.git ~/.vim/pack/plugins/start/vim-commentary
git clone --depth 1 https://github.com/tpope/vim-eunuch.git ~/.vim/pack/plugins/start/vim-eunuch
git clone --depth 1 https://github.com/vim-scripts/matchit.zip.git ~/.vim/pack/plugins/start/matchit.zip
git clone --depth 1 https://github.com/rking/ag.vim.git ~/.vim/pack/plugins/start/ag.vim
git clone --depth 1 https://github.com/tpope/vim-repeat.git ~/.vim/pack/plugins/start/vim-repeat
git clone --depth 1 https://github.com/tpope/vim-surround.git ~/.vim/pack/plugins/start/vim-surround
git clone --depth 1 https://github.com/tpope/vim-unimpaired.git ~/.vim/pack/plugins/start/vim-unimpaired
git clone --depth 1 https://github.com/tpope/vim-rake.git ~/.vim/pack/plugins/start/vim-rake
git clone --depth 1 https://github.com/tpope/vim-rails.git ~/.vim/pack/plugins/start/vim-rails
git clone --depth 1 https://github.com/tpope/vim-bundler.git ~/.vim/pack/plugins/start/vim-bundler
git clone --depth 1 https://github.com/tpope/vim-dispatch.git ~/.vim/pack/plugins/start/vim-dispatch
git clone --depth 1 https://github.com/tpope/vim-endwise.git ~/.vim/pack/plugins/start/vim-endwise
git clone --depth 1 https://github.com/tpope/vim-abolish.git ~/.vim/pack/plugins/start/vim-abolish
git clone --depth 1 https://github.com/thoughtbot/vim-rspec.git ~/.vim/pack/plugins/start/vim-rspec
git clone --depth 1 https://github.com/shioyama/vim-to-github.git ~/.vim/pack/plugins/start/to-github
git clone --depth 1 https://github.com/vim-scripts/ruby.vim.git ~/.vim/pack/plugins/start/ruby.vim

#ln -sf ~/dotfiles/zshrc ~/.zshrc
