" BASIC EDITING CONFIGURATION {{{
"
set nocompatible
filetype off

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

" ref: http://www.readncode.com/blog/resizing-vim-window-splits-like-a-boss/
set winheight=2
set winminheight=2
set spelllang=en_ca,cjk

" set shell=/bin/sh
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" keep more context when scrolling off the end of a buffer
set scrolloff=3

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enable highlighting for syntax
syntax on

" make tab completion for files/buffers act like bash
set wildmenu
set wildignore=tmp/**,log/**,vendor/bundle/**,sorbet/**
let mapleader=","

" don't change current dir
set noautochdir
set complete+=kspell
set lazyredraw
set modelines=1

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" ref: http://superuser.com/questions/248734/when-using-grep-from-vim-how-to-jump-to-results
nmap <silent> <C-N> :cn<CR>zv
nmap <silent> <C-P> :cp<CR>zv

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
" RENAME CURRENT FILE {{{
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>
" }}}
" MAPS TO JUMP TO SPECIFIC TARGETS AND FILES {{{
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline']}, <bang>0)
function! GoDirectory(directory)
  if isdirectory(a:directory)
    exec ":Files ".a:directory
  else
    " for shopify
    if isdirectory("components")
      let args = {'source': 'find $(find components -type d -maxdepth 5 -path */'.a:directory.') -type f' }
      let args.options = ['--ansi', '--prompt', a:directory.' ', '--layout=reverse', '--info=inline']
      call fzf#run(fzf#wrap(args))
    else
      echoerr "No \"".a:directory."\" directory found"
    endif
  endif
endfunction
map <leader>gR :call ShowRoutes()<cr>
map <leader>ga :call GoDirectory("app")<cr>
map <leader>gv :call GoDirectory("app/views")<cr>
map <leader>gc :call GoDirectory("app/controllers")<cr>
map <leader>gm :call GoDirectory("app/models")<cr>
map <leader>gh :call GoDirectory("app/helpers")<cr>
map <leader>gl :call GoDirectory("lib")<cr>
map <leader>gp :call GoDirectory("public")<cr>
map <leader>gf :call GoDirectory("features")<cr>
map <leader>b :Buffers<cr>
function! GoJavascript()
  if isdirectory("app/assets/javascripts")
    :Files app/assets/javascripts
  elseif isdirectory("app/javascript")
    :Files app/javascript
  else
    echoerr "No javascript directory found"
  endif
endfunction
map <leader>gj :call GoJavascript()<cr>
map <leader>gs :call GoDirectory("app/assets/stylesheets")<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>f :Files<cr>
map <leader>F :Files %%<cr>

nnoremap <leader>. :A<cr>
nnoremap <leader>; :AV<cr>
nnoremap <leader>: :AS<cr>
" }}}
" vim:foldmethod=marker:foldlevel=0
