" Initialize plugin system
call plug#begin('$HOME/.vim/plugged')

" NVIM PLUGINS
Plug 'neovim/nvim-lspconfig'
Plug 'tami5/lspsaga.nvim'
"Plug 'folke/lsp-colors.nvim'
"Plug 'folke/trouble.nvim'

" VIM PLUGINS
Plug 'junegunn/vim-plug'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-rhubarb'
Plug 'thoughtbot/vim-rspec'
Plug 'itchyny/lightline.vim'

call plug#end()

set nocompatible
