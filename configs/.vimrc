let mapleader = " "

set number
set incsearch
set hlsearch

set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set smartindent

colorscheme default

au BufRead,BufNewFile *.tpp  set filetype=cpp

set complete-=i
set tags=./tags,tags;$HOME

" Mappings

inoremap kj <esc>
inoremap jk <esc>

inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

nnoremap <Left> gT
nnoremap <Right> gt

nnoremap Q <NOP>
