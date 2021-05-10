" BASIC EDITING CONFIGURATION {{{
"
set nocompatible
filetype off

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" highlight current line
set cursorline
set cmdheight=2
set switchbuf=useopen
set numberwidth=5
set showtabline=2
set winwidth=30

" Enable highlighting for syntax
syntax on

" make tab completion for files/buffers act like bash
set wildmenu
set wildignore=tmp/**,log/**,vendor/bundle/**,sorbet/**
let mapleader=","

" }}}
" MISC KEY MAPS {{{
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

map <leader>R :Rg

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" use jj to quickly escape to normal mode while typing
inoremap jj <esc>

" see: https://news.ycombinator.com/item?id=6604904

" Fix vim's terrible default regexp scheme
nnoremap / /\v
vnoremap / /\v
vnoremap ? ?\v
nnoremap ? ?\v

" move vertically by visual line
nnoremap j gj
nnoremap k gk
" }}}
" OPEN FILES IN DIRECTORY OF CURRENT FILE {{{
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%
" }}}
" GIT {{{
nnoremap <leader>di :Gdiff<cr>
nnoremap <leader>D :diffoff!<cr><c-w>h:bd<cr>
nnoremap <leader>st :Gstatus<cr>
nnoremap <leader>add :Gwrite<cr>
nnoremap <leader>ci :Gcommit<cr>
nnoremap <leader>log :Glog<cr>
nnoremap <leader>gb :Git blame<cr>
" }}}
" vim:foldmethod=marker:foldlevel=0
