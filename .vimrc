" Read .bashrc
set shell=bash\ --login

" Auto cd to directory
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Not entirely sure...
set nocompatible

" Shows what you're typing as command
set showcmd

" Syntax
filetype off
syntax enable
syntax on

" Autoindent
set autoindent

" Tabs
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2

" Wrap
set nowrap
set hidden

" Line #
set number

" Ignore case intelligently
set ignorecase
set smartcase

" Incremental search (?)
set incsearch

" Highlight search
set hlsearch

" Color
colorscheme desert

" Between-file state saves
set viminfo='100,<200,s10,h 

filetype plugin indent off

" sets quick timeout for paren matching
let g:matchparen_insert_timeout=5 

" Open file in spot you left it
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" treats ":W" and ":Q" as their lowercase counterparts (no need to let go of shift)
command W w
command Q q

" tells terminal to not intercept <C-Q>
silent !stty -ixon > /dev/null 2>/dev/null
" quick quit
nnoremap <C-q> :q!<CR>

" buffer switching with g
nnoremap gp :bp<CR>
nnoremap gn :bn<CR>
nnoremap gl :ls<CR>
nnoremap gb :ls<CR>:b

" for a.vim - finds counterpart 'h'->'c' files
nnoremap <C-h> :A<CR>

" run (requires amake)
nnoremap <C-r> :!amake run<CR>

" test (requires amake)
nnoremap <C-t> :!amake test<CR>

" remove highlights
nnoremap <Space> :nohl

