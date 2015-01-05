" Read .bashrc
" set shell=bash\ --login

" Auto cd to directory
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" vim, not vi
set nocompatible

" Shows what you're typing as command
set showcmd

" Syntax
filetype on
syntax enable
syntax on

" Disallow auto-inserted comments (hitting enter on comment line won't create another one)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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

" Incremental search
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

" leave insert mode auto-saves
au InsertLeave * if &mod && expand('%')!=''|write|endif

" leave insert mode quickly
set timeout timeoutlen=1000 ttimeoutlen=100

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

" saves/quits all without warning (even if 'unvisited buffers' exist)
nnoremap ZZ :wqa!<CR>

" split window handling
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_

" for a.vim - finds counterpart 'h'->'c' files
nnoremap <C-a> :A<CR>

" go (requires amake)
nnoremap <C-g> :!amake<CR>

" remove highlights
nnoremap <Space> :nohl<CR>

" show whitespace
set list listchars=tab:¬-,trail:·,eol:↵
highlight NonText ctermfg=236

" gcc error traversal
nnoremap [q :cprevious<CR>
nnoremap ]q :cnet<CR>

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'octol/vim-cpp-enhanced-highlight'

call vundle#end()

